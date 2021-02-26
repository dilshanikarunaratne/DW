
CREATE DATABASE course_work3

USE  course_work3

CREATE TABLE source_table
(
id					INT PRIMARY KEY,
Product				VARCHAR(6),
Date				INT,
Sale				INT
)

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tg_mv]
 ON [dbo].[source_table]
 AFTER INSERT,DELETE,UPDATE
AS
BEGIN
SET NOCOUNT ON;
DECLARE
 @view_columns NVARCHAR(MAX),
 @table_columns NVARCHAR(MAX),
 @sql NVARCHAR(MAX)

	SELECT DISTINCT @table_columns = SUBSTRING(( SELECT ',' + '['+
	CONVERT(VARCHAR(50),A.Date)+']' AS [text()]
	FROM [dbo].[source_table] A
	GROUP BY A.Date
	ORDER BY A.Date
	FOR XML PATH('') ), 2, 2000)
	SELECT @view_columns = ISNULL(SUBSTRING(( SELECT ',' + '['+st.name+']' AS [text()]
		 FROM sys.columns st
		 JOIN sys.views sv
		 ON sv.object_id = st.object_id
		 WHERE object_name(st.object_id)='mv_view'
		 AND st.name <> 'Product'
		 FOR XML PATH('')), 2, 2000),'')
			IF(@table_columns<>@view_columns)
			BEGIN
			DROP VIEW IF EXISTS dbo.mv_view;
			SET @sql ='
				CREATE VIEW mv_view WITH SCHEMABINDING AS
				SELECT Product,' + @table_columns + ' from
				 ( select Product, date,sale
				from [dbo].[source_table]
				 ) RW
				 pivot
				 (
				 sum(sale)
				 for date in (' + @table_columns + ')
				 ) PT'
			--execute the dynamic SQL
			EXECUTE sp_executesql @sql;
			END
		END
GO

ALTER TABLE [dbo].[source_table] ENABLE TRIGGER [tg_mv]

INSERT INTO [dbo].source_table (
	[id], [Product], [Date], [Sale])
VALUES (1,'Prod1', 2016, 999999),
(2,'Prod2', 2017, 99999),
(3,'Prod3', 2018, 9999),
(4,'Prod4', 2016, 999999),
(5,'Prod5', 2017, 99999),
(6,'Prod6', 2018, 9999)

SELECT * FROM mv_view

















DROP TABLE source_table
SELECT * FROM source_table
drop view SalesView1