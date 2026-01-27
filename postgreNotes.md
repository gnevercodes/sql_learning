# PostgreSQL Notes:

> PostgreSQL is an free open-source database system that supports both relational (SQL) and non-relational (JSON) queries.

- app used : PSQL,pgAdmin for now.(switch to datagrip later on)

- Topics :

* Create : create table...
* insert into : insert into cars() values();
* fetch(Select) : select brand from cars;
* add column : (alter table ....)
* Update ( update ...) use where precisely.
* alter table
* alter column (Alter table cars alter column year type varchar(4) ;)
* delete ( used for rows. )
* Truncate can be used to delete all rows.

## Syntax for Database queries:

```
CREATE TABLE cars (
    brand varchar(255),
    model varchar(255),
    year INT
);
select * from cars;
INSERT into cars(brand, model, year) values ('Ford','mustand',1964);
select *
from cars;
select brand, model from cars;
ALTER table cars add color varchar(255) ;555666556§§§6'Ford';
select * from cars;
Alter table cars alter column year type varchar(4) ;
alter table cars alter column color type varchar(30);
alter table cars drop column color;
delete from cars where brand ='Ford';
select * from cars;
drop table cars ;
```

### Operators in where ( filtering ) clause :

```
=	Equal to
<	Less than
>	Greater than
<=	Less than or equal to
>=	Greater than or equal to
<>	Not equal to
!=	Not equal to
LIKE	Check if a value matches a pattern (case sensitive)
ILIKE	Check if a value matches a pattern (case insensitive)
AND	Logical AND
OR	Logical OR
IN	Check if a value is between a range of values
BETWEEN	Check if a value is between a range of values
IS NULL	Check if a value is NULL
NOT	Makes a negative result e.g. NOT LIKE, NOT IN, NOT BETWEEN
Combinations : Not like , not in , not between , is not null, is null
```

### SQL

```
Select Distinct ...
Select Count(Distinct)...
Order By ( ordering rows)
Limit clause
```

# execution order

- FROM
- WHERE
- GROUP BY
- HAVING
- SELECT
- ORDER BY

# PostgreSQL Clauses Cheat Sheet

A quick reference guide to the most commonly used PostgreSQL clauses for SQL statements.

---

## 1️⃣ Data Retrieval Clauses (`SELECT`)

| Clause                                                   | Description                     | Example                                                                  |
| -------------------------------------------------------- | ------------------------------- | ------------------------------------------------------------------------ |
| `SELECT`                                                 | Choose columns to retrieve      | `SELECT id, name FROM users;`                                            |
| `FROM`                                                   | Specify the table(s)            | `SELECT * FROM orders;`                                                  |
| `WHERE`                                                  | Filter rows based on condition  | `SELECT * FROM users WHERE age > 18;`                                    |
| `GROUP BY`                                               | Group rows sharing a value      | `SELECT city, COUNT(*) FROM users GROUP BY city;`                        |
| `HAVING`                                                 | Filter groups (with `GROUP BY`) | `SELECT city, COUNT(*) FROM users GROUP BY city HAVING COUNT(*) > 5;`    |
| `ORDER BY`                                               | Sort the result set             | `SELECT * FROM users ORDER BY created_at DESC;`                          |
| `LIMIT`                                                  | Restrict number of rows         | `SELECT * FROM users LIMIT 10;`                                          |
| `OFFSET`                                                 | Skip rows                       | `SELECT * FROM users OFFSET 5;`                                          |
| `DISTINCT`                                               | Remove duplicates               | `SELECT DISTINCT city FROM users;`                                       |
| `JOIN / INNER JOIN / LEFT JOIN / RIGHT JOIN / FULL JOIN` | Combine tables                  | `SELECT u.name, o.total FROM users u JOIN orders o ON u.id = o.user_id;` |
| `ON` / `USING`                                           | Define join conditions          | `SELECT * FROM a JOIN b ON a.id = b.a_id;`                               |

---

## 2️⃣ Data Modification Clauses

| Clause                     | Description          | Example                                                  |
| -------------------------- | -------------------- | -------------------------------------------------------- |
| `INSERT INTO ... VALUES`   | Insert new rows      | `INSERT INTO users (name, age) VALUES ('Ganesh', 24);`   |
| `UPDATE ... SET ... WHERE` | Update rows          | `UPDATE users SET age = 25 WHERE name = 'Ganesh';`       |
| `DELETE FROM ... WHERE`    | Delete rows          | `DELETE FROM users WHERE age < 18;`                      |
| `RETURNING`                | Return affected rows | `INSERT INTO users (name) VALUES ('Amit') RETURNING id;` |

