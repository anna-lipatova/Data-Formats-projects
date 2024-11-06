//data
CREATE CONSTRAINT FOR (n:ProgramMembership) REQUIRE (n.identifier) IS UNIQUE;
CREATE CONSTRAINT FOR (n:StoreBranch) REQUIRE (n.name) IS UNIQUE;
CREATE CONSTRAINT FOR (n:CashRegister) REQUIRE (n.identifier) IS UNIQUE;

//---Loyalty Card---
CREATE (Card1:ProgramMembership {
    membershipPointsEarned: 147,
    identifier: "0o001"
}),
(Card2:ProgramMembership {
    membershipPointsEarned: 258,
    identifier: "0o002"
}),
(Card3:ProgramMembership {
    membershipPointsEarned: 369,
    identifier: "0o003"
});

//---Addresse---
CREATE (Address1:Address {
    addressLocality: "Liberec",
    streetAddress: "Prokopova, 261",
    postalCode: "104 00"
}),
(Address2:Address {
    addressLocality: "Olomouc",
    streetAddress: "Polska, 1",
    postalCode: "779 00"
}),
(Address3:Address {
    addressLocality: "Brno",
    streetAddress: "Nadrazni, 2",
    postalCode: "608 00"
});

//---Store Branch---
CREATE (StoreBranch1:StoreBranch {
    name: "Albert Liberec, Žižkova",
    hasWarehouse: false
})-[:LOCATED_AT]->(Address1),
(StoreBranch2:StoreBranch {
    name: "Albert Olomouc",
    hasWarehouse: false
})-[:LOCATED_AT]->(Address2),
(StoreBranch3:StoreBranch {
    name: "Albert Brno",
    hasWarehouse: true
})-[:LOCATED_AT]->(Address3);


//---Employee---
CREATE (Employee1:Employee { givenName: "Marie", familyName: "Krasna" })-[:WORKS_AT]->(StoreBranch1),
(Employee2:Employee { givenName: "Janko", familyName: "Mrkvicka" })-[:WORKS_AT]->(StoreBranch2),
(Employee3:Employee { givenName: "Peter", familyName: "Cibulka" })-[:WORKS_AT]->(StoreBranch3),
(Employee4:Employee { givenName: "Anna", familyName: "Mala" })-[:WORKS_AT]->(StoreBranch1),
(Employee5:Employee { givenName: "Honza", familyName: "Velky" })-[:WORKS_AT]->(StoreBranch3),
(Employee6:Employee { givenName: "Kira", familyName: "Najtli" })-[:WORKS_AT]->(StoreBranch3);


//---Cash Register---
CREATE (Register1:CashRegister { identifier: 1 })-[:LOCATED_AT]->(StoreBranch1),
       (Register1)-[:OPERATED_BY { isSelfChecked: false }]->(Employee1),

(Register2:CashRegister { identifier: 2 })-[:LOCATED_AT]->(StoreBranch1),
       (Register2)-[:OPERATED_BY { isSelfChecked: true }]->(Employee2),

(Register3:CashRegister { identifier: 3 })-[:LOCATED_AT]->(StoreBranch1),
       (Register3)-[:OPERATED_BY { isSelfChecked: true }]->(Employee2),

(Register4:CashRegister { identifier: 4 })-[:LOCATED_AT]->(StoreBranch2),
       (Register4)-[:OPERATED_BY { isSelfChecked: false }]->(Employee3),

(Register5:CashRegister { identifier: 5 })-[:LOCATED_AT]->(StoreBranch3),
       (Register5)-[:OPERATED_BY { isSelfChecked: false }]->(Employee4),

(Register6:CashRegister { identifier: 6 })-[:LOCATED_AT]->(StoreBranch3),
       (Register6)-[:OPERATED_BY { isSelfChecked: false }]->(Employee5),

(Register7:CashRegister { identifier: 7 })-[:LOCATED_AT]->(StoreBranch3),
       (Register7)-[:OPERATED_BY { isSelfChecked: true }]->(Employee6);


//---Customer---
CREATE (Customer1:Customer {
    givenName: "Marek",
    familyName: "Velky",
    birthDate: "2001-01-01",
    phone: '+420123321231'
})-[:SHOPS_AT]->(StoreBranch1),
   (Customer1)-[:HAS_LOYALTY_CARD]->(Card1),

(Customer2:Customer {
    givenName: "Petra",
    familyName: "Mrkvickova",
    birthDate: "2002-02-02",
    phone: '+420123321231'
})-[:SHOPS_AT]->(StoreBranch1),

(Customer3:Customer {
    givenName: "Janka",
    familyName: "Cibulkova",
    birthDate: "2003-03-03",
    phone: '+420666666666'
})-[:SHOPS_AT]->(StoreBranch2),
   (Customer3)-[:HAS_LOYALTY_CARD]->(Card2),

(Customer4:Customer {
    givenName: "Lukas",
    familyName: "Mrkvickovy",
    birthDate: "2002-02-02",
    phone: '+420123321234'
})-[:SHOPS_AT]->(StoreBranch2),

(Customer5:Customer {
    givenName: "Luka",
    familyName: "Nebe",
    birthDate: "2004-04-04",
    phone: '+420123321238'
})-[:SHOPS_AT]->(StoreBranch2),

(Customer6:Customer {
    givenName: "Zdenka",
    familyName: "Mala",
    birthDate: "2001-01-01",
    phone: '+420123321901'
})-[:SHOPS_AT]->(StoreBranch3),
   (Customer6)-[:HAS_LOYALTY_CARD]->(Card3);