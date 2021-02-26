use azuredb1

CREATE TABLE Dim_product
(
Prod_id					VARCHAR(5),
Description				VARCHAR(50),
Measure_unit			VARCHAR(10),
Qty_in_hand				INT,
Prod_type				VARCHAR(5),
Type_description		VARCHAR(50),
Prod_cat				VARCHAR(10),
Category_description	VARCHAR(30) 
)

select* from Dim_product


CREATE TABLE Customer
(
Customer_id				VARCHAR(5) PRIMARY KEY,
Cust_name				VARCHAR(70),
Cust_address			VARCHAR(70),
State					VARCHAR(30),
City					VARCHAR(30),
Country					VARCHAR(20),
Seg_id					VARCHAR(5)
)

INSERT INTO [dbo].Customer (
	[Customer_id], [Cust_name], [Cust_address], [State], [City], [Country], [Seg_id])
VALUES ('C01', 'Micheal Perera', '42/B, Egoda Road, Kiribathgoda', 'Western', 'Gampaha', 'Sri Lanka', 'S01'),
('C02', 'Sunil Pieris', '21, Temple Street, Maharagama', 'Western', 'Colombo', 'Sri Lanka', 'S02'),
('C03', 'Dihely Amaratunga', '3/D, 3rd Lane, Kottawa', 'Western', 'Colombo', 'Sri Lanka', 'S01'),
('C04', 'Kasun Subasinghe', '160/2, Poorwarama Mawatha, Kirulapone ', 'Western', 'Colombo', 'Sri Lanka', 'S03'),
('C05', 'Vishal Kariyawasam', '2/B, Salmal Lane, Ja-ela', 'Western', 'Gampaha', 'Sri Lanka', 'S03'),
('C06', 'Ameli Perera', '87/1, Janatha Mawatha, Panadura', 'Western', 'Kalutara', 'Sri Lanka', 'S01'),
('C07', 'Heshal Silva', '34, Pagoda Road, Nawala', 'Western', 'Colombo', 'Sri Lanka', 'S02'),
('C08', 'Roshel Wikcremasinghe', '45/3, Horana Road, Horana', 'Western', 'Kalutara', 'Sri Lanka', 'S02')

