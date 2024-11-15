select count(*) from retail_sales_table;
# Data Cleaning
select * from retail_sales_Table 
where transtransactions_id is null 
or sale_date is null
or sale_time is null
or customer_id is null
or gender is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null;

delete from retail_sales_table
where transtransactions_id is null 
or sale_date is null
or sale_time is null
or customer_id is null
or gender is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null;

# Data Exploration

# No of records we're having
Select count(*) as total_records from retail_sales_table;

# No.of customers we have
Select count(distinct customer_id) as total_customers from retail_sales_table;

# No.of categories we have
select count(distinct category) as Categories from retail_sales_table;

# Data Analysis
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales_table where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select * from retail_sales_table where category = 'Clothing' and quantiy >=4 and month(sale_date)= '11' and year(sale_date) = '2022';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select sum(total_sale) as Total_sales, category from retail_sales_table group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age) as age, category from retail_sales_table where category = 'Beauty' group by category;

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales_table where total_sale>1000 ;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
 select category, gender, count(*) as total_transactions from retail_sales_table group by category, gender order by 1;
 
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select * from (select Month(sale_date), year(sale_date), avg(total_sale) as Sales, rank() over (partition by year(sale_date) order by avg(total_sale) desc) as r from retail_sales_table group by 1,2) as t1 where r=1;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select sum(total_sale) as Total_sales, customer_id from retail_sales_table group by customer_id order by Total_sales desc Limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select count(distinct customer_id) as No_of_customers, category from retail_sales_table group by category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
select case
when hour(sale_time) <=12 then 'Morning'
when hour(sale_time) between 12 and 17 then 'Noon'
when hour(sale_time) > 17 then 'Evening'
end as Time_period,
count(transactions_id) as No_of_orders 
from retail_sales_table 
group by Time_period;












