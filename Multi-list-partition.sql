rem cleanup of all objects
drop table SalesTable purge;
drop table alp purge;
drop table soon2bpart purge;
drop table part4filter purge;
drop table ropt purge;
drop table part4xchange purge;
drop table np4xchange purge;
drop table compart4xchange purge;
drop table p4xchange purge;

rem simple multi-column list partitioned table
create table SalesTable (SalesId number, ProdId number, SalesYear number, Country varchar2(50))
partition by list (SalesYear, Country )
(partition p1 values ((2020, 'Sri Lanka'),(2019, 'Sri Lanka'),(2018, 'Sri Lanka')),
 partition p2 values ((2020, 'Australia'))),
 partition p3 values (default));
 
rem table metadata - number of partition keys
select table_name, partitioning_type, partitioning_key_count 
from user_part_tables where table_name='SalesTable';

rem metadata of individual partitions
select partition_name, high_value
from user_tab_partitions where table_name='SalesTable';

rem insert some sample data
insert into SalesTable values (1, 1, 2018, 'Sri Lanka')
insert into SalesTable values (2, 1, 2019, 'Sri Lanka')
insert into SalesTable values (3, 1, 2020, 'Sri Lanka')
insert into SalesTable values (4, 1, 2020, 'Australia')
insert into SalesTable values (5, 2, 2018, 'Sri Lanka')
insert into SalesTable values (6, 2, 2019, 'Sri Lanka')
insert into SalesTable values (7, 2, 2020, 'Australia')
insert into SalesTable values (8, 2, 2020, 'Sri Lanka')
insert into SalesTable values (9, 3, 2020, 'Sri Lanka')
insert into SalesTable values (10, 4, 2018, 'Sri Lanka')
insert into SalesTable values (11, 4, 2019, 'Sri Lanka')
insert into SalesTable values (12, 4, 2020, 'Sri Lanka')
insert into SalesTable values (13, 5, 2018, 'Sri Lanka')
insert into SalesTable values (14, 5, 2019, 'Sri Lanka')
insert into SalesTable values (15, 5, 2020, 'Australia')
insert into SalesTable values (16, 5, 2020, 'Sri Lanka')
insert into SalesTable values (17, 6, 2018, 'Sri Lanka')
insert into SalesTable values (18, 6, 2019, 'Sri Lanka')
insert into SalesTable values (19, 6, 2020, 'Sri Lanka')
insert into SalesTable values (20, 6, 2020, 'Australia')
insert into SalesTable values (21, 7, 2018, 'Sri Lanka')
insert into SalesTable values (22, 7, 2019, 'Sri Lanka')
insert into SalesTable values (23, 7, 2020, 'Australia')
insert into SalesTable values (24, 8, 2018, 'Sri Lanka')
insert into SalesTable values (25, 8, 2020, 'Sri Lanka')
insert into SalesTable values (26, 9, 2017, 'Sri Lanka')
insert into SalesTable values (27, 10, 2017, 'Sri Lanka')
insert into SalesTable values (28, 11, 2017, 'Sri Lanka')
insert into SalesTable values (29, 12, 2017, 'Sri Lanka')
commit;

rem content of partition p1 using partition extended syntax
select * from SalesTable partition (p1);

rem content of DEFAULT partition using the partitioned extended syntax PARTITION FOR ()
select * from SalesTable partition for (2020, 'Sri Lanka');

rem simple partition maintenance operation, demonstrating split
alter table SalesTable split partition p3 into (partition p3 values (2017, 'Sri Lanka'),partition p4) online;

rem content of partition p3 after split
select * from SalesTable partition (p3);


rem partition information for our table
select partition_name, high_value
from user_tab_partitions
where table_name='SalesTable'
order by partition_position;

rem content of partition p4 after the split, our new DEFAULT partition
select * from SalesTable partition (p4);