from flask import Flask, render_template, request, redirect, url_for, session, jsonify, flash
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
import sql
import json
from werkzeug.urls import url_parse
import const

app = Flask(__name__)

# Configure secret key for sessions
app.config['SECRET_KEY'] = 'your-secret-key'

# Setup Flask-Login
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login' # Specify the name of the login view

# User class for flask-login to handle users
class User(UserMixin):
    def __init__(self, id, username, usergroup, id_shopper):
        self.id = id
        self.username = username
        self.usergroup = usergroup
        self.id_shopper = id_shopper

@login_manager.user_loader
def load_user(account_id):
    # Note this method implies that the user has ALREADY BEEN AUTHENTICATED WITH PASSWORD
    # Fetch the result
    user = sql.get_account_by_accountid(account_id)
    if user:
        return User(user["idAccount"], user["Username"], user["idUsergroup"], user["idShopper"])

# Home view
@app.route('/')
def home():
    return render_template('home.html', current_user=current_user)

import hashlib

def compute_md5_hash(string):
    md5_hash = hashlib.md5()
    # The md5 function requires a bytes-like object.
    # So we need to encode the string before hashing.
    md5_hash.update(string.encode('utf-8'))
    digest = md5_hash.hexdigest()
    return digest

@app.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        next_page = session.pop('next', url_for('home'))  # default to 'home' if 'next' is None
        return redirect(next_page)
    
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        hashed_password = compute_md5_hash(password)

        user = sql.is_username_password(username, hashed_password)

        # Check if user exists and password is correct
        if user:  # Note: NEVER store passwords in plain text
            user_obj = User(user["idAccount"], user["Username"], user["idUsergroup"], user["idShopper"])
            login_user(user_obj)
            next_page = session.pop('next', url_for('home'))  # get 'next' from the session and default to 'home' if 'next' is None
            sql.insert_audit_logon(user["idAccount"])
            return redirect(next_page)
        else:
            error = 'Invalid username or password'

    return render_template('login.html', error=error)


# Logout view
@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('home'))

@app.route('/products')
def products():
    if current_user.is_authenticated:
        products = sql.call_stored_procedure('get_products_by_usergroup', (current_user.usergroup, ))
    else:
        products = sql.call_stored_procedure('get_products_by_usergroup', (const.GUEST, ))

    # Render the products page with the retrieved products
    return render_template('products.html', data=products)

@app.route('/add_product', methods=['POST'])
@login_required
def add_product():
    product_details = request.json
    product_name = product_details.get('product_name')
    description = product_details.get('description')
    product_image = product_details.get('product_image')
    price = product_details.get('price')
    active = product_details.get('is_active')
    id_department = product_details.get('id_department')

    result = sql.insert_product(product_name, description, product_image, price, active, id_department)

    if result:
        action_string = "product_name={}, description={}, product_image={}, price={}, active={}, id_department={}".format(product_name, description, product_image, price, is_active, id_department)
        sql.insert_audit_employee(current_user.id, "INSERT", None, action_string)

    return jsonify({'result': result})

@app.route('/update_product', methods=['POST'])
@login_required
def update_product():
    data = request.json
    product_id = data['idProduct']
    name = data['name']
    description = data['description']
    active = data['active']
    sale_start = data['salestart']
    sale_end = data['saleend']
    sale_price = data['saleprice']

    if not sale_start:
        sale_start = None
    if not sale_end:
        sale_end = None
    if not sale_price:
        sale_price = None


    res = sql.update_product(product_id, name, description, active, sale_start, sale_end, sale_price)

    if res:
        action_string = "product_name={}, description={}, active={}, sale_start={}, sale_end={}, sale_price={}".format(name, description, active, sale_start, sale_end, sale_price)
        sql.insert_audit_employee(current_user.id, "UPDATE", None, action_string)
        return jsonify({'success': True})
    else:
        return jsonify({'failed to update': True})

@app.route('/checkout')
def checkout():
    if not current_user.is_authenticated:
        # Retrieve the 'next' parameter
        next_url = request.args.get('next')
        if next_url is None:
            next_url = request.url
        return redirect(url_for('login', next=next_url)) # pass current url as next parameter

    shopper_id = current_user.id_shopper
    shopper = sql.get_shopper_by_shopperid(shopper_id)
    checkout = sql.get_checkout_by_shopperid(shopper_id)
    return render_template('checkout.html', shopper_details=shopper, checkout=checkout)

