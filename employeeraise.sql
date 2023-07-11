/*Business task given: Use data to give which employee get raises based on their sales performance.Bonues will be awarded to those employees who are responsible for the five highest order amounts.
Find columns and tables needed for this business question.*/

/*Tables needed from the database:
Employees, Orders, Order details and Products tables.*/ 
SELECT *
FROM employees

SELECT *
FROM orders

SELECT * 
FROM orderdetails

SELECT *
FROM products

 -- Checked tables for common columns


 -- Used Join statement on the common columns
SELECT lastname, firstname, orders.orderid, products.productid,quantity, price 
FROM employees
	INNER JOIN orders 
    	ON employees.employeeid = orders.employeeid
    INNER JOIN orderdetails 
    	ON orders.orderid = orderdetails.orderid
    INNER JOIN products
    	ON orderdetails.productid = products.productid
 ORDER BY lastname, firstname




--Finding total amount of sales:
SELECT lastname, firstname, orders.orderid, products.productid,quantity, price, sum(quantity * price) AS SalesAmt 
FROM employees
	INNER JOIN orders 
    	ON employees.employeeid = orders.employeeid
    INNER JOIN orderdetails 
    	ON orders.orderid = orderdetails.orderid
    INNER JOIN products
    	ON orderdetails.productid = products.productid
GROUP BY orders.orderid


--Proposed solutions: A list of  employees who have orders with the 5 highest sales amounts.
SELECT lastname, firstname, orders.orderid, products.productid,quantity, price, sum(quantity * price) AS SalesAmt 
FROM employees
	INNER JOIN orders 
    	ON employees.employeeid = orders.employeeid
    INNER JOIN orderdetails 
    	ON orders.orderid = orderdetails.orderid
    INNER JOIN products
    	ON orderdetails.productid = products.productid
GROUP BY orders.orderid
ORDER BY salesamt DESC
LIMIT 5

-- Only three employees will have the top five highest sales amount and only two employees have two of the highest sales.



--Proposed Solution: A list of  5 employees who have order with the highest sales amount.
SELECT lastname, firstname, orders.orderid, products.productid,quantity, price, sum(quantity * price) AS SalesAmt 
FROM employees
	INNER JOIN orders 
    	ON employees.employeeid = orders.employeeid
    INNER JOIN orderdetails 
    	ON orders.orderid = orderdetails.orderid
    INNER JOIN products
    	ON orderdetails.productid = products.productid
GROUP BY orders.orderid
HAVING orders.orderid IN (10372, 10423, 10417, 10324, 10351)
ORDER BY salesamt DESC
