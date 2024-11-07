//query-2
//branches that have warehouses and 
//are staffed only by employees with
//names beginning with "P" 
//
MATCH (branch:StoreBranch {hasWarehouse: true})<-[:WORKS_AT]-(employee:Employee)
WHERE employee.givenName STARTS WITH "P"
WITH branch, COLLECT(DISTINCT employee.givenName) AS employeeNames, COUNT(employee) AS employeeCount

MATCH (branch)<-[:WORKS_AT]-(e:Employee)
WITH branch, employeeNames, employeeCount, COUNT(e) AS totalEmployees
WHERE totalEmployees = employeeCount
RETURN branch.name AS Branch, employeeNames AS Employees