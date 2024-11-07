//query-4
//search for all cashiers who operate
//more than one cash register and display 
//their information with branch names 
//and register IDs
//
MATCH (e:Employee)<-[:OPERATED_BY]-(register:CashRegister)-[:LOCATED_AT]->(branch:StoreBranch)
WITH e, COUNT(register) AS numberOfRegisters, COLLECT(register.identifier) AS RegisterIds, branch.name AS Branch
WHERE numberOfRegisters > 1
RETURN e.familyName AS Employee, numberOfRegisters AS NumberOfRegisters, RegisterIds, Branch