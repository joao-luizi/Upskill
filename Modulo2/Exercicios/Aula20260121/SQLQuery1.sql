USE Northwind

SELECT ProductName, CategoryName FROM Products 
LEFT Join Categories ON Products.CategoryID = Categories.CategoryID
