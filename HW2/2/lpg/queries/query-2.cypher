//query-2
//branches that does not have warehouses and 
//are staffed only by employees with
//names beginning with "J" 
//
MATCH (branch:StoreBranch {hasWarehouse: false})<-[:WORKS_AT]-(employee:Employee)
WHERE employee.givenName STARTS WITH "J"
WITH branch, COLLECT(DISTINCT employee.givenName) AS employeeNames, COUNT(employee) AS employeeCount

MATCH (branch)<-[:WORKS_AT]-(e:Employee)
WITH branch, employeeNames, employeeCount, COUNT(e) AS totalEmployees
WHERE totalEmployees = employeeCount
RETURN branch.name AS Branch, employeeNames AS Employees