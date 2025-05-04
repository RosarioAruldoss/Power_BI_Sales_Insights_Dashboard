-- UNDERSTANDING THE TABLES AND THE DATA

#To know about the table [customers]
SELECT * FROM sales.customers;

#To know about the table [date]
SELECT * FROM sales.date;

#To know about the table [markets]
SELECT * FROM sales.markets;
-- we observe that the company did sales in New York and Paris. Thus the zones are not mentioned 

#To know about the table [products]
SELECT * FROM sales.products;

#To know about the table [transactions]
SELECT * FROM sales.transactions; 
-- Note - We observe that in the sales_amount field, there is a data error - (-1)
	-- We also see that in the currency there are 2 values in USD and the other values are in rupees. This can make errors 
	-- when calculating the sum

-- COUNT OF RECORDS

#To see the total no. of records in table [customers]
SELECT count(*) FROM sales.customers; -- 38 records 

#To see the total no. of records in the table [date]
SELECT count(*) FROM sales.date; -- 1126 records 

#To see the total no. of records in the table [markets]
SELECT count(*) FROM sales.markets; -- 17 records

#To see the total no. of records in the table [products]
SELECT count(*) FROM sales.products; -- 279 records 

#To see the total no. of records in the table [transactions]
SELECT count(*) FROM sales.transactions; -- 150283 records 

-- GENERAL ANALYSIS

-- Sales that happened in Chennai:  
SELECT * FROM sales.transactions where market_code = "Mark001";
SELECT count(*) FROM sales.transactions where market_code = "Mark001"; -- 1035 records happened in Chennai
-- this gives the transactions that happened in the Chennai region 
-- Likewise we can gather the data for different regions if required

-- USD OUTLIER
-- Earlier we observed that there are 2 USD transactions in [transactions] table. Let's check how many are there in total.
SELECT * FROM sales.transactions where currency = "USD"; -- 2 records are mentioned in USD in total. 

-- NEGATIVE VALUE OUTLIER
-- Earlier we observed that there are 1 NEGATIVE VALUE in sale_amount field of [transactions] table. Let's check how many are 
-- there in total.
SELECT * FROM sales.transactions where sales_amount <= "0"; -- 2 records are mentioned in USD in total. 
SELECT count(*) FROM sales.transactions where sales_amount = "0"; -- 1609 records are mentioned in USD in total. 
SELECT count(*) FROM sales.transactions where sales_amount < "0"; -- 2 records have negative values 

