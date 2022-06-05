/*Question a: How many orders were shipped by Speedy Express in total?*/

/*Datasets Orders and Shippers have common columns ShipperID. If we join them,
we can easily access the information we need*/

SELECT COUNT(*) AS shipment_count
FROM Orders
JOIN Shippers
	ON Shippers.ShipperID = Orders.ShipperID
WHERE Shippers.ShipperName = 'Speedy Express'


/*Answer: 54*/  


/*Question b: What is the last name of the employee with the most orders?*/

/*For this question, we also need to join to tables (Employees and Orders).
They have the common columns EmplyeeID. Orders will give us the number of orders
and Employees will give us the last name*/

SELECT Employees.LastName 
FROM Employees JOIN ORDERS
	ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY 1
ORDER BY COUNT(Orders.EmployeeID) DESC
LIMIT 1

/*Answer: Peacock*/ 

/*For this question, we can also check how many orders that person made ->*/
SELECT Employees.LastName, COUNT(*) AS countLastName
FROM Employees JOIN ORDERS
	ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
/*Answer Peacock ordered 40 times*/

/*Question c: What product was ordered the most by customers in Germany?*/

/*We need to sum all variebles in Quantity column which is a part of OrderDetails dataset.
We can access the information by merging a few datasets. OrderDetails contains the quantity and product id.
Orders dataset hold the info about customers. Customers dataset reveals the info about the country.
Products dataset has the ProductName which we finally need. */

SELECT Products.ProductName,
    SUM(OrderDetails.Quantity) AS TotalQuantityGE
FROM Orders JOIN OrderDetails
    ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers
    ON Customers.CustomerID = Orders.CustomerID
JOIN Products
    ON Products.ProductID = OrderDetails.ProductID
WHERE Customers.Country = 'Germany'
GROUP BY Products.ProductID
ORDER BY 2 DESC
LIMIT 1

/*Answer: Boston Crab Meat which was ordered 160 times in Germany*/