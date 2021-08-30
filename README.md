# DATA BASE
## About DB
Is usege for admnistrate informantions, is where informations are stored  

#### KINDS
for each situations kinds use one this(dml,ddl...) but you can merge commands

#### syntax
| syntax | Description |
| --- | --- |
| DISTINCT | list without equality |
| NULL | without value |
| NOT NULL | with value |
| and | add more argument |
| or | conditional or one or other |
| like | 'x%'text in start '%x'text in end |
| = | exacly that |
| > | bigger |
| < | smaller |
| >= | smaller, equality |
| <= | bigger, equality |
| () | pass list or execute with priority |
| in(x,x,x) | list |
| in | inside |


##### More used / Less used
- DDL Data Definition Language
- DML Data Manipulation Language
- DQL Data Query Language
-
- DCL      Data Control Language
- DTL/TCL  Data Transaction Language/
           Transition control language
##### Commands
- ALTER TABLE
- ALTER SESSION
- ALTER TRIGGER
- ALTER USER
- ALTER VIEW
- CREATE DATABASE
- CREATE FUNCTION
- CREATE GLOBAL TEMPORARY TABLE
- CREATE INDEX
- CREATE JAVA
- CREATE PROCEDURE
- CREATE SCHEMA
- CREATE SEQUENCE
- CREATE SYNONYM
- CREATE TABLE
- CREATE TRIGGER
- CREATE USER
- CREATE VIEW
- DROP FUNCTION
- DROP INDEX
- DROP JAVA
- DROP PROCEDURE
- DROP SCHEMA
- DROP SEQUENCE
- DROP SYNONYM
- DROP TABLE
- DROP TRIGGER
- DROP USER
- DROP VIEW
- GRANT
- REVOKE
- TRUNCATE TABLE
- ALTER SEQUENCE

#### DDL
Create tables, define table obj for after you can increment in dml
| Commands | Description |
| --- | --- |
| CREATE | create a new table or database |
| ALTER | truncate to delete data from the table |
| DROP | drop a table |
| RENAME | change name table |

| INTEGER | A signed integer value |
| --- | --- |
| DECIMAL(p,q) | A decimal number of p digits, of which q are decimal places |
| FLOAT(p) | A real value with precision p |
| CHARACTER(n) | A string of exactly n characters |
| BIT(n) | A string of exactly n boolean values ​​(true/false) |
| DATE | A date, with subfields YEAR, MONTH and DAY |
| TIME | A time of day, with HOUR, MINUTE and SECOND |
| TIMESTAMP | A "time stamp" containing a specific date and time |

examples:
```sql
/*create the less influent to more influent*/
 CREATE DATABASE DBName;
 USE DBName;
 CREATE TABLE TableName1(
     IdTableName1   INT PRIMARY KEY IDNTITY,
     Name           VARCHAR(200),
     Date           DATE NOT NULL,
     CPF            CHAR(11),
     FEMALE         BIT NOT NULL
);

CRATE TABLE TableName2(
     IdTableName2 INT PRIMARY KEY IDNTITY,
     IdTableName1 INT FOREIGN KEY REFERENCES TableName1(IdTableName1),
     Name VARCHAR(200)
);
```
#### DML
Increment information
| Commands | Descriptio |
| ---- | ---- |
| INSERT | insert a new row |
| UPDATE | update an existing row |
| DELETE | delete a row |
| MERGE | merging two rows or two tables |
- EXPLAIN PLAN | know execute process |
- subquery::=

examples:
```sql
ISERT INTO TableName (column)
VALUES ('Fisrt'),('Second');

UPDATE TableName
SET column1 = value1, column2 = value2, ...
WHERE condition;

DELETE FROM TableName WHERE condition;

MERGE DuplicateTable1 d1
USING DuplicateTable2 d2
ON (d1.id = d2.id)
WHEN MATCHED
THEN UPDATE SET 
        d1.category_name = d2.category_name,
        d1.amount = d2.amount
WHEN NOT MATCHED BY TARGET 
    THEN INSERT (category_id, category_name, amount)
         VALUES (d2.category_id, d2.category_name, d2.amount)
WHEN NOT MATCHED BY SOURCE 
    THEN DELETE;
```
#### DQL
is for consult, show data
| Commands | Descriptio |
| ---- | ---- |
| SELECT | list tables, columns, values |
| INNER JOIN | list the resemblance |
| LEFT JOIN |  |
| RIGHT JOIN |  |
| FULL OUTER JOIN |  |


examples:
```sql
/*DISTINCT for dont list duplication*/
SELECT DISTINCT * FROM TableName tn
WHERE tn.name = 'NameElementColumn'




```



#### DCL
manage security control
| Commands | Descriptio |
| ---- | ---- |
| GRANT | permanently save |
| REVOKE | permanently save |

examples:
```sql

```
#### DTL/TCL
Control informations transations
| Commands | Descriptio |
| ---- | ---- |
| BEGIN TRANSACTION |  |
| COMMIT | save changes |
| SAVEPOINT | save temporarily |
| ROLLBACK | back version |
| BEGIN TRAN | start test execution |
| ROLLBACK TRAN | finish test execution |


examples:
```sql
BEGIN TRAN
/*line code*/
ROLLBACK TRAN
```

Contents
<br /> 
https://docs.oracle.com/cd/B14156_01/doc/B13812/html/sqcmd.htm
<br /> 
https://www.w3schools.com/sql/sql_delete.asp
<br /> 
https://www.dirceuresende.com/blog/sql-server-como-utilizar-o-comando-merge-para-inserir-atualizar-e-apagar-dados-com-apenas-1-comando/