@app.route('/insert_checkout', methods=['GET', 'POST'])
def insert_checkout():
    if request.method == 'POST':
        if not session.get('cart'):
            session['cart'] = request.get_json()
        if not current_user.is_authenticated:
            session['next'] = '/checkout'
            return redirect(url_for('login')) # pass current url as next parameter
    elif request.method == 'GET':
        if not current_user.is_authenticated:
            session['next'] = '/checkout'
            return redirect(url_for('login')) # pass current url as next parameter

    data = session.pop('cart', None)
    id_shopper = current_user.id_shopper
    cart_items = data['cart_items']

    # Convert cart_items to JSON string to store in the CartDetails field
    cart_details_json = json.dumps(cart_items)

    # Call the stored procedure to insert the data
    res = sql.insert_checkout(id_shopper, cart_details_json)

    if res:
        return redirect(url_for('checkout')) 
    else:
        return jsonify({'failed to insert checkout': True})


@app.route('/submit_checkout', methods=['POST'])
def submit_checkout():
    # Get data from form
    data = request.form

    hashed_card_number = compute_md5_hash(data['billingCardNumber'])[:32]

    # Call the stored procedure
    sql.insert_basket([
        current_user.id_shopper,
        0,
        data['shippingFirstName'],
        data['shippingLastName'],
        data['shippingAddress'],
        data['shippingCity'],
        data['shippingState'],
        data['shippingZipCode'],
        data['shippingPhone'],
        data['shippingFax'],
        data['shippingEmail'],
        data['shippingProvince'],
        data['shippingCountry'],
        data['billingFirstName'],
        data['billingLastName'],
        data['billingAddress'],
        data['billingCity'],
        data['billingState'],
        data['billingZipCode'],
        data['billingPhone'],
        data['billingFax'],
        data['billingEmail'],
        data['billingProvince'],
        data['billingCountry'],
        data['billingCardType'],
        hashed_card_number,
        data['billingExpMonth'],
        data['billingExpYear'],
        data['billingCardName']
    ])

    # Redirect to a success page or wherever you want
    return redirect(url_for('baskets'))

@app.route('/get_departments')
@login_required
def get_departments():
    departments = sql.get_departments()
    return jsonify(departments)

@app.route('/baskets')
@login_required
def baskets():
    if current_user.usergroup not in [const.ADMIN, const.EMPLOYEE, const.SHOPPER]:
        return "Unauthorized", 403

    results = sql.get_baskets(current_user)
    baskets = []
    for result in results:
        baskets.append(result)

    # Render template
    return render_template('baskets.html', baskets=baskets)

@app.route('/basket/<int:idBasket>')
@login_required
def basketitems(idBasket):
    if current_user.usergroup == 4:
        basket_owner = sql.is_basket_owner_by_basketid_and_shopperid(idBasket, current_user.id_shopper)
        basket_owner_id = basket_owner['idShopper']

        # Check if the logged-in user owns the basket or has permission
        if current_user.id_shopper != basket_owner_id:
            return "Unauthorized", 403
    elif current_user.usergroup not in [const.ADMIN, const.EMPLOYEE]: 
        return "Unauthorized", 403


    if current_user.usergroup not in [const.ADMIN, const.EMPLOYEE, const.SHOPPER]:
        return "Unauthorized", 403

    # Fetch results
    basket_items = sql.get_basketitems_by_basketid(current_user, idBasket) 
    basket_status = sql.get_basketstatus_by_basketid(current_user, idBasket) 
    return render_template('basket.html', basket_items=basket_items, basket_status=basket_status)

@app.route('/profile')
@login_required
def profile():
    shopper = sql.get_shopper_by_shopperid(current_user.id_shopper)

    # Render the profile.html template with the user data
    return render_template('profile.html', user_data=shopper)

