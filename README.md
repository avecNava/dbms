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

CONSTRAINTS
1. Employee and the company they work should belong to the same city
2. For a given company, manager's salary should be the highest
3. Each city can spend Rs 10,00,000.00 for salary in maximum
4. Salary should be greater than 1,000.00
5. City and Street can not have NULL values

