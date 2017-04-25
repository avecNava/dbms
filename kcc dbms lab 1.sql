-- +-------------------+
-- | Tables |
-- +-------------------+
-- | company           |
-- | employee          |
-- | manages           |
-- | works             |
-- +-------------------+
-- works;
-- +---------------+--------------+------+-----+---------+-------+
-- | Field         | Type         | Null | Key | Default | Extra |
-- +---------------+--------------+------+-----+---------+-------+
-- | employee_name | varchar(20)  | NO   | PRI | NULL    |       |
-- | company_name  | varchar(20)  | NO   | PRI | NULL    |       |
-- | salary        | double(10,2) | YES  |     | NULL    |       |
-- +---------------+--------------+------+-----+---------+-------+
-- company;
-- +--------------+-------------+------+-----+---------+-------+
-- | Field        | Type        | Null | Key | Default | Extra |
-- +--------------+-------------+------+-----+---------+-------+
-- | company_name | varchar(20) | NO   | PRI | NULL    |       |
-- | city         | varchar(30) | NO   |     | NULL    |       |
-- +--------------+-------------+------+-----+---------+-------+
-- employee;
-- +---------------+-------------+------+-----+---------+-------+
-- | Field         | Type        | Null | Key | Default | Extra |
-- +---------------+-------------+------+-----+---------+-------+
-- | employee_name | varchar(20) | NO   | PRI | NULL    |       |
-- | street        | varchar(20) | NO   |     | NULL    |       |
-- | city          | varchar(20) | NO   |     | NULL    |       |
-- +---------------+-------------+------+-----+---------+-------+
-- manages;
-- +---------------+-------------+------+-----+---------+-------+
-- | Field         | Type        | Null | Key | Default | Extra |
-- +---------------+-------------+------+-----+---------+-------+
-- | employee_name | varchar(20) | NO   | PRI | NULL    |       |
-- | manager_name  | varchar(20) | NO   | PRI | NULL    |       |
-- +---------------+-------------+------+-----+---------+-------+

-- SELECT * FROM WORKS;
-- +---------------+-----------------------+----------+
-- | employee_name | company_name          | salary   |
-- +---------------+-----------------------+----------+
-- | MADHAV BHAI   | KANTIPUR CITY COLLEGE | 15000.00 |
-- | NAVA BOGATEE  | Agile IT Solutions    | 25000.50 |
-- | NAVA BOGATEE  | KANTIPUR CITY COLLEGE | 25000.50 |
-- | SUJAN DEVKOTA | Agile IT Solutions    |  5000.00 |
-- | SUJAN DEVKOTA | KANTIPUR CITY COLLEGE | 18000.25 |
-- +---------------+-----------------------+----------+
-- SELECT * FROM COMPANY;
-- +----------------------------+-----------+
-- | company_name               | city      |
-- +----------------------------+-----------+
-- | ACME ENGG COLLEGE          | Swayambhu |
-- | AGILE IT Solutions         | Lalitpur  |
-- | KANTIPUR CITY COLLEGE      | Kathmandu |
-- | KHWOPA ENGINEERING COLLEGE | Bhaktapur |
-- +----------------------------+-----------+

-- SELECT * FROM EMPLOYEE;
-- +---------------+---------------+-----------+
-- | employee_name | street        | city      |
-- +---------------+---------------+-----------+
-- | MADHAV BHAI   | Putalisadak 3 | Kathmandu |
-- | NAVA BOGATEE  | Thasikhel 12  | Lalitpur  |
-- | SUJAN DEVKOTA | Banasthali 11 | Kathmandu |
-- +---------------+---------------+-----------+
-- SELECT * FROM MANAGES;
-- +---------------+--------------+
-- | employee_name | manager_name |
-- +---------------+--------------+
-- | MADHAV BHAI   | NAVA BOGATEE |
-- | SUJAN DEVKOTA | MADHAV BHAI  |
-- | SUJAN DEVKOTA | NAVA BOGATEE |
-- +---------------+--------------+

--   employee (employee_name, street, city)
CREATE TABLE employee(
	employee_name varchar(30) NOT NULL,
	street varchar(30) NOT NULL,
	city varchar(30) NOT NULL,
	CONSTRAINT `PK_employee_name` PRIMARY KEY (employee_name)
	);

INSERT INTO employee(employee_name, street, city)
VALUES('NAVA BOGATEE','Thasikhel 12','Lalitpur'),
('SUJAN DEVKOTA','Banasthali 11', 'Kathmandu'),
('MADHAV BHAI', 'Putalisadak 3', 'Kathmandu');



