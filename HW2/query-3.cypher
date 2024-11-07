//query-3
//Identify customers who have the highest
//number of points within their branch 
//
MATCH (branch:StoreBranch)<-[:SHOPS_AT]-(customer:Customer)-[:HAS_LOYALTY_CARD]->(card:ProgramMembership)
WITH branch, MAX(card.membershipPointsEarned) AS maxPoints

MATCH (branch)<-[:SHOPS_AT]-(customer:Customer)-[:HAS_LOYALTY_CARD]->(card:ProgramMembership)
WHERE card.membershipPointsEarned = maxPoints
RETURN branch.name AS Branch,customer.familyName AS Customer, card.membershipPointsEarned AS Points 