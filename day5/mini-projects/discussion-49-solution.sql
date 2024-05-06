-- 1. Query the country table to select the Name, Continent, and Population
select Name,Continent,Population from country;

-- 2. Use aliases to rename the Name column to Country Name and the country table as c in your queries
select Name as "Country Name" from county as c;

-- 3. Find all countries in the 'Europe' continent with a population greater than 10 million
select Name,Population from country where Continent="Europe" and  Population>10000000;

-- 4. Retrieve all cities in 'Poland' or 'Belgium'
select City from country where City="Poland" or City="Belgium";

-- 5. List all countries in 'South America' by their LifeExpectancy in descending order.
select Name,LifeExpectancy from country where Continent="South America" order by LifeExpectancy desc;

-- 6. Get the top 5 largest cities by population in the database.
select Name,Population from country order by Population desc limit 5;


