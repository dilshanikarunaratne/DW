/** Object:  Database [azuredb1]    Script Date: 12/17/2020 9:32:16 PM **/
CREATE DATABASE [azuredb1]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [azuredb1] SET COMPATIBILITY_LEVEL = 140
GO
ALTER DATABASE [azuredb1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [azuredb1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [azuredb1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [azuredb1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [azuredb1] SET ARITHABORT OFF 
GO
ALTER DATABASE [azuredb1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [azuredb1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [azuredb1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [azuredb1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [azuredb1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [azuredb1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [azuredb1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [azuredb1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [azuredb1] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [azuredb1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [azuredb1] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [azuredb1] SET  MULTI_USER 
GO
ALTER DATABASE [azuredb1] SET ENCRYPTION ON
GO
ALTER DATABASE [azuredb1] SET QUERY_STORE = ON
GO
ALTER DATABASE [azuredb1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/* The scripts of database scoped configurations in Azure should be executed inside the target database connection. */
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO

------CREATE SOURCE TABLE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Azure_Customer_Source](
Customer_id				VARCHAR(5) PRIMARY KEY,
Cust_name				VARCHAR(70),
Cust_address			VARCHAR(70),
State					VARCHAR(30),
City					VARCHAR(30),
Country					VARCHAR(20),
Seg_id					VARCHAR(5)
)
GO

------CREATE DESTINATION TABLE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Azure_Customer_Dest](
Customer_id				VARCHAR(5) PRIMARY KEY,
Cust_name				VARCHAR(70),
Cust_address			VARCHAR(70),
State					VARCHAR(30),
City					VARCHAR(30),
Country					VARCHAR(20),
Seg_id					VARCHAR(5)
) 
GO

INSERT INTO [dbo].Azure_Customer_Source (
	[Customer_id], [Cust_name], [Cust_address], [State], [City], [Country], [Seg_id])
VALUES ('C01', 'Micheal Perera', '42/B, Egoda Road, Kiribathgoda', 'Western', 'Gampaha', 'Sri Lanka', 'S01'),
('C02', 'Sunil Pieris', '21, Temple Street, Maharagama', 'Western', 'Colombo', 'Sri Lanka', 'S02'),
('C03', 'Dihely Amaratunga', '3/D, 3rd Lane, Kottawa', 'Western', 'Colombo', 'Sri Lanka', 'S01'),
('C04', 'Kasun Subasinghe', '160/2, Poorwarama Mawatha, Kirulapone ', 'Western', 'Colombo', 'Sri Lanka', 'S03'),
('C05', 'Vishal Kariyawasam', '2/B, Salmal Lane, Ja-ela', 'Western', 'Gampaha', 'Sri Lanka', 'S03'),
('C06', 'Ameli Perera', '87/1, Janatha Mawatha, Panadura', 'Western', 'Kalutara', 'Sri Lanka', 'S01'),
('C07', 'Heshal Silva', '34, Pagoda Road, Nawala', 'Western', 'Colombo', 'Sri Lanka', 'S02'),
('C08', 'Roshel Wikcremasinghe', '45/3, Horana Road, Horana', 'Western', 'Kalutara', 'Sri Lanka', 'S02')


ALTER DATABASE [azuredb1] SET  READ_WRITE 
GO

SELECT * FROM Azure_Customer_Source

SELECT * FROM Azure_Customer_Dest


drop table [Azure_Customer_Source]

