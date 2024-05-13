# Write a solution to find employees who have the highest salary in each of the departments.
SELECT d.name as Department, e.name as Employee, e.salary as Salary
FROM employee AS e
    INNER JOIN(
        SELECT departmentId, MAX(salary) AS max_salary
        FROM employee
        GROUP BY departmentId
    ) AS dh ON e.departmentId = dh.departmentId
            AND e.salary = dh.max_salary
    INNER JOIN department AS d ON d.id = e.departmentId