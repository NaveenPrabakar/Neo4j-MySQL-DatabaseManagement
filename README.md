
# Neo4j-MySQL-DatabaseManagement

## Overview

This repository contains a series of database management projects completed for a database class (Com-S-363) from February 2024 to April 2024. The projects demonstrate practical skills in both relational (MySQL) and graph (Neo4j) databases. Each project involves importing data sets and extracting insights using both SQL and Cypher queries, highlighting the strengths and differences between the two database paradigms[^1].

---

## Projects

- **Data Import:** Each assignment required importing provided data sets into either MySQL or Neo4j.
- **Query Development:** Wrote and executed SQL queries for MySQL and Cypher queries for Neo4j to fulfill assignment requirements.
- **Comparative Analysis:** Explored how similar data extraction tasks are handled in both relational and graph database systems.

---

## Technologies Used

- **MySQL:** For relational data modeling, storage, and querying.
- **Neo4j:** For graph-based data modeling and Cypher querying.
- **SQL \& Cypher:** Query languages for MySQL and Neo4j, respectively.

---

## Example Workflow

### 1. Importing Data

- **MySQL:** Data imported using SQL scripts or CSV files.
- **Neo4j:** Data imported via `LOAD CSV` Cypher commands, with appropriate constraints for uniqueness and relationships.


### 2. Example Queries

#### SQL (MySQL)

```sql
SELECT Products.ProductName AS Product,
       ROUND(SUM((`Order Details`.UnitPrice*Quantity*(1-Discount)/100)*100)) AS Sales
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN `Order Details` ON Orders.OrderID = `Order Details`.OrderID
JOIN Products ON `Order Details`.ProductID = Products.ProductID
WHERE Employees.FirstName = "Steven" AND Employees.LastName = "Buchanan"
GROUP BY Products.ProductName
ORDER BY Sales DESC LIMIT 5;
```


#### Cypher (Neo4j)

```cypher
MATCH (e:Employee)-[:SOLD]->(:Order)-[r:INCLUDED]->(p:Product)
WHERE e.first_name = 'Steven' AND e.last_name = 'Buchanan'
RETURN p.name AS Product,
       ROUND(SUM(r.unit_price*r.quantity*(1-r.discount)/100)*100) AS Sales
ORDER BY Sales DESC LIMIT 5;
```

*These examples show how similar business questions are answered in both systems, but with different query languages and data models[^2].*

---

## Project Structure

- `project1/`, `project2/`, ...: Assignment-specific folders with scripts and documentation.
- `README.md`: This file.
- `data/`: Sample data sets used in the projects.
- `sql/`: SQL scripts for MySQL.
- `cypher/`: Cypher scripts for Neo4j.

---

## Getting Started

### Prerequisites

- MySQL Server
- Neo4j Desktop or Neo4j Community/Enterprise Edition


### Setup

1. **Clone the Repository**

```bash
git clone https://github.com/NaveenPrabakar/Neo4j-MySQL-DatabaseManagement.git
cd Neo4j-MySQL-DatabaseManagement
```

2. **Import Data into MySQL**
    - Use provided SQL scripts or import CSV files using MySQL Workbench or command line.
3. **Import Data into Neo4j**
    - Place CSV files in Neo4j's import directory.
    - Run Cypher scripts using the Neo4j Browser or Cypher Shell.

---

## Learning Outcomes

- Hands-on experience with both relational and graph database management systems.
- Understanding of data modeling, querying, and importing/exporting data in MySQL and Neo4j.
- Ability to translate business questions into both SQL and Cypher queries.
- Comparative perspective on when to use relational vs. graph databases.




