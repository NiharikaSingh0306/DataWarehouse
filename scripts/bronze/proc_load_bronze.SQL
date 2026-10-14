/*
Store Procedure:
This loads data into the bronze schema from external CSV files.
It performs the following actions
  -Truncates the table before loading
  -uses BULK INSERT command to load the data


*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
DECLARE @bronze_start_time DATETIME,@bronze_end_time DATETIME;
SET @bronze_start_time=GETDATE();
	DECLARE @start_time DATETIME ,@end_time DATETIME; --to track ETL duration to identify bottlenecks and performance issues
	BEGIN TRY--try and catch fro error handling
		PRINT '================================='
		PRINT 'Loading the bronze layer'
		PRINT '================================='

		PRINT '-------------------------'
		PRINT 'Loading CRM Tables'
		PRINT '-------------------------'

		SET @start_time=GETDATE();
		PRINT '->Truncating table:bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;--first make the table empty and then start loading the values
		PRINT '->Inserting into table:bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Nripendra\Desktop\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '-> Load Durations: '+ CAST( DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '-----------------------'
		

		SET @start_time=GETDATE();
		PRINT '->Truncating table:bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;--first make the table empty and then start loading the values
		PRINT '->Inserting into table:bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Nripendra\Desktop\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '-> Load Durations: '+ CAST( DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '-----------------------'
		


		SET @start_time=GETDATE();
		PRINT '->Truncating table:bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details;--first make the table empty and then start loading the values
		PRINT '->Inserting into table:bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Nripendra\Desktop\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '-> Load Durations: '+ CAST( DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '-----------------------'
		

		PRINT '----------------------------'
		PRINT 'Loading ERP Tables'
		PRINT '----------------------------'


		SET @start_time=GETDATE();
		PRINT '->Truncating table:bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12;--first make the table empty and then start loading the values
		PRINT '->Inserting into table:bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Nripendra\Desktop\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '-> Load Durations: '+ CAST( DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '-----------------------'
		


		SET @start_time=GETDATE();
		PRINT '->Truncating table:bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;--first make the table empty and then start loading the values
		PRINT '->Inserting into table:bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Nripendra\Desktop\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '-> Load Durations: '+ CAST( DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '-----------------------'
		


		SET @start_time=GETDATE();
		PRINT '->Truncating table:bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;--first make the table empty and then start loading the values
		PRINT '->Inserting into table:bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Nripendra\Desktop\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '-> Load Durations: '+ CAST( DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '-----------------------'
		
	END TRY
	BEGIN CATCH
		PRINT '============================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message: '+ CAST (ERROR_MESSAGE() AS NVARCHAR);
		PRINT 'Error Number: '+ERROR_NUMBER();
		PRINT '============================='


	END CATCH
	SET @bronze_end_time=GETDATE();
PRINT '-> Total Load Durations: '+ CAST( DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		
END

EXEC bronze.load_bronze;

		