---

## 3️⃣ Table / Schema Definition Clauses

| Clause         | Description                      | Example                                                           |
| -------------- | -------------------------------- | ----------------------------------------------------------------- |
| `CREATE TABLE` | Define a new table               | `CREATE TABLE users (id SERIAL PRIMARY KEY, name TEXT, age INT);` |
| `ALTER TABLE`  | Modify table structure           | `ALTER TABLE users ADD COLUMN email TEXT;`                        |
| `DROP TABLE`   | Remove a table                   | `DROP TABLE users;`                                               |
| `PRIMARY KEY`  | Column(s) uniquely identify rows | `id SERIAL PRIMARY KEY`                                           |
| `FOREIGN KEY`  | Reference another table          | `user_id INT REFERENCES users(id)`                                |
| `UNIQUE`       | Ensure unique values             | `email TEXT UNIQUE`                                               |
| `CHECK`        | Enforce condition                | `CHECK (age > 0)`                                                 |

---

## 4️⃣ Transaction Control Clauses

| Clause                  | Description           | Example                      |
| ----------------------- | --------------------- | ---------------------------- |
| `BEGIN`                 | Start a transaction   | `BEGIN;`                     |
| `COMMIT`                | Commit changes        | `COMMIT;`                    |
| `ROLLBACK`              | Undo changes          | `ROLLBACK;`                  |
| `SAVEPOINT`             | Set a savepoint       | `SAVEPOINT sp1;`             |
| `ROLLBACK TO SAVEPOINT` | Rollback to savepoint | `ROLLBACK TO SAVEPOINT sp1;` |
| `RELEASE SAVEPOINT`     | Remove a savepoint    | `RELEASE SAVEPOINT sp1;`     |

---

## 5️⃣ Database & Permission Clauses

| Clause            | Description                  | Example                                          |
| ----------------- | ---------------------------- | ------------------------------------------------ |
| `CREATE DATABASE` | Create a new database        | `CREATE DATABASE mydb;`                          |
| `DROP DATABASE`   | Delete a database            | `DROP DATABASE mydb;`                            |
| `CREATE SCHEMA`   | Create a new schema          | `CREATE SCHEMA my_schema;`                       |
| `GRANT`           | Give privileges              | `GRANT ALL PRIVILEGES ON TABLE users TO ganesh;` |
| `REVOKE`          | Remove privileges            | `REVOKE INSERT ON users FROM ganesh;`            |
| `SET`             | Set configuration parameters | `SET search_path TO my_schema;`                  |

---

## 🔑 Pro Tips

- Always specify the **schema** if using multiple schemas to avoid confusion.
- Use `\?` in `psql` to see **all meta-commands**.
- Use `\dt` to quickly **list all tables** in the current schema.
- Combine clauses for **powerful queries**:

```sql
SELECT city, COUNT(*)
FROM users
WHERE age > 18
GROUP BY city
HAVING COUNT(*) > 5
ORDER BY COUNT(*) DESC
LIMIT 10;
```

## Database Hierarchy Overview :

Quick diagram (top → bottom)
Server/Instance → Database → Schema → Table → Column → Row (record)
Supporting objects: Indexes, Constraints, Views, Functions/Stored Procedures, Transactions, Users/Roles

**levels explained**

1. Server / Instance — the running DBMS process (e.g., PostgreSQL server, MySQL server) that hosts one or more databases.
2. Database — a logical container for data (e.g., mydb). Some systems (MySQL) treat “database” similarly to PostgreSQL’s schema.
3. Schema — a namespace inside a database to group related objects (tables, views). Example: public, sales.
4. Table — stores structured records (rows). Defined by columns and types. Example: customers.
5. Column — named field in a table with a data type (e.g., id INT, email TEXT).
6. Row (record) — a single entry in a table (one customer).
7. Index — speeds lookups on column(s).
8. Constraint — rules for integrity (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, NOT NULL).
9. View — saved query treated as a virtual table.
   Functions / Stored Procedures — encapsulated logic executed in the DB.
10. Transactions — group of statements executed atomically (COMMIT / ROLLBACK).
11. Users & Roles / Permissions — access control (GRANT / REVOKE).

## Datatypes :

1. Numeric data types such as INT, TINYINT, BIGINT, FLOAT, REAL, etc.
2. Date and Time data types such as DATE, TIME, DATETIME, etc.
3. Character and String data types such as CHAR, VARCHAR, TEXT, etc.
4. Unicode character string data types such as NCHAR, NVARCHAR, NTEXT, etc.
5. Binary data types such as BINARY, VARBINARY, etc.
6. Miscellaneous data types such as CLOB, BLOB, XML, CURSOR, TABLE, etc.

