import unittest
import sql

class TestDatabase(unittest.TestCase):

    def setUp(self):
        # Connect to the database
        self.connection = sql.create_connection()
        self.cursor = self.connection.cursor(dictionary=True)

    def tearDown(self):
        # Close connections
        self.cursor.close()
        self.connection.close()

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



    def call_stored_procedure(self, proc_name, args, fetchone=False, update=False):
        try:
            # Call the stored procedure
            self.cursor.callproc(proc_name, args)
            self.connection.commit()  # Commit the transaction

            if fetchone:
                for result in self.cursor.stored_results():
                    return result.fetchone()
            elif update:
                return
            else:
                #return self.cursor.stored_results().fetchall()
                results = []
                for result in self.cursor.stored_results():
                    results.extend(result.fetchall())
                return results
        except Exception as ex:
            print("An error occurred: ", str(ex))
            self.connection.rollback()  # Rollback the transaction
            return None

    def test_is_username_password_valid(self):
        # Test a valid username/password combination
        temp = self.call_stored_procedure('is_username_password', ('Crackj', '1a1dc91c907325c69271ddf0c944bc72'), fetchone=True)
        result = temp != None
        self.assertEqual(result, True)

    def test_is_username_password_invalid(self):
        # Test an invalid username/password combination
        temp = self.call_stored_procedure('is_username_password', ('Crackj', 'invalidpass'), fetchone=True)
        result = temp != None
        self.assertEqual(result, False)

    def test_update_shopper(self):
        # Test updating shopper fields
        shopper = self.call_stored_procedure('test_shopper_reset', (), fetchone=False, update=True)
        original = {
                'idShopper': 61, 
                'FirstName': 'Fake', 
                'LastName': 'User', 
                'Address': '123 Main street', 
                'City': 'FakeCity', 
                'State': 'CA', 
                'ZipCode': '23456', 
                'Phone': '6477400000', 
                'Fax': None, 
                'Email': 'fakeuser@fakemail.com', 
                'Province': None, 
                'Country': 'USA', 
                'Promo': None, 
        }
        modified = {
                'idShopper': 61, 
                'FirstName': 'John', 
                'LastName': 'Smith', 
                'Address': '1 Long Branch', 
                'City': 'Las Vegas', 
                'State': 'VA', 
                'ZipCode': '24689', 
                'Phone': '0987654321', 
                'Fax': None, 
                'Email': 'john@smith.org', 
                'Province': None, 
                'Country': 'CANADA', 
                'Promo': None, 
        }

        values_tuple = tuple(modified.values())
        self.call_stored_procedure('update_shopper', values_tuple, fetchone=False, update=True)
        updated = self.call_stored_procedure('get_shopper_by_shopperid', ('61',), fetchone=True)

        # verify results
        for key in modified.keys():
            self.assertEqual(modified[key], updated[key])

        # restore back the original data
        original_tuple = tuple(original.values())
        self.call_stored_procedure('update_shopper', original_tuple, fetchone=False, update=True)
        restored = self.call_stored_procedure('get_shopper_by_shopperid', ('61',), fetchone=True)
        
        for key in original.keys():
            self.assertEqual(original[key], restored[key])

        self.assertEqual(True, True)
    
    def test_update_product(self):
        self.call_stored_procedure('test_product_reset', (), fetchone=None, update=True)
        original = {
          'idProduct': 13,
          'ProductName': 'TestProduct DO NOT DELETE', 
          'Description': 'Test Original Description', 
          'Active': 0,
          'SaleStart': None,
          'SaleEnd': None,
          'SalePrice': None
        }
        modified  = {
          'idProduct': 13, 
          'ProductName': 'TestProduct DO NOT DELETE', 
          'Description': 'Test Modified Description', 
          'Active': 0,
          'SaleStart': None,
          'SaleEnd': None,
          'SalePrice': None
        }
        values_tuple = tuple(modified.values())
        self.call_stored_procedure('update_product', values_tuple, fetchone=False, update=True)
        updated = self.call_stored_procedure('get_product_by_productid', ('13',), fetchone=True)
        
        # verify results
        for key in modified.keys():
            self.assertEqual(modified[key], updated[key])

        # restore back the original data
        original_tuple = tuple(original.values())
        self.call_stored_procedure('update_product', original_tuple, fetchone=False, update=True)
        restored = self.call_stored_procedure('get_product_by_productid', ('13',), fetchone=True)
        
        for key in original.keys():
            self.assertEqual(original[key], restored[key])

        self.assertEqual(True, True)

    def test_insert_product(self):
        from decimal import Decimal
        product = {
            'Name' : 'Roasted Blend',
            'Description' : 'Well-balanced mix of roasted beans, a medium body',
            'ProductImage' : 'roasted.jpg',
            'Price' : Decimal('9.50'),
            'Active' : 1,
            'idDepartment': '1'

        }
        # NOTE I AM DOING AN EXPLICIT QUERY BECAUSE cursor.callproc DOES NOT return lastrowid
        query = "INSERT INTO bb_product (ProductName, Description, ProductImage, Price, Active, idDepartment) VALUES (%s, %s, %s, %s, %s, %s)"
        params = tuple(product.values())
        last_id = self.execute_query_and_get_last_id(query, params)
        self.assertEqual(isinstance(last_id, int), True)
        self.assertEqual(last_id > 0, True)
        
        # To keep the database clean lets immediately delete this product...
        self.call_stored_procedure('delete_product_by_productid', (last_id,), fetchone=False, update=True)

    def test_insert_basketitem(self):
            from decimal import Decimal
            basketitem = {
                'IdProduct' : '8',
                'Price' : Decimal('10.80'),
                'Quantity' : '1',
                'IdBasket' : 14,
                'inOption1' : 2,
                'inOption2': '4'

            }
            # NOTE I AM DOING AN EXPLICIT QUERY BECAUSE cursor.callproc DOES NOT return lastrowid
            query = "INSERT INTO bb_basket_item (idProduct, Price, Quantity, idBasket, option1, option2) VALUES (%s, %s, %s, %s, %s, %s)"
            params = tuple(basketitem.values())
            last_id = self.execute_query_and_get_last_id(query, params)
            self.assertEqual(isinstance(last_id, int), True)
            self.assertEqual(last_id > 0, True)
            
            # To keep the database clean lets immediately delete this product...
            self.call_stored_procedure('delete_basketitem_by_basketitemid', (last_id,), fetchone=False, update=True)


    def test_tax_rates(self):
        dict_va = self.call_stored_procedure('get_tax_by_state_and_amount', ('VA', '100'), fetchone=True, update=False)
        tax_va = dict_va['@AmountWithTax']
        self.assertEqual(tax_va, 4.50)

        dict_nc = self.call_stored_procedure('get_tax_by_state_and_amount', ('NC', '100'), fetchone=True, update=False)
        tax_nc = dict_nc['@AmountWithTax']
        self.assertEqual(tax_nc, 3.00)
        
        dict_sc = self.call_stored_procedure('get_tax_by_state_and_amount', ('SC', '100'), fetchone=True, update=False)
        tax_sc = dict_sc['@AmountWithTax']
        self.assertEqual(tax_sc, 6.00)


    def test_get_sale_info(self):
        test_jun10_list = self.call_mysql_function('get_sale_info', ('6', '2012-06-10'))
        test_jun10_dict = test_jun10_list[0]
        test_jun10_val = list(test_jun10_dict.values())[0]
        self.assertEqual(test_jun10_val,1)

        test_jun19_list = self.call_mysql_function('get_sale_info', ('6', '2012-06-19'))
        test_jun19_dict = test_jun19_list[0]
        test_jun19_val = list(test_jun19_dict.values())[0]
        self.assertEqual(test_jun19_val, 0)


    def test_all_items_in_stock(self):
        result = self.call_stored_procedure('all_items_in_stock', ('3', ), fetchone=True, update=True)
        message = result['message']
        self.assertEqual(message, 'All items in stock!')

    def test_all_items_not_in_stock(self):
        result = self.call_stored_procedure('all_items_in_stock', ('16', ), fetchone=True, update=True)
        message = result['message']
        self.assertEqual(message, 'All items NOT in stock!')

    def test_insert_order_status(self):
        result = self.call_stored_procedure('insert_orderstatus', ('3', '3', 'this is a test', 'UPS', '1234'), fetchone=False, update=True)
        self.assertEqual(result, None)

    def test_register_user(self):
        result = self.call_stored_procedure('register_shopper', ('test', '1234', 'mike', 'smith', '1234 Random Street', 'Toronto', '', '1234', '4161234567', 'test@gmail.com', 'ON', 'Canada'), fetchone=True, update=False)
        message = result['message']
        self.assertEqual(message, 'Success')
        self.call_stored_procedure('delete_user_by_email_and_username', ('test', 'test@gmail.com'), fetchone=False, update=True)

    def test_register_user_same_username(self):
        result = self.call_stored_procedure('register_shopper', ('Smith', '1234', 'mike', 'smith', '1234 Random Street', 'Toronto', '', '1234', '4161234567', 'test2@gmail.com', 'ON', 'Canada'), fetchone=True, update=False)
        message = result['message']
        self.assertEqual(message, 'Username in use')

    def test_register_user_same_email(self):
        result = self.call_stored_procedure('register_shopper', ('test3', '1234', 'mike', 'smith', '1234 Random Street', 'Toronto', '', '1234', '4161234567', 'Crackjack@aol.com', 'ON', 'Canada'), fetchone=True, update=False)
        message = result['message']
        self.assertEqual(message, 'Email in use')

    def test_get_purchase_amt_by_shopperid(self):
        test_single_shopper_id_list = self.call_mysql_function('get_purchase_amt_by_shopperid', (25,))
        test_single_shopper_id_dict = test_single_shopper_id_list[0]
        test_single_shopper_id_val = list(test_single_shopper_id_dict.values())[0]
        self.assertEqual(test_single_shopper_id_val,329.22)

    def test_get_total_purchase_amt(self):
        # first test get_purchase_amt_by_shopperid for all listed shoppers in bb_shopper
        try:
            # Create SQL statement to call the function
            sql = f"SELECT idShopper FROM bb_shopper;"
            args = []
            self.cursor.execute(sql, args)
            return_vals = self.cursor.fetchall()
            shopper_ids = [d['idShopper'] for d in return_vals]
        except Exception as ex:
            print("An error occurred: ", str(ex))
            self.connection.rollback()  # Rollback the transaction
            shopper_ids = []

        # get the individual purchase amounts for each shopper
        exp_results_dict = {}
        for shopper_id in shopper_ids:
            single_shopper_id_list = self.call_mysql_function('get_purchase_amt_by_shopperid', (shopper_id,))
            single_shopper_id_dict = single_shopper_id_list[0]
            exp_results_dict[shopper_id] = list(single_shopper_id_dict.values())[0]

        # fetch results using get_total_purchase_amt
        response_list = self.call_stored_procedure('get_total_purchase_amt', ())
        result = {}
        for item in response_list:
            shopper_id = item['idShopper']
            shopper_spend = item['total_purchase_amt']
            result[shopper_id] = shopper_spend

        self.assertEqual(result,exp_results_dict)


if __name__ == '__main__':
    unittest.main(verbosity=2)


