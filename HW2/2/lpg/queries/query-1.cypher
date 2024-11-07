//query-1
//branches where the accumulated card 
//points are higher than the average
//among the points of all branches.
//
MATCH (customer:Customer)-[:HAS_LOYALTY_CARD]->(card:ProgramMembership)
WITH AVG(card.membershipPointsEarned) AS averagePoints
MATCH (branch:StoreBranch)<-[:SHOPS_AT]-(customer:Customer)-[:HAS_LOYALTY_CARD]->(card:ProgramMembership)
WITH branch, SUM(card.membershipPointsEarned) AS totalPoints, averagePoints
WHERE totalPoints > averagePoints
RETURN branch.name AS Branch, totalPoints AS TotalPoints, averagePoints AS AveragePoints


