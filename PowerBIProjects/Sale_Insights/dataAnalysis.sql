-- Here we have a sales database, withmultiple tables like customers, date, markets, products and transaction
-- We are going to analyze data here 

-- Show all records from customers tables and total count
select * from sales.customers;
select count(*) from sales.customers;

-- Total number of transactions
select * from sales.transactions;
select count(*) from sales.transactions;

-- Top 5 records from transactions table
select * from sales.transactions limit 5;

-- Record for Market code Mark001
select * from sales.markets where markets_code="Mark001";

-- Show transcations from Chennai (Market code = Mark001)
select * from sales.transactions where market_code="Mark001";

-- Show distinct product codes sold in Chennai
select distinct product_code from sales.transactions where market_code="Mark001";

-- Show currency using USD
select * from sales.transactions where currency="USD";

-- Count of sales using INR
select count(*) from sales.transactions where currency="INR";

-- Show transaction in 2020 join by date table
select transactions.*, date.* from sales.transactions INNER JOIN sales.date ON transactions.order_date=date.date where date.year=2020;

-- Show total revenue in 2020
select SUM(transactions.sales_amount) from sales.transactions INNER JOIN sales.date ON transactions.order_date=date.date where date.year=2020 and transactions.currency="INR" or transactions.currency="USD\r";

-- Show total revenue in 2020 for January month
select SUM(transactions.sales_amount) from sales.transactions INNER JOIN sales.date ON transactions.order_date=date.date where date.year=2020 and date.month_name="January" and (transactions.currency="INR" or transactions.currency="USD\r");

-- Show total revenue in year 2020 in Chennai
select SUM(transactions.sales_amount) from sales.transactions INNER JOIN sales.date ON transactions.order_date=date.date where date.year=2020 and transactions.market_code="Mark001"; 