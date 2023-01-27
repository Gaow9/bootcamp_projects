/*
You are restaurant owner
  สร้างอย่างน้อย 5 Table : 1 Fact 4 Dim
  search google how to add foreign key
  write SQL 3-5 queries analyze data
  1x subquery/ with
*/
--SQLite command
.mode markdown
.header on
  
--Fact Table
CREATE TABLE orders (
  orderID INT primary key not null,
  orderDate DATE,
  foodID INT,
  orderAmount INT,
  branchID INT,
  staffID INT,
  customerID INT,
  foreign key (foodID) references foods (foodsID)
  foreign key (branchID) references branches (branchID)
  foreign key (staffID) references staffs (staffID)
  foreign key (customerID) references customers (customerID)
);

Insert into orders values
  /*
  ID    DATE  Food Amount Branch Staff Customer
*/
(1,'2022-08-01',1,2,1,11,101),
(2,'2022-08-02',2,5,2,21,201),
(3,'2022-08-02',3,3,1,12,102),
(4,'2022-08-10',2,3,2,22,202),
(5,'2022-08-14',1,2,1,11,103),
(6,'2022-08-14',3,1,2,21,203),
(7,'2022-08-18',3,2,2,22,202),
(8,'2022-08-18',1,3,1,12,101),
(9,'2022-08-23',3,2,1,11,102),
(10,'2022-08-27',2,5,2,21,203)
  /*,
-- add order 2 to maximum for female
(11,'2022-08-28',2,50,2,22,202),
-- add order 3 to maximum for male
(12,'2022-08-29',3,50,1,11,101)
  */;


-- Dimension Table 1 foods
CREATE TABLE foods (
  foodID INT primary key not null,
  foodName CHAR,
  foodCost REAL,
  foodPrice REAL
);

Insert into foods values
/*
  ID Name Cost Price
*/
(1,'Pizza',2,5),
(2,'Sandwich',1.5,4),
(3,'Salad',1,1.5);

--Dimension Table 2 branches
CREATE TABLE branches (
  branchID INT primary key,
  branchLocation CHAR
);

Insert into branches values
/*
ID Name 
*/
(1,'BKK'),
(2,'LDN');

--Dimension Table 3 staffs
CREATE TABLE staffs (
  staffID INT primary key,
  staffName CHAR
);
  
-- staffID = branchesID+Staff's ID (1 digit)
Insert into staffs values
 /* 
 ID  Name
  */ 
(11,'SOMCHAI'),
(12,'SOMYING'),
(21,'JOHN'),
(22,'MARIE');

--Dimension Table 4 customers
CREATE TABLE customers (
  customerID INT primary key,
  customerName CHAR,
  customerGender CHAR
);

-- customerID = branchesID+Customer's ID (2 digits)
Insert into customers values
  /* 
 ID  Name  Gender
  */ 
(101,'DANG','M'),
(102,'KEAW','F'),
(103,'YING','F'),
(201,'STEVE','M'),
(202,'SOPHIA','F'),
(203,'THOMAS','M');


-- Profit in each order by branches 

SELECT 
  orderID,
  f.foodName,
  orderAmount AS Amount,
  branchID,
  f.foodPrice,
  f.foodCost,
  (f.foodPrice-f.foodCost)*orderAmount AS Profit
FROM orders AS o 
JOIN foods AS f
  ON o.foodID = f.foodID
ORDER BY 4,1; 


-- Revenue per Staff
SELECT 
  s.staffID,
  staffName,
  sum (f.foodPrice*orderAmount) AS Revenue
FROM staffs AS s
JOIN orders AS o
JOIN foods AS f
  where o.staffID = s.staffID
  AND o.foodID = f.foodID
Group by s.staffID
ORDER BY 1;

-- Popular  food by gender  

WITH sales AS (
  SELECT
  c.customerGender AS customerGender,
  f.foodName AS foodName,
  sum(o.orderAmount) AS sumAmount
  FROM orders AS o
  JOIN foods AS f
  JOIN customers AS C
  where o.foodID = f.foodID
  AND o.customerID = c.customerID
  GROUP BY customerGender, f.foodName
  Order by 1,3 DESC
  )

SELECT 
  c.customerGender,
  sales.foodName,
  Max(sales.sumAmount) AS Sales
FROM customers AS c
JOIN sales
where c.customergender = sales.customerGender
GROUP BY c.customerGender
;


 --Recheck Popular food by Gender 

/*SELECT
  c.customerGender AS customerGender,
  f.foodName AS foodName,
  sum(o.orderAmount) AS sumAmount
FROM orders AS o
JOIN foods AS f
JOIN customers AS C
where o.foodID = f.foodID
AND o.customerID = c.customerID
GROUP BY customerGender, f.foodName
Order by 1,3 DESC
;
*/