@app.route('/update_profile', methods=['POST'])
@login_required
def update_profile():
    if request.form.values():
        res = sql.update_shopper(tuple(request.form.values()))
        if res:
            return jsonify({"message": "Profile successfully updated", "status": "success"})
        else:
            return jsonify({"message": "An error occurred while updating the profile.", "status": "error"})
    

@app.route('/change_password', methods=['POST'])
@login_required
def change_password():
        current_password = request.form.get('current_password')
        hashed_password = compute_md5_hash(current_password)
        account = sql.is_account_by_accountid_and_username_and_password(current_user.id, current_user.username, hashed_password)
        account_id = account['idAccount']

        if current_user.id != account_id:
            return jsonify({"message": "The current password is incorrect", "status": "error"})

        new_password = request.form.get('new_password')
        hashed_password = compute_md5_hash(new_password)

        res = sql.update_account_password(current_user.id, hashed_password)
        if res:
            return jsonify({"message": "Password successfully updated", "status": "success"})
        else:
            return jsonify({"message": "Error occured", "status": "error"})

@app.route('/update_status', methods=['POST', 'GET'])
@login_required
def update_status():
    success = False
    baskets = []
    result = sql.get_baskets(current_user)

    for item in result:
        baskets.append(item)

    if request.method == 'POST':
        basketId = request.form['basketId']
        stageId = request.form['stageId']
        notes = request.form['notes']
        shipper = request.form['shipper']
        shippingnum = request.form['shippingnum']

        result = sql.insert_orderstatus(basketId, stageId, notes, shipper, shippingnum)

        if result:
            action_string = "SET stageId={}, notes={}, shipper={}, shippingnum={}".format(stageId, notes, shipper, shippingnum)
            sql.insert_audit_employee(current_user.id, "UPDATE", basketId, action_string)
            success = True

    return render_template('updatestatus.html', success=success, baskets=baskets)

@app.route('/report/purchasereport')
def purchasereport():
    shopper_totals = {}
    if current_user.is_authenticated:
        if current_user.usergroup in [const.ADMIN, const.EMPLOYEE]:
            shopper_totals = sql.call_stored_procedure('get_total_purchase_amt', ())

    # Render the reports page with the total amount report
    return render_template('purchasereport.html', shopper_totals=shopper_totals)


@app.route('/report/all_items_in_stock', methods=['GET', 'POST'])
@login_required
def all_items_in_stock():
    baskets = []
    message = None
    result = None

    if current_user.usergroup in [1,2]:
        result = sql.get_baskets(current_user)
    else:
        result = sql.get_baskets_by_shopper_id(current_user.id_shopper)

    for item in result:
        baskets.append(item)

    if request.method == 'POST':
        shopperId = request.form['basketId']
        result = sql.all_items_in_stock(shopperId)

        if result:
            message = result['message']

    return render_template('allitemsinstock.html', baskets=baskets, message=message)


@app.route('/registerShopper', methods=['GET', 'POST'])
def registerShopper():
    message = None

    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        hashed_password = compute_md5_hash(password) 
        firstname = request.form['firstName']
        lastname = request.form['lastName']
        address = request.form['address']
        city = request.form['city']
        state = request.form['state']
        zipcode = request.form['zipcode']
        phone = request.form['phone']
        email = request.form['email']
        province = request.form['province']
        country = request.form['country']

        result = sql.register_shopper(username, hashed_password, firstname, lastname, address, city, state, zipcode, phone, email, province, country)

        if result['message'] == 'Username in use' or result['message'] == 'Email in use':
            message = result['message'] + ", registration failed"
        else:
            message = "Account Created Successfully"

    return render_template('registerShopper.html', message=message)

@app.route('/audits/logon')
def audits_logon():
    if current_user.is_authenticated:
        if current_user.usergroup == const.ADMIN:
            audit_data = sql.get_audits_logon()

            # Render the reports page with the total amount report
            return render_template('auditslogon.html', audit_data=audit_data)

    return "Unauthorized", 403

@app.route('/audits/employee')
def audits_employee():
    if current_user.is_authenticated:
        if current_user.usergroup == const.ADMIN:
            audit_data = sql.call_stored_procedure('get_audits_employee', ())
            
            # Render the reports page with the total amount report
            return render_template('auditsemployee.html', audit_data=audit_data)

    return "Unauthorized", 403

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)

