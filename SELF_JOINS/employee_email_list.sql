SELECT
    EMPLOYEES.EMPLOYEEID,
    EMPLOYEES.NAME AS EMPLOYEE_NAME,
    MANAGER.NAME AS MANAGER_NAME,
    COALESCE(MANAGER.EMAIL, EMPLOYEES.EMAIL) AS CONTACT_EMAIL
FROM
    EMPLOYEES
LEFT JOIN
    EMPLOYEES AS MANAGER
ON EMPLOYEES.MANAGERID = MANAGER.EMPLOYEEID
WHERE
    EMPLOYEES.DEPARTMENT = 'Sales';