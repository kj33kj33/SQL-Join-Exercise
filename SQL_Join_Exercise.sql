USE bestbuy;

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name FROM products 
JOIN categories ON products.CategoryID = categories.CategoryID 
WHERE categories.Name = 'computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating FROM products 
JOIN reviews ON products.ProductID = reviews.ProductID 
WHERE reviews.Rating = '5';

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT SUM(s.Quantity) as 'Quantity Sold', e.FirstName, e.LastName, s.employeeid FROM sales as s
JOIN employees as e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY SUM(s.Quantity) DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name, c.Name FROM categories as c
JOIN departments as d ON d.DepartmentID = c.DepartmentID
WHERE c.Name IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) as 'Total Sold', SUM(s.Quantity * s.PricePerUnit) as 'Dollar Amount' FROM products as p
JOIN sales as s ON p.ProductID = s.ProductID
Where p.Name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. 
(only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment FROM products as p
JOIN reviews as r ON p.ProductID = r.ProductID
WHERE p.ProductID = 857
ORDER BY r.Rating
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.employeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) as 'Total Sold' FROM employees as e
JOIN sales as s ON e.EmployeeID = s.EmployeeID
JOIN products as p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY p.ProductID;
