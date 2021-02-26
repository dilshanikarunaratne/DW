create table Sales (
SalesId number, 
ProdId number, 
SalesYear number, 
Country varchar2(50)
);

rem insert some sample data
insert into Sales values (1, 1, 2018, 'Sri Lanka')
insert into Sales values (2, 1, 2019, 'Sri Lanka')
insert into Sales values (3, 1, 2020, 'Sri Lanka')
insert into Sales values (4, 1, 2020, 'Australia')
insert into Sales values (5, 2, 2018, 'Sri Lanka')
insert into Sales values (6, 2, 2019, 'Sri Lanka')
insert into Sales values (7, 2, 2020, 'Australia')
insert into Sales values (8, 2, 2020, 'Sri Lanka')
insert into Sales values (9, 3, 2020, 'Sri Lanka')
insert into Sales values (10, 4, 2018, 'Sri Lanka')
insert into Sales values (11, 4, 2019, 'Sri Lanka')
insert into Sales values (12, 4, 2020, 'Sri Lanka')
insert into Sales values (13, 5, 2018, 'Sri Lanka')
insert into Sales values (14, 5, 2019, 'Sri Lanka')
insert into Sales values (15, 5, 2020, 'Australia')
insert into Sales values (16, 5, 2020, 'Sri Lanka')
insert into Sales values (17, 6, 2018, 'Sri Lanka')
insert into Sales values (18, 6, 2019, 'Sri Lanka')
insert into Sales values (19, 6, 2020, 'Sri Lanka')
insert into Sales values (20, 6, 2020, 'Australia')
insert into Sales values (21, 7, 2018, 'Sri Lanka')
insert into Sales values (22, 7, 2019, 'Sri Lanka')
insert into Sales values (23, 7, 2020, 'Australia')
insert into Sales values (24, 8, 2018, 'Sri Lanka')
insert into Sales values (25, 8, 2020, 'Sri Lanka')
insert into Sales values (26, 9, 2017, 'Sri Lanka')
insert into Sales values (27, 10, 2017, 'Sri Lanka')
insert into Sales values (28, 11, 2017, 'Sri Lanka')
insert into Sales values (29, 12, 2017, 'Sri Lanka')
commit;

rem create a bunch of different indexes on it
rem some indexes, different shape and type
create index i1_prefix_Sales on Sales(ProdId);
create index i3_prefix_but_ovrd_Sales on Sales(ProdId, SalesYear);
create index i4_global_part_Sales on Sales(SalesYear) global partition by hash(SalesYear) partitions 4;
create bitmap index i5_bix_Sales on Sales (SalesYear,Country);

rem indexes in general
select index_name, index_type, uniqueness, partitioned, status 
from user_indexes
where table_name='Sales'
order by 1;

rem partitioned index
select index_name, partitioning_type, partition_count, locality 
from user_part_indexes
where table_name='Sales'
order by 1;

rem do an online conversion
rem - only one index will not use default conversion
alter table Sales modify
partition by list (SalesYear) automatic
(partition p1 values (2020)) online
update indexes (i3_prefix_but_ovrd_Sales global);


rem partitioning metadata
select table_name, partitioning_type, partition_count 
from user_part_tables where table_name='Sales';
select partition_name, high_value 
from user_tab_partitions where table_name='Sales'
order by partition_position asc;


rem indexes general
select index_name, index_type, uniqueness, partitioned, status 
from user_indexes
where table_name='Sales'
order by 1;

rem partitioned indexes
select index_name, partitioning_type, partition_count, locality 
from user_part_indexes
where table_name='Sales'
order by 1;

rem status of partitioned index
select ip.index_name, ip.status, count(*) cnt
from user_ind_partitions ip, user_indexes i
where i.index_name=ip.index_name and table_name='Sales'
group by ip.index_name, ip.status
order by 1;