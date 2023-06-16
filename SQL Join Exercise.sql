/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 
select products.Name, categories.Name from products
inner join categories on categories.CategoryID = products.CategoryID
where categories.Name = "Computers";
     
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 
 select p.Name, p.Price, r.Rating from products as p
 inner join reviews as r on r.ProductID = p.ProductID
 where r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

select employees.FirstName, employees.LastName, Sum(sales.Quantity) as total from sales
inner join employees on employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID order by Total DESC limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
    
select departments.Name as 'Department', categories.Name as 'Category'from departments
inner join categories on categories.DepartmentID = departments.DepartmentID
where categories.Name = 'Appliances' or categories.Name = 'Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 select products.Name, Sum(sales.Quantity) as 'Total # sold', Sum(sales.Quantity * sales.PricePerUnit) as 'Total Price Sold' from products
 left join sales on sales.ProductID = products.ProductID
 where productID = 97;
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

select products.Name as 'Prod Name', products.ProductID as 'product id', reviews.Reviewer as 'Reviewer', reviews.Rating as 'Rating', reviews.Comment as 'Comment' from products
left join reviews on reviews.ProductID = products.ProductID
where reviews.ProductID = 857 order by Rating ASC limit 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

select employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sales.Quantity from employees
left join sales on sales.EmployeeID = employees.EmployeeID
left join products on products.ProductID = sales.ProductID;
