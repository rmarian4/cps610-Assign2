import mysql.connector
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# MySQL connection parameters
config = {
    "host": os.getenv("MYSQL_HOST"),
    "user": os.getenv("MYSQL_USER"),
    "password": os.getenv("MYSQL_PASSWORD"),
    "database": os.getenv("MYSQL_DB")
}

# config = {
#     "host":"localhost",
#     "user":"root",
#     "password": "",
#     "database":"brewery"
# }

def create_connection():
    return mysql.connector.connect(**config)

def execute_query(query, params=None):
    connection = create_connection()
    cursor = connection.cursor(dictionary=True)

    try:
        cursor.execute(query, params)
        result = cursor.fetchall()
        return result
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None
    finally:
        cursor.close()
        connection.close()

def execute_query_and_get_last_id(self, query, params):
        try:
            self.cursor.execute(query, params)
            self.connection.commit()  # Commit the transaction
            return self.cursor.lastrowid  # This will return the last inserted ID
        except Exception as ex:
            print("An error occurred: ", str(ex))
            self.connection.rollback()  # Rollback the transaction
            return None

def call_mysql_function(self, func_name, args, fetchone=False):
    try:
        # Create SQL statement to call the function
        sql = f"SELECT {func_name}({', '.join('%s' for _ in args)});"
        
        # Execute the SQL statement
        self.cursor.execute(sql, args)

        if fetchone:
            # Fetch the result
            result = self.cursor.fetchone()
            return result
        else:
            return self.cursor.fetchall()
    except Exception as ex:
        print("An error occurred: ", str(ex))
        self.connection.rollback()  # Rollback the transaction
        return None

def call_stored_procedure(proc_name, params=(), fetchone=False, update=False):
    connection = create_connection()
    cursor = connection.cursor(dictionary=True)

    try:
        cursor.callproc(proc_name, params)
        connection.commit()  # Commit the transaction
        if fetchone:
            for result in cursor.stored_results():
                return result.fetchone()
        elif update:
            return True
        else:
            results = []
            for result in cursor.stored_results():
                results.extend(result.fetchall())
            return results

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        connection.rollback()  # Rollback the transaction
        return None

    finally:
        cursor.close()
        connection.close()
    return True

def is_account_by_accountid_and_username_and_password(account_id, username, password):
    return call_stored_procedure('is_account_by_accountid_and_username_and_password', (account_id, username, password), fetchone=True, update=False)

def is_username_password(username, password):
    return call_stored_procedure('is_username_password', (username, password), fetchone=True, update=False)

def is_basket_owner_by_basketid_and_shopperid(basket_id, shopper_id):
    return call_stored_procedure('is_basket_owner_by_basketid_and_shopperid', (basket_id, shopper_id), fetchone=True, update=False)

def get_account_by_accountid(account_id):
    return call_stored_procedure('get_account_by_accountid', (account_id,), fetchone=True, update=False)

def get_shopper_by_shopperid(shopper_id):
    return call_stored_procedure('get_shopper_by_shopperid', (shopper_id,), fetchone=True, update=False)

def get_checkout_by_shopperid(shopper_id):
    return call_stored_procedure('get_checkout_by_shopperid', (shopper_id,), fetchone=True, update=False)

def get_departments():
    return call_stored_procedure('get_departments', (), fetchone=False, update=False)

def get_baskets(current_user):
    if current_user.usergroup == 1 or current_user.usergroup == 2:
        return call_stored_procedure('get_baskets_by_admin', (), fetchone=False, update=False)
    elif current_user.usergroup == 4:
        return call_stored_procedure('get_baskets_by_shopperid', (current_user.id_shopper,), fetchone=False, update=False)

def get_basketitems_by_basketid(current_user, basket_id):
    if current_user.usergroup == 1 or current_user.usergroup == 2:
        return call_stored_procedure('get_basketitems_by_basketid_full', (basket_id, ), fetchone=False, update=False)
    elif current_user.usergroup == 4:
        return call_stored_procedure('get_basketitems_by_basketid_shopper', (basket_id, ), fetchone=False, update=False)

def get_basketstatus_by_basketid(current_user, basket_id):
    if current_user.usergroup == 1 or current_user.usergroup == 2:
        return call_stored_procedure('get_basketstatus_by_basketid_full', (basket_id, ), fetchone=False, update=False)
    elif current_user.usergroup == 4:
        return call_stored_procedure('get_basketstatus_by_basketid_shopper', (basket_id, ), fetchone=False, update=False)

def update_product(product_id, name, description, active, sale_start, sale_end, sale_price):
    return call_stored_procedure('update_product', (product_id, name, description, active, sale_start, sale_end, sale_price), fetchone=False, update=True)

def update_shopper(params):
    return call_stored_procedure('update_shopper', (*params, ), fetchone=False, update=True)

def update_account_password(account_id, new_password):
    return call_stored_procedure('update_account_password', (account_id, new_password), fetchone=False, update=True)

def insert_product(product_name, description, product_image, price, is_active, id_department):
    return call_stored_procedure('insert_product', (product_name, description, product_image, price, is_active, id_department), fetchone=False, update=False)

def insert_checkout(shopper_id, cart_details_json):
    return call_stored_procedure('insert_checkout', (shopper_id, cart_details_json), fetchone=False, update=False)

def insert_basket(basket_data):
    return call_stored_procedure('insert_basket', basket_data)

def insert_orderstatus(basketId, stageId, notes, shipper, shippingnum):
    return call_stored_procedure('insert_orderstatus', (basketId, stageId, notes, shipper, shippingnum), fetchone=False, update=True)

def all_items_in_stock(shopper_id):
    return call_stored_procedure('all_items_in_stock', (shopper_id,), fetchone=True, update=True)

def get_baskets_by_shopper_id(shopper_id):
    return call_stored_procedure('get_baskets_by_shopperid', (shopper_id,), fetchone=False, update=False)

def insert_audit_logon(account_id):
    return call_stored_procedure('insert_audit_logon', (account_id, ))

def insert_audit_employee(account_id, type, basket_id, action):
    return call_stored_procedure('insert_audit_employee', (account_id, type, basket_id, action))

def register_shopper(username, password, firstname, lastname, address, city, state, zipcode, phone, email, province, country):
    return call_stored_procedure('register_shopper', (username, password, firstname, lastname, address, city, state, zipcode, phone, email, province, country), fetchone=True, update=False)

def get_audits_logon():
    return call_stored_procedure('get_audits_logon', (), fetchone=False, update=False)

def get_audits_employee():
    return call_stored_procedure('get_audits_employee', (), fetchone=False, update=False)
