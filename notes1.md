## Relational Databases. (theory)

1.Relational databases are a type of database management system (DBMS) that stores and provides access to data points that are related to one another.  
2. A relational database is a collection of data points with pre-defined relationships between them. **datapoints**.

3. previously there were **hierarchical database system** and now relational database model took over.

> It separated physical data storage from database management and usage. Modern relational databases let users store and retrieve data without having to manage physical data storage. You can also manipulate logical data structures programmatically.

---

4. Benefits of RDMS.<br>
   1. Data integrity : this is defined as the overall completeness , accuracy and consistency of the data. The real integrity comes by emposing constraints on the data to enforce data integrity. This helps us enforce business rules and accuracy.
   2. Data Security : most relational database management systems have sophisticated access controls. Your database admins can impose who gets access to which data. (limitation of the data access.).
   3. Backups : most database languages have import and export functionality to create backups.
   4. open source.

---

> SQL is a language that lets us communicate with the database system, and the database system takes care of both memory and disk for us. SQL is not directly talking to physical memory — it talks to the DB engine, which manages memory and storage.

### RDBMS benefits and limitations :

1. Structured data : data is stored in a structured way(rows and cols) , manipulating the data is easy using SQL .
2. ACID props : atomicity , consistency , isolation and durability.
   1. atomicity : all or nothing (entire db thing happens or nothing)
   2. Consistency : Rules should not be broken.( when db is changed from one state to other, all of the imposed constraints must be held).
   3. Isolation: multiple db queries can be run at the same time without messing each other up.
   4. Durability: once committed , it should not be lost even if system crashes.

3. Normalization : Normalization = organizing data so that you don’t repeat the same information again and again. (mostly splitting up the tables into more logical sense). promotes data intigrity.

   > Normalization organizes data into multiple related tables to reduce duplication and maintain correctness.

4. scalability.
5. data integrity.
6. Security.

Here are some of the limitations of using an RDBMS:

Complexity: Setting up and managing an RDBMS can be complex, especially for large applications. It requires technical knowledge and skills to manage, tune, and optimize the database.

Cost: RDBMSs can be expensive, both in terms of licensing fees and the computational and storage resources they require.

Fixed Schema: RDBMS follows a rigid schema for data organization, which means any changes to the schema can be time-consuming and complicated.

Handling of Unstructured Data: RDBMSs are not suitable for handling unstructured data like multimedia files, social media posts, and sensor data, as their relational structure is optimized for structured data.

Horizontal Scalability: RDBMSs are not as easily horizontally scalable as NoSQL databases. Scaling horizontally, which involves adding more machines to the system, can be challenging in terms of cost and complexity.

## SQL vs No-SQL databases.

> **NoSQL databases offer more flexibility in data structures, often sacrificing some consistency for scalability and performance. The choice between SQL and NoSQL depends on factors like data structure, scalability needs, consistency requirements, and the nature of the application.**

## SQL Advantages :

1. structured .
2. vertically scalable.
3. format should be specified.

## Disadvantages.

1. scabalility issues.
2. complex overtime.
3. costly .

## NoSQL Databases :

### adv :

1. formats stored in documents and key value pairs .
2. horizontally scaled. (distributed systems.)

### disadv :

1. stale data.

## Horizontal Scrolling Vs Vertical Scrolling :

When your SQL database starts feeling slow, you have two main ways to handle more load:
• Vertical Scaling → Make one machine stronger
• Horizontal Scaling → Add more machines

1. Horizontal Scrolling :
   Pros

✅ Scales almost infinitely
✅ Better fault tolerance
✅ Used by large-scale systems

Cons

❌ Complex setup <br>
❌ Requires architecture changes <br>
❌ Transactions across shards are hard<br>
❌ Debugging is… spicy 2. Vertical Scrolling:<br>
1.upgrade the exisiting database. 2. more ram , cpu , better disk etc .<br>

<br>
Pros

✅ Very simple <br>
✅ No code or query changes <br>
✅ Works great for small–medium systems

Cons

❌ There is a hard limit (you can’t upgrade forever) <br>
❌ Expensive quickly <br>
❌ Single point of failure (if it dies → everything dies) <br>