--   company (company_name, city)
CREATE TABLE company(
	company_name varchar(30) NOT NULL,
	city varchar(30) NOT NULL,
	CONSTRAINT `PK_company_name` PRIMARY KEY (company_name)
);
--ALTER TABLE `company` CHANGE `company_name` `company_name` VARCHAR(20);

INSERT INTO company (company_name, city)
VALUES('AGILE IT SOLUTIONS','Lalitpur'),
('KANTIPUR CITY COLLEGE','Kathmandu'),
('ACME ENGINEERING COLLEGE','Swayambhu'),
('KHWOPA ENGINEERING COLLEGE','Bhaktapur');

--  works (employee_name, company_name, salary)
CREATE TABLE works(
	employee_name varchar(30) NOT NULL,
	company_name varchar(30) NOT NULL,
	salary DOUBLE(10,2),
	CONSTRAINT `PK_emp_company` PRIMARY KEY(employee_name, company_name)
);

--  add foreign key by ALTER STATEMENT
ALTER TABLE works ADD CONSTRAINT `FK_works_company` FOREIGN KEY (company_name) REFERENCES company (company_name);
ALTER TABLE works ADD CONSTRAINT `FK_works_employee` FOREIGN KEY(employee_name) REFERENCES employee(employee_name)			
--ALTER TABLE works DROP FOREIGN KEY FK_works_company;

INSERT INTO works (employee_name, company_name, salary)
VALUES('NAVA BOGATEE','KANTIPUR CITY COLLEGE',25000.50),
('MADHAV BHAI','KANTIPUR CITY COLLEGE',15000.00),
('SUJAN DEVKOTA', 'KANTIPUR CITY COLLEGE',18000.25),
('NAVA BOGATEE','Agile IT Solutions',25000.50),
('SUJAN DEVKOTA', 'Agile IT Solutions',5000.00);


--   manages (employee_name, manager_name)
CREATE TABLE manages(
	employee_name varchar(30) NOT NULL,
	manager_name varchar(30)  NOT NULL,
	CONSTRAINT `PK_employee_manager` PRIMARY KEY(employee_name,manager_name),
	CONSTRAINT  FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
	CONSTRAINT FOREIGN KEY (manager_name) REFERENCES employee(employee_name)
);

INSERT INTO manages 
VALUES('MADHAV BHAI','NAVA BOGATEE'),
('SUJAN DEVKOTA','NAVA BOGATEE'),
('SUJAN DEVKOTA','MADHAV BHAI');


--employee and company they work should belong to the same city
--list out all users and where they work at the moment
SELECT e.employee_name,e.city,c.company_name,c.city 
FROM employee e INNER JOIN works w  ON e.employee_name=w.employee_name 
INNER JOIN company c on w.company_name = c.company_name
ORDER BY e.employee_name ASC;
-- +---------------+-----------+-----------------------+-----------+
-- | employee_name | city      | company_name          | city      |
-- +---------------+-----------+-----------------------+-----------+
-- | MADHAV BHAI   | Kathmandu | KANTIPUR CITY COLLEGE | Kathmandu |
-- | NAVA BOGATEE  | Lalitpur  | AGILE IT Solutions    | Lalitpur  |
-- | NAVA BOGATEE  | Lalitpur  | KANTIPUR CITY COLLEGE | Kathmandu |
-- | SUJAN DEVKOTA | Kathmandu | AGILE IT Solutions    | Lalitpur  |
-- | SUJAN DEVKOTA | Kathmandu | KANTIPUR CITY COLLEGE | Kathmandu |
-- +---------------+-----------+-----------------------+-----------+

--list out all users whose city and work city are different
SELECT e.employee_name,e.city,c.company_name,c.city 
FROM employee e
INNER JOIN works w on e.employee_name = w.employee_name
INNER JOIN company c on c.company_name=w.company_name
WHERE 1 
AND c.company_name='KANTIPUR CITY COLLEGE'
AND e.employee_name='NAVA BOGATEE'
AND e.city != c.city;
-- +---------------+----------+-----------------------+-----------+
-- | employee_name | city     | company_name          | city      |
-- +---------------+----------+-----------------------+-----------+
-- | NAVA BOGATEE  | Lalitpur | KANTIPUR CITY COLLEGE | Kathmandu |
-- +---------------+----------+-----------------------+-----------+
CREATE ASSERTION emp_company_city
CHECK(
	EXISTS(
		SELECT e.employee_name,e.city,c.company_name,c.city 
		FROM employee e
		INNER JOIN works w on e.employee_name = w.employee_name
		INNER JOIN company c on c.company_name=w.company_name
		WHERE 1 
		AND c.company_name='KANTIPUR CITY COLLEGE'
		AND e.employee_name='NAVA BOGATEE'
		AND e.city != c.city
		)
);