USE sql_store;
/*
Task 1 - 
Created and addded a discount factor.
So added a column to the customers table to show a discount header displaying ('points' + 10) *100, as its value.
*/
SELECT 
    last_name,
    first_name,
    points,
    (points + 10) * 100 AS discount_factor
FROM
    customers
-- WHERE CUSTOMER_ID=1
ORDER BY first_name;

/*
Task 2 -
Showing all the products in the database and the original price.
Adding a new column displaying the new prices of products, 
which is a 10% increase from the original price
*/
SELECT 
    name, unit_price, unit_price * 1.1 AS new_price
FROM
    products;
    
/*
Task 3 -
Displaying all the customers that have the birth date 1st January 1990.
*/
SELECT 
    first_name, last_name
FROM
    customers
WHERE
	birth_date = '1990-01-01';
    
/*
Task 4 -
Finding out the name of the product with most amount in stock.
*/

USE sql_inventory;
SELECT 
    name, quantity_in_stock
FROM
    products
WHERE
    quantity_in_stock = (SELECT 
            MAX(quantity_in_stock)
        FROM
            products);
/*
Task 5 -
Finding out the name of the most expensive product.
*/

SELECT 
    name, unit_price
FROM
    products
WHERE
    unit_price = (SELECT 
            MAX(unit_price)
        FROM
            products);
            
/*
Task 6 -
Finding out the first name, last name, address and the birthdate of the oldest customer.
*/

USE sql_store;
SELECT 
    first_name, last_name, address, birth_date
FROM
    customers
WHERE
    birth_date = (SELECT 
            MIN(birth_date)
        FROM
            customers);