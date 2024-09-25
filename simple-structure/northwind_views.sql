CREATE VIEW vwEmployees
AS
(
	SELECT Employee_ID, (Last_Name || First_Name)::text AS Employee_Name, 
		city AS Employee_City, country AS Employee_Country
	FROM Employees
);

CREATE VIEW vwCustomers
AS
(
	SELECT customer_id::VARCHAR(20) AS CustomerID,
		company_name AS CustomerName,
		city AS CustomerCity,
		country AS CustomerCountry,
		contact_title AS CustomerType
	FROM Customers
);

CREATE VIEW vwProducts
AS
(
SELECT P.Product_ID AS ProductID,
	P.Product_Name AS ProductName,
	P.Unit_Price AS ProductPrice,
	C.Category_Name AS ProductCategory,
	S.Company_Name AS SupplierName,
	S.Contact_Title AS SupplierType,
	S.City AS SupplierCity,
	S.Country AS SupplierCountry
FROM Products P
	INNER JOIN Categories C ON P.category_id = C.category_id
	INNER JOIN Suppliers S ON S.supplier_id = P.supplier_id
);

CREATE VIEW vwOrders
AS
(
SELECT ROW_NUMBER() OVER (ORDER BY O.Order_ID, OD.product_ID) AS RowID,
	O.order_id AS OrderID,
	O.order_date AS OrderDate,
	O.customer_id AS CustomerID,
	O.employee_id AS EmployeeID,
	OD.product_id AS ProductID,
	OD.quantity AS ItemQuantity,
	OD.unit_price AS ItemPrice,
	OD.discount AS ItemDiscount,
	(OD.quantity * OD.unit_price)::integer AS ItemAmount,
	ROUND((OD.quantity * OD.unit_price * OD.discount)::numeric, 0) AS ItemDiscountedAmount,
	S.company_name AS ShipperName,
	O.shipped_date AS ShippedDate,
	O.Ship_City AS ShippedCity,
	O.Ship_Country AS ShippedCountry
FROM Orders O
	INNER JOIN Order_Details OD ON O.order_id = OD.order_id
	INNER JOIN Products P ON OD.product_id = P.product_id
	INNER JOIN Shippers S ON O.ship_via = S.shipper_id
);
