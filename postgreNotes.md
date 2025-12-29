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