### why to choose the right sql type [ArticleLink](https://www.digitalocean.com/community/tutorials/sql-data-types#relational-database-vendor-differences)

a. Storage efficiency
b. performance.
c. integrity

| Category  | Data Type        | Example                   | Use Case            | Notes                 |
| --------- | ---------------- | ------------------------- | ------------------- | --------------------- |
| Numeric   | INT / INTEGER    | age INT                   | Counts, IDs         | Most commonly used    |
| Numeric   | BIGINT           | views BIGINT              | Very large numbers  | Analytics, logs       |
| Numeric   | SMALLINT         | rating SMALLINT           | Small ranges        | Flags, enums          |
| Numeric   | NUMERIC(p,s)     | price NUMERIC(10,2)       | Money               | Exact, slow but safe  |
| Numeric   | REAL             | temp REAL                 | Scientific data     | Not exact             |
| Numeric   | DOUBLE PRECISION | distance DOUBLE PRECISION | Measurements        | Avoid for money       |
| Text      | TEXT             | description TEXT          | Free text           | Preferred in Postgres |
| Text      | VARCHAR(n)       | email VARCHAR(255)        | Limited text        | Adds validation       |
| Text      | CHAR(n)          | country CHAR(2)           | Fixed-length codes  | Pads spaces           |
| Date/Time | DATE             | dob DATE                  | Date only           | YYYY-MM-DD            |
| Date/Time | TIME             | login_time TIME           | Time only           | No date               |
| Date/Time | TIMESTAMP        | created_at TIMESTAMP      | Date + time         | No timezone           |
| Date/Time | TIMESTAMPTZ      | created_at TIMESTAMPTZ    | Prod timestamps     | Timezone-aware        |
| Boolean   | BOOLEAN          | is_active BOOLEAN         | Flags               | TRUE / FALSE / NULL   |
| ID        | SERIAL           | id SERIAL                 | Auto-increment ID   | Legacy but common     |
| ID        | BIGSERIAL        | id BIGSERIAL              | Large auto ID       | Safer at scale        |
| ID        | UUID             | id UUID                   | Distributed systems | Needs extension       |
| JSON      | JSON             | data JSON                 | Raw JSON            | Stored as text        |
| JSON      | JSONB            | data JSONB                | Queryable JSON      | Indexable, faster     |
| Array     | TEXT[]           | tags TEXT[]               | Lists               | Use sparingly         |

```
PostgreSQL
 └── Database
      └── Schema
           └── Tables
                └── Rows
```

## Short notes on Null Values:

> t's always good to reduce the possibility of NULL values in databases because they require special attention when constructing queries, constraints (certain functions behave differently with null values) and when processing the results.

**An alternative to NULL values in your database is to have data-type appropriate default values, like 0 for numerical data, empty strings for text data, etc. But if your database needs to store incomplete data, then NULL values can be appropriate if the default values will skew later analysis (for example, when taking averages of numerical data).**

## notes on queris with aggregates:

1.  GROUP BY groups rows that have the same value so you can apply aggregate functions like: sum(),count(),max(),min(),avg()
2.  You cannot use aggregates in WHERE.
3.            WHERE → filters rows
    • HAVING → filters groups
4.  WHERE filters before GROUP BY, HAVING filters after GROUP BY

## Order of Execution of a query:

```sql
SELECT DISTINCT column, AGG_FUNC(column_or_expression), …
FROM mytable
    JOIN another_table
      ON mytable.column = another_table.column
    WHERE constraint_expression
    GROUP BY column
    HAVING constraint_expression
    ORDER BY column ASC/DESC
    LIMIT count OFFSET COUNT;
```

1. From and Joins : From is first and Join comes first to determine total data.
2. Where : because constraints are being enforced.
3. Group by : The remaining rows after the WHERE constraints are applied are then grouped based on common values in the column specified in the GROUP BY clause. As a result of the grouping, there will only be as many rows as there are unique values in that column. Implicitly, this means that you should only need to use this when you have aggregate functions in your query.
4. having : If the query has a GROUP BY clause, then the constraints in the HAVING clause are then applied to the grouped rows, discard the grouped rows that don't satisfy the constraint. Like the WHERE clause, aliases are also not accessible from this step in most databases.
5. select ;
6. distinct : Duplicate will be discarded.
7. Order by : this happens then, asc or descending
8. limit / offset .
