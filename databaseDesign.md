# Database Design Principles (Theory).

> the goal is to learn how database engine really works inside. how database really writes inside the disk.

## Database

```


                       ORM(obj relational mapping)
                         |
             Client (mqSQL client/mongoDB)
                         |
                      Database (components)
    query parser           engine
    query optimizer  <--> execution <--> cache <-> auth/backup metrics

    Transaction                       manager
    manager.    <--> lock manager <-> Recovery <-->  datafile/indexfile(metadata)(actualdata)

                    storage engine
                          |
                        Disk



```

1. query parser / optimizer : first query hits this block. it has parser and optimizer (exists in every lang). This parser agents will convert into ASt(tree structure) / tokens. then its run through syntax (check typos errors) --> Tree. THis tree is thrown into Optimizer.
2. Execution Engine : CEO of database management. This decides how quickly the execution should be done.
3. authentication/backup metrics : DB companies tries to upgrade this utility components.
4. Cache : frequent queries data will be stored here.
5. DataFile / index file(metadata) : Magnetically engraved into disk. (RDMS table, NoSQL : document file) . This is where actual data is stored and written into disk.
6. Storage Engine : this is where data is stored in different structures. (Btree, B+tree, hash index).
7. Managers : transaction managers : it guarantees (happens or not thats all), lock manager: guarantees write option on that part of disk whilst happening concurrently.No two parallel process can access that part . Recovery manager: logs , Rollback feature.(append only).

> learned from Hitesh Chowdary YT.
> [How database engine really works](https://www.youtube.com/watch?v=bB7YAWPiJR4)


```md
Client / UI
   ↓
Backend Application
   ↓
ORM (optional)
   ↓
Database Engine
   ↓
Memory (Cache / Buffer Pool)
   ↓
Disk (SSD / HDD)
   ↑
Database Engine
   ↑
ORM
   ↑
Backend
   ↑
Client
```

1. ORM : Object relational mapper : This takes our method call and generates SQL whilst handling parameter binding , entity mapping , lazy vs eager loading , transactions .
2. Database Connection Layer : before sql runs , pooling happpens (reuse of open connections).
3. Database engine : This is where execution happens, sql parser , optimizer, cache , managers , engines are present in this.
4. Cache : Before touching the disk , DB checks the cache(buffer shared) to see if the row is being cached for frequent use and then returned immediately.
5. Then DB requests Pages from Disk , loads into memory and reads the row.
6. Disk : **Index-> Pointer -> DataPage** or else full page scan.
7. Result construction : DB formats the result and coverts types and send bytes back to the application.
8. Back to ORM : this then converts rows to objects (JAVA Objects).
9. backend --> user receives.
