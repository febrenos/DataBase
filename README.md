# DATA BASE
## About DB
Is usege for admnistrate informantions, is where informations are stored  

#### KINDS
for each situations kinds use one this(dml,ddl...) but you can merge commands

#### Conditions
| Conditions | Description |
| --- | --- |
| DISTINCT |  |
| NULL |  |
| NOT NULL |  |
| and |  |
| or |  |
| like |  |
| = |  |
| > |  |
| < |  |
| >= |  |
| <= |  |
| () | pass list or execute with priority |
| in(x,x,x) |  |
| in |  |


##### More used / Less used
- DDL Data Definition Language
- DML Data Manipulation Language
- DQL Query Language
-
- DCL      Data Control Language
- DTL/TCL  Data Transaction Language/
          Transition control language


#### DDL
Create tables, define table obj for after you can increment in dml
| Commands | Description |
| --- | --- |
| CREATE | create a new table or database |
| ALTER | truncate to delete data from the table |
| DROP | drop a table |
| RENAME | change name table |

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

examples:
```sql
 
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
|  |  |

examples:
```sql
//DISTINCT for dont list duplication
SELECT DISTINCT * FROM TableName tn
WHERE tn.name = 'NameElementColumn'




```



#### DCL
manage security control
| Commands | Descriptio |
| ---- | ---- |
| COMMIT | permanently save |
| ROLLBACK | undo the change |
| SAVEPOINT | save temporarily |

examples:
```sql

```
#### DTL/TCL
Control informations transations
| Commands | Descriptio |
| ---- | ---- |
|  BEGIN TRANSACTION|  |
| COMMIT |  |
| ROLLBACK |  |

examples:
```sql

```

Contents
https://docs.oracle.com/cd/B14156_01/doc/B13812/html/sqcmd.htm
https://www.w3schools.com/sql/sql_delete.asp
https://www.dirceuresende.com/blog/sql-server-como-utilizar-o-comando-merge-para-inserir-atualizar-e-apagar-dados-com-apenas-1-comando/
