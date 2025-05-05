## Sales Insights Data Analysis Project

### Instructions to setup mysql on your local computer

1. Follow step in this video to install mysql on your local computer
https://www.youtube.com/watch?v=WuBcTJnIuzo

1. SQL database dump is in db_dump.sql file above. Download `db_dump.sql` file to your local computer and import it as per instructions given in the tutorial video

### Data Analysis Using SQL

1. Show all customer records

    `SELECT * FROM customers;`

1. Show total number of customers

    `SELECT count(*) FROM customers;`

1. Show transactions for Chennai market (market code for chennai is Mark001)

    `SELECT * FROM transactions where market_code='Mark001';`

1. Show distrinct product codes that were sold in chennai

    `SELECT distinct product_code FROM transactions where market_code='Mark001';`

1. Show transactions where currency is US dollars

    `SELECT * from transactions where currency="USD"`

1. Show transactions in 2020 join by date table

    `SELECT transactions.*, date.* FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020;`

1. Show total revenue in year 2020,

    `SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and transactions.currency="INR\r" or transactions.currency="USD\r";`
	
1. Show total revenue in year 2020, January Month,

    `SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and and date.month_name="January" and (transactions.currency="INR\r" or transactions.currency="USD\r");`

1. Show total revenue in year 2020 in Chennai

    `SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020
and transactions.market_code="Mark001";`


Data Analysis Using Power BI
============================




POWER BI:

    Data Modeling:
        In Power BI Desktop, we modeled the data using a star schema, where the Fact table (Sales Transactions) is connected to multiple Dimension tables — Customers, Dates, Markets, and Products.

    Data Transformation:

        Markets table:
            In the markets table we see that the market_names - New York and Paris has no zones mentioned. 
            This is due to the fact that most of the sales happens locally in India.
            Data is transformed using the powerquery - the zones are filtered out in the transformation using powerquery.

        Transactions table:
            a.  The transactions table had both -ve and null values(0) 
                Thus we are filtering out both the -ve and null values(0) in the transformation using powerquery.

            b.  In the sales amount we can observe that 2 records are entered in USD where the majority is in the local currency - Rupees.
                We have to normalise the values by creating a new column where all the sales amounts are in Rupees.
                1. Formula to create norm_amount column:
                `= Table.AddColumn(#"Filtered Rows", "norm_amount", each if [currency] = "USD" or [currency] ="USD#(cr)" then [sales_amount]*90 else [sales_amount], type any)`

                - Rs.90 is the value of USDT.




