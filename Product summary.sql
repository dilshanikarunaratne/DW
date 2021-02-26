USE  course_work3


-- Create Product Table --
CREATE TABLE Product
(
Prod_id					VARCHAR(5) PRIMARY KEY,
Description				VARCHAR(50),
Qty_in_hand				INT,
Unit_price				INT,
Prod_type				VARCHAR(50),
Prod_cat				VARCHAR(40),
Sales					INT
)


-- Insert data into Product table --
INSERT INTO [dbo].Product (
	[Prod_id], [Description], [Qty_in_hand], [Unit_price],  [Prod_cat], [Prod_type], [Sales])
VALUES ('P01', 'Dove Milk Body Lotion', 139, 1000, 'Body Lotion', 'Personal Care', 2490 ),
('P02', 'Dove Soap', 340, 300, 'Soap', 'Personal Care', 15000 ),
('P03', 'Diva Ditergent', 56, 490, 'Laundry Ditergent', 'Household', 4900 ),
('P04', 'Laureal Shampoo', 11, 900, 'Shampoo', 'Personal Care', 2700 ),
('P05', 'Milo Milk Packet', 450, 60, 'Milk Packet', 'Diary', 4800 ),
('P06', 'Kotmale Fresh Milk', 300, 250, 'Fresh Milk', 'Diary', 15000 ),
('P07', 'Cheddar Cheese', 29, 1250, 'Cheese', 'Diary', 1250 ),
('P08', 'Vim Dishwash Liquid', 134, 350, 'Dishwash', 'Household', 7000 ),
('P09', 'Harpic Power Cleaner', 167, 375, 'Toilet Cleaner', 'Household', 5625 ),
('P10', 'Sunsilk Hair Fall Solution', 56, 325, 'Shampoo', 'Personal Care', 8125 ),
('P11', 'Signal Toothpaste', 356, 80, 'Toothpaste', 'Personal Care', 8000 ),
('P12', 'Closeup Toothpaste', 200, 100, 'Toothpaste', 'Personal Care', 700 ),
('P13', 'Natures Aloe Vera Body Lotion', 35, 690, 'Body Lotion', 'Personal Care', 1380 ),
('P14', 'Lux Soft Touch Soap', 146, 70, 'Soap', 'Personal Care', 3500 ),
('P15', 'Surf Excel Washing Powder', 57, 400, 'Ditergent', 'Household', 2800 ),
('P16', 'Kotmale Salted Butter', 34, 300, 'Butter', 'Diary', 900 ),
('P17', 'Happy Cow Cheese Wedges', 21, 1500, 'Cheese Wedges', 'Diary', 1500 ),
('P18', 'Baby Cheramy Floral Baby Cream', 101, 200, 'Baby Cream', 'Baby Products', 1000 ),
('P19', 'Pears Baby Colonge', 89, 170, 'Baby Colonge', 'Baby Products', 1360 ),
('P20', 'Cerelac Mixed Fruit Cereal', 54, 400, 'Baby Cereal', 'Baby Products', 800 )

SELECT * FROM [dbo].Product

--question 1--
-- Summary for the hierarchy -- 
 SELECT Prod_type, Prod_cat, Description AS Product, SUM(Sales) AS Total_Sales
 FROM dbo.Product
 GROUP BY ROLLUP (Prod_type, Prod_cat, Description)

 --question 2--
 -- Summary for every combination of Product Type, Product Categorty and Product --
 SELECT Prod_type, Prod_cat, Description AS Product, SUM(Sales) AS Total_Sales
 FROM dbo.Product
 GROUP BY CUBE (Prod_type, Prod_cat, Description)