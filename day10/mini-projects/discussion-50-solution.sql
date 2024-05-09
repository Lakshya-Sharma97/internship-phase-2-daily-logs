-- 1. Objective: Calculate the total sales for each product line. 
-- Query Instructions: Use the SUM() aggregate function on quantityOrdered * priceEach from the orderdetails table to calculate total sales.
-- Join orderdetails with products to get the productLine. Group the results by productLine.
select p.productLine,sum(o.quantityOrdered * o.priceEach) as 'total Sales' from orderdetails as o join product as p on p.productLine = o.productLine 
group by p.productLine;

-- 2. Objective: Determine the total quantity sold for each product line. 
-- Query Instructions: Use the SUM() aggregate function on quantityOrdered from the orderdetails table.
-- Join orderdetails with products to access productLine. Group the results by productLine.
select p.productLine,sum(o.quantityOrdered) as 'total quantity' from orderdetails as o join product as p on p.productLine = o.productLine group by p.productLine;

-- 3. Objective: Find product lines with an average sale amount above a specified threshold.
-- Query Instructions: Calculate the average sale amount (quantityOrdered * priceEach) for each product line.
-- Use the HAVING clause to filter out product lines with an average sale amount below the threshold. Group the results by productLine.
select p.productLine,avg(o.quantityOrdered * o.priceEach) as 'average_sales' from orderdetails as o join product as p on p.productLine = o.productLine 
group by p.productLine having avg(o.quantityOrdered * o.priceEach)<threshold;

-- 4. Objective: For each continent, calculate the average population and total GDP.
-- Query Instructions: Use the AVG() function for average population and SUM() for total GDP from the country table. Group the results by Continent.
select continent,avg(population) as average_population, sum(GDP) as total_GDP from country group by continent;

-- 5. Objective: Identify countries with a number of official languages greater than a specified count.
-- Query Instructions: Count the number of languages per country where IsOfficial is 'T' from the countrylanguage table.
-- Use the HAVING clause to filter countries with official languages greater than the specified count. 
-- Group the results by CountryCode and then join with country to get country names.
select cl.CountryCode,c.name,count(cl.language) from countrylanguage cl join country c on cl.CountryCode=c.CountryCode where cl.IsOfficial="T"
group by cl.CountryCode having count(cl.language)>specified_count;

-- 6. Objective: Calculate the month-over-month sales growth percentage for each product line.
-- Query Instructions: Extract year and month from orderDate to perform a monthly sales analysis.Use window functions like LAG() to compare 
-- current month sales to the previous month and calculate the growth percentage. Group the results by year, month, and productLine.


-- 7. Objective: Identify quarters with significantly higher sales for each office and investigate possible reasons.
-- Query Instructions: Summarize sales data quarterly by using date functions to extract the quarter from orderDate.Compare quarterly sales to identify 
-- significant increases, possibly using window functions or subqueries. Join with offices to include office information in the analysis.
