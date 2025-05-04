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
-- When building the dashboard, this has to be converted to INR. 

-- NEGATIVE VALUE OUTLIER
-- Earlier we observed that there are 1 NEGATIVE VALUE in sale_amount field of [transactions] table. Let's check how many are 
-- there in total.
SELECT * FROM sales.transactions where sales_amount <= "0"; -- 2 records are mentioned in USD in total. (year - 2018)
SELECT count(*) FROM sales.transactions where sales_amount = "0"; -- 1609 records are mentioned in USD in total. 
SELECT count(*) FROM sales.transactions where sales_amount < "0"; -- 2 records have negative values 

-- TRANSACTIONS BY YEAR 

-- Let's filter out the transactions based on year
-- In the [date] table we can see that the year is given in a separate field. 

-- INNER JOIN the [date] and [transactions] on order date will give the years
SELECT sales.transactions.*, sales.date.* FROM sales.transactions INNER JOIN sales.date on sales.transactions.order_date = sales.date.date;

-- Get filtered transactions based on year 
SELECT sales.transactions.*, sales.date.* FROM sales.transactions INNER JOIN sales.date on sales.transactions.order_date = sales.date.date WHERE year = "2017";
-- we can alter the year and get the respective data for that year.

-- YEARLY REVENUE

-- Let's find out the total revenue based on year.
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date on sales.transactions.order_date = sales.date.date WHERE year = "2017"; 
-- Sample: 93569152 Rupees in Total for the year 2017
-- in the year 2018, there are USD transactions.

 
 


