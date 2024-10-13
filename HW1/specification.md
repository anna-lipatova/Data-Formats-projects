# HW 1 Assignment specification

## 1 - Domain overview

We are modeling a (grocery) store business. The main idea is to have store branch that is on an address, cash register that belongs to specific store branch, employees that work at a store branch and can manage cash registers, customers that shop in store branch and can have a loyalty card.

## 2 Specification
The classes mentioned above are defined in this section along with their attributes and relations. Each attribute has a name, data type, short description and an example

### 2.1 Class: Store branch

#### 2.1.1 Name of the store branch
**Attribute**<br>
- name

**Type**<br>
- string

**Name**<br>
- Name

**Description**<br>
- Name of the store branch

**Example**<br>
- Albert Liberec, Žižkova


#### 2.1.2 Relationship: Located at
**Relationship**<br>
- located_at

**Type**<br>
- [Address](#2.2-Class:-Address)

**Name**<br>
- Located at

**Description**<br>
- Address of the store branch


### 2.2 Class: Address

#### 2.2.1 City
**Attribute**<br>
- city

**Type**<br>
- string

**Name**<br>
- City

**Description**<br>
- Address city

**Example**<br>
- Liberec

#### 2.2.2 Street
**Attribute**<br>
- street

**Type**<br>
- string

**Name**<br>
- Street

**Description**<br>
- Address street

**Example**<br>
- Prokopova, 261


#### 2.2.3 Zip code
**Attribute**<br>
- zip_code

**Type**<br>
- string

**Name**<br>
- Zip code

**Description**<br>
- zip code of the address

**Example**<br>
- 104 00


### 2.3 Class: Customer

#### 2.3.1 Given name
**Attribute**<br>
- given_name

**Type**<br>
- string

**Name**<br>
- Given name

**Description**<br>
- Given name of the customer

**Example**<br>
- John

#### 2.3.2 Family name
**Attribute**<br>
- family_name

**Type**<br>
- string

**Name**<br>
- Family name

**Description**<br>
- Family name of the customer

**Example**<br>
- Doe


#### 2.3.3 Birth date
**Attribute**<br>
- birth_date

**Type**<br>
- date

**Name**<br>
- Birth date

**Description**<br>
- Birth date of the customer

**Example**<br>
- 01.01.1999


#### 2.3.4 Phone number
**Attribute**<br>
- phone_number

**Type**<br>
- string

**Name**<br>
- Phone number

**Description**<br>
- Customer's phone number

**Example**<br>
- 777 777 777


#### 2.3.5 Relationship: has loyalty card
**Relationship**<br>
- has_loyalty_card

**Type**<br>
- [Loyalty card](#2.4-Class:-Loyalty-Card)

**Name**<br>
- Has loyalty card

**Description**<br>
- Customer's loyalty card


#### 2.3.6 Relationship: Shops at
**Relationship**<br>
- shops_at

**Type**<br>
- [Store branch](#2.1-Class:-Store-branch)

**Name**<br>
- Shops at

**Description**<br>
- Customer's default store branch


### 2.4 Class: Loyalty Card

#### 2.4.1 Number
**Attribute**<br>
- number

**Type**<br>
- number

**Name**<br>
- Number

**Description**<br>
- Number of the loyalty card

**Example**<br>
- 0001

#### 2.4.2 Points
**Attribute**<br>
- points

**Type**<br>
- number

**Name**<br>
- Points

**Description**<br>
- Points accumulated on the card

**Example**<br>
- 123


### 2.5 Class: Employee

#### 2.5.1 Given name
**Attribute**<br>
- given_name

**Type**<br>
- string

**Name**<br>
- Given name

**Description**<br>
- Given name of the employee

**Example**<br>
- John

#### 2.5.2 Family name
**Attribute**<br>
- family_name

**Type**<br>
- string

**Name**<br>
- Family name

**Description**<br>
- Family name of the employee

**Example**<br>
- Doe


#### 2.5.3 Relationship: Works at
**Relationship**<br>
- works_at

**Type**<br>
- [Store branch](#2.1-Class:-Store-branch)

**Name**<br>
- Works at

**Description**<br>
- Store branch where the employee works at



### 2.6 Class: Cash register

#### 2.6.1 Number
**Attribute**<br>
- number

**Type**<br>
- number

**Name**<br>
- Number

**Description**<br>
- Number of the cash register at a given store

**Example**<br>
- 1


#### 2.6.2 Relationship: Located at
**Relationship**<br>
- located_at

**Type**<br>
- [Store branch](#2.1-Class:-Store-branch)

**Name**<br>
- Located at

**Description**<br>
- Store branch where the cash register is at
