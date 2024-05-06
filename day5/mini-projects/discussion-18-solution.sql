-- 1. Write a SQL statement to create a table countries including columns country_id, country_name, and region_id, 
--and make sure that the combination of columns country_id and region_id will be unique.
create table countries ( country_id integer, country_name varchar(100), region_id integer,unique(country_id,region_id));

-- 2. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, and max_salary, and make sure that, 
-- the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of 
-- insertion if no value assigned for the specified columns.
create table jobs(job_id varchar(10) primary key,job_title varchar(35) not null, min_salary decimal(6,0) default 8000,max_salary decimal(6,0) default null);

-- 3. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id, and department_id 
-- and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column 
-- job_id contain only those values which exist in the jobs table.
create table jobs(job_id varchar(10) primary key,job_title varchar(35) default "", min_salary decimal(6,0) default null,max_salary decimal(6,0) default null);
create table job_history(employee_id integer unique,start_date date,end_date date,job_id integer,department_id integer,foreign key job_history(job_id) references jobs(job_id));

-- 4. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number 
-- hire_date, job_id, salary, commission, manager_id, and department_id and make sure that the employee_id column does not contain 
-- any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain 
-- only those unique combination values, which combinations exist in the departments table.
create table department(department_id decimal(4,0) default 0,department_name varchar(30) not null,manager_id decimal(6,0) default 0,laction_id decimal(6,0) 
default null,primary key(department_id,manager_id));
create table employees(employee_id integer unique,first_name varchar(50),last_name varchar(50),email varchar(75),phone_number int(10),hire_date date,
job_id integer,salary integer,commission integer,manager_id decimal(6,0),department_id decimal(4,0),
foreign key employees(department_id,manager_id) references department(department_id,manager_id));

-- 5. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, 
-- job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value 
-- at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain 
-- only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, 
-- can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables.
create table jobs(job_id varchar(10) primary key not null,job_title varchar(35) not null, min_salary decimal(6,0) default null,max_salary decimal(6,0) default null);
create table department(department_id decimal(4,0) default 0,department_name varchar(30) not null,manager_id decimal(6,0) default 0,laction_id decimal(6,0) 
default null,primary key(department_id,manager_id))ENGINE=InnoDB;
create table employees(employee_id integer unique,first_name varchar(50),last_name varchar(50),email varchar(75),phone_number int(10),hire_date date,
job_id varchar(10),salary integer,commission integer,manager_id integer,department_id decimal(4,0),
foreign key employees(department_id) references department(department_id),foreign key employees(job_id) references jobs(job_id))ENGINE=InnoDB;

-- 6. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, 
-- the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the 
-- column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. 
-- The specialty of the statement is that, The ON DELETE CASCADE that lets you allow to delete records in the employees(child) table that refer to 
-- a record in the jobs(parent) table when the record in the parent table is deleted and the ON UPDATE RESTRICT actions reject any updates.
create table jobs(job_id int(11) primary key,job_title varchar(35) not null, min_salary decimal(6,0) default 8000,max_salary decimal(6,0) default null);
create table employees(employee_id integer unique,first_name varchar(50),last_name varchar(50),job_id int(11),salary integer,
foreign key employees(job_id) references jobs(job_id) ON DELETE CASCADE ON UPDATE RESTRICT)ENGINE=InnoDB;

-- 7. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, 
-- the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column 
-- job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. 
-- The specialty of the statement is that, The ON DELETE SET NULL action will set the foreign key column values in the child table(employees) to 
-- NULL when the record in the parent table(jobs) is deleted, with a condition that the foreign key column in the child table must accept NULL values 
-- and the ON UPDATE SET NULL action resets the values in the rows in the child table(employees) to NULL values when the rows in the parent table(jobs) are updated.
create table jobs(job_id int(11) primary key,job_title varchar(35) not null, min_salary decimal(6,0) default 8000,max_salary decimal(6,0) default null);
create table employees(employee_id integer unique,first_name varchar(50),last_name varchar(50),job_id int(11),salary integer,
foreign key employees(job_id) references jobs(job_id) ON DELETE SET NULL ON UPDATE SET NULL)ENGINE=InnoDB;

-- 8. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, 
-- the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column 
-- job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. 
-- The specialty of the statement is that, The ON DELETE NO ACTION and the ON UPDATE NO ACTION actions will reject the deletion and any updates.
create table jobs(job_id int(11) primary key,job_title varchar(35) not null, min_salary decimal(6,0) default 8000,max_salary decimal(6,0) default null);
create table employees(employee_id integer unique,first_name varchar(50),last_name varchar(50),job_id int(11),salary integer,
foreign key employees(job_id) references jobs(job_id) ON DELETE NO ACTION ON UPDATE NO ACTION)ENGINE=InnoDB;
