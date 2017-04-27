*TABLES*
* Employee(*employee_name*, street, city);
* Company(*company_name*,city);
* Works(*employee_name,company_name*,salary);
* Manages(employee_name,manager_name);

*CONSTRAINTS*
1. Employee and the company they work should belong to the same city
2. For a given company, manager's salary should be the highest
3. Each city can spend Rs 10,00,000.00 for salary in maximum
4. Salary should be greater than 1,000.00
5. City and Street can not have NULL values
