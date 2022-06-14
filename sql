SELECT COUNT(*), Orders.shipperid, Shippers.shippername
FROM Orders
INNER JOIN Shippers ON Orders.shipperID=Shippers.shipperID
WHERE Shippers.shippername = "Speedy Express";

WITH employee_max_orders AS (SELECT COUNT(*) AS order_count, Orders.employeeid
FROM Orders
GROUP BY Orders.employeeid
ORDER BY order_count DESC LIMIT 1)

SELECT Employees.LastName
FROM employee_max_orders JOIN Employees ON Employees.Employeeid = employee_max_orders.employeeid;

SELECT COUNT(*) count, Products.productid, Products.productname, Customers.country from products
JOIN OrderDetails ON OrderDetails.productid = products.productid
JOIN Orders ON OrderDetails.orderid = Orders.orderid
JOIN Customers ON Customers.customerid = Orders.customerid
Where Customers.country = 'Germany'
GROUP BY Products.productid
ORDER BY count DESC
LIMIT 1;