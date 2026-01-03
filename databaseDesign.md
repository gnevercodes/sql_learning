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
