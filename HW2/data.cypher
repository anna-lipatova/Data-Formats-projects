//data
CREATE CONSTRAINT FOR (n:ProgramMembership) REQUIRE (n.identifier) IS UNIQUE;
CREATE CONSTRAINT FOR (n:StoreBranch) REQUIRE (n.name) IS UNIQUE;
CREATE CONSTRAINT FOR (n:CashRegister) REQUIRE (n.identifier) IS UNIQUE;

//---Loyalty Card---
CREATE (Card1:ProgramMembership{
membershipPointsEarned:147,
identifier:0o001
}
)
CREATE (Card2:ProgramMembership{
membershipPointsEarned:258,
identifier:0o002
}
)
CREATE (Card3:ProgramMembership{
membershipPointsEarned:369,
identifier:0o003
}
)


//---Address---
CREATE (Adress1:Address
{
    addressLocality:"Liberec",
    streerAddress:"Prokopova, 261",
    postalCode:"104 00"
})
CREATE (Adress2:Address
{
    addressLocality:"Olomouc",
    streerAddress:"Polska, 1",
    postalCode:"779 00"
})
CREATE (Adress3:Address
{
    addressLocality:"Brno",
    streerAddress:"Nadrazni, 2",
    postalCode:"608 00"
})


//---Store Branch---
CREATE (StoreBranch1:StoreBranch
{
    name:"Albert Liberec, Žižkova",
    hasWarehouse:false
})
CREATE (StoreBranch1)-[:LOCATED_AT]->(Address1)


CREATE (StoreBranch2:StoreBranch
{
    name:"Albert Olomouc",
    hasWarehouse:false
})
CREATE (StoreBranch2)-[:LOCATED_AT]->(Address2)


CREATE (StoreBranch3:StoreBranch
{
    name:"Albert Brno",
    hasWarehouse:true
})
CREATE (StoreBranch3)-[:LOCATED_AT]->(Address3)


//---Employee---
CREATE (Employee1:Employee
{
    givenName:"Marie",
    familyName:"Krasna"
})
CREATE (Employee1)-[:WORKS_AT]->(StoreBranch1)

CREATE (Employee2:Employee
{
    givenName:"Janko",
    familyName:"Mrkvicka"
})
CREATE (Employee2)-[:WORKS_AT]->(StoreBranch2)

CREATE (Employee3:Employee
{
    givenName:"Peter",
    familyName:"Cibulka"
})
CREATE (Employee3)-[:WORKS_AT]->(StoreBranch3)

CREATE (Employee4:Employee
{
    givenName:"Anna",
    familyName:"Mala"
})
CREATE (Employee4)-[:WORKS_AT]->(StoreBranch1)

CREATE (Employee5:Employee
{
    givenName:"Honza",
    familyName:"Velky"
})
CREATE (Employee5)-[:WORKS_AT]->(StoreBranch3)

CREATE (Employee6:Employee
{
    givenName:"Kira",
    familyName:"Najtli"
})
CREATE (Employee6)-[:WORKS_AT]->(StoreBranch3)

CREATE (Employee7:Employee{
    givenName:"Marie",
    FamilyName:"Uzasna"
})
CREATE (Employee7)-[:WORKS_AT]->(StoreBranch1)


//---Cash Register---
CREATE (Regster1:CashRegister
{identifier:1}
)
CREATE (Register1)-[:LOCATED_AT]->(StoreBranch1),
    (Register1)-[:OPERATED_BY{
        isSelfChecked:false
    }]->(Employee1)

CREATE (Regster2:CashRegister
{identifier:2}
)
CREATE (Register2)-[:LOCATED_AT]->(StoreBranch1),
    (Register2)-[:OPERATED_BY{
        isSelfChecked:true
    }]->(Employee2)

CREATE (Regster3:CashRegister
{identifier:3}
)
CREATE (Register3)-[:LOCATED_AT]->(StoreBranch1),
    (Register3)-[:OPERATED_BY{
        isSelfChecked:true
    }]->(Employee2)  

CREATE (Regster4:CashRegister
{identifier:4}
)
CREATE (Register4)-[:LOCATED_AT]->(StoreBranch2),
    (Register4)-[:OPERATED_BY{
        isSelfChecked:false
    }]->(Employee3)

CREATE (Regster5:CashRegister
{identifier:5}
)
CREATE (Register5)-[:LOCATED_AT]->(StoreBranch3),
    (Register5)-[:OPERATED_BY{
        isSelfChecked:false
    }]->(Employee4)

CREATE (Regster6:CashRegister
{identifier:6}
)
CREATE (Register6)-[:LOCATED_AT]->(StoreBranch3),
    (Register6)-[:OPERATED_BY{
        isSelfChecked:false
    }]->(Employee5)

CREATE (Regster7:CashRegister
{identifier:7}
)
CREATE (Register7)-[:LOCATED_AT]->(StoreBranch3),
    (Register7)-[:OPERATED_BY{
        isSelfChecked:true
    }]->(Employee6)


//---Customer---
CREATE (Customer1:Customer
{
    givenName:"Marek",
    familyName:"Velky",
    birthDate:"2001-01-01",
    phone:'+420123321231'
})
CREATE (Customer1)-[:SHOPS_AT]->(StoreBranch1),
(Customer1)-[:HAS_LOYALTY_CARD]->(Card1)

CREATE (Customer2:Customer
{
    givenName:"Petra",
    familyName:"Mrkvickova",
    birthDate:"2002-02-02",
    phone:'+420123321231'
})
CREATE (Customer2)-[:SHOPS_AT]->(StoreBranch1)

CREATE (Customer3:Customer
{
    givenName:"Janka",
    familyName:"Cibulkova",
    birthDate:"2003-03-03",
    phone:'+420666666666'
})
CREATE (Customer3)-[:SHOPS_AT]->(StoreBranch2),
(Customer1)-[:HAS_LOYALTY_CARD]->(Card2)

CREATE (Customer4:Customer
{
    givenName:"Lukas",
    familyName:"Mrkvickovy",
    birthDate:"2002-02-02",
    phone:'+420123321234'
})
CREATE (Customer4)-[:SHOPS_AT]->(StoreBranch2)

CREATE (Customer5:Customer
{
    givenName:"Luka",
    familyName:"Nebe",
    birthDate:"2004-04-04",
    phone:'+420123321238'
})
CREATE (Customer5)-[:SHOPS_AT]->(StoreBranch2)

CREATE (Customer6:Customer
{
    givenName:"Zdenka",
    familyName:"Mala",
    birthDate:"2001-01-01",
    phone:'+420123321901'
})
CREATE (Customer6)-[:SHOPS_AT]->(StoreBranch3),
(Customer6)-[:HAS_LOYALTY_CARD]->(Card3)