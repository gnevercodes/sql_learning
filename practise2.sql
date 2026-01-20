create table baseA(
    a int primary key,
    fruit_A varchar(200) not null 
); 
create table baseB(
    b int primary key,
    fruit_B varchar(100) not null
); 
INSERT INTO baseA (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');
INSERT INTO baseB (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');

select * from baseA;
select * from baseB; 

