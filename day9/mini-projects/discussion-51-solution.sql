-- 1. Create a query to find product names that start with "Classic", include any characters in the middle, and end with "Car".
select * from product where product_name like "classic%car";

-- 2. Identify all customer addresses that contain the word "Street" or "Avenue" in any part of the address field.
select * from product where address like "%street%" or address like "%avenue%";

-- 3. Find all orders with total amounts between two values, indicating mid-range transactions.
select order,sum(amount) as total_amount from product having sum(amount) between max(amount) and min(amount) group by order;;

-- 4. Retrieve all payments made within a specific date range, focusing on a high-activity period.
select * from product where date between 'start_date' and 'end_date';

-- 5.  Identify orders where the total amount exceeds the average sale amount across all orders.
select order,sum(amount) as total_amount from product having sum(amount)>any(select avg(amount) from product) group by order;

-- 6. Find products that have been ordered in quantities equal to the maximum quantity ordered for any product.
select product_name,quantiy from product where quantity= all(select max(quantity) from product);

-- 7. Identify customers who have made payments in the top 10% of all payments and are located in specific geographic regions.


-- 8. Analyze sales data to identify products with significantly higher sales in specific seasons compared to their annual sales average.