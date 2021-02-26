rem create a simple auto-list partitioned table
create table autolistpartition (SalesId number, ProdId number, SalesYear number, Country varchar2(50))
partition by list (SalesYear) automatic
(partition p1 values (2018,2019,2020),
 partition p2 values (2017));
 
rem metadata information for an auto-list partitioned table
select table_name, partitioning_type, autolist, partition_count 
from user_part_tables where table_name='autolistpartition';

rem insert some data w/o matching partition
insert into autolistpartition values (1, 1, 2018, 'Sri Lanka')
insert into autolistpartition values (2, 1, 2019, 'Sri Lanka')
insert into autolistpartition values (3, 1, 2020, 'Sri Lanka')
insert into autolistpartition values (4, 1, 2020, 'Australia')
insert into autolistpartition values (5, 2, 2018, 'Sri Lanka')
insert into autolistpartition values (6, 2, 2019, 'Sri Lanka')
insert into autolistpartition values (7, 2, 2020, 'Australia')
insert into autolistpartition values (8, 2, 2020, 'Sri Lanka')
insert into autolistpartition values (9, 3, 2020, 'Sri Lanka')
insert into autolistpartition values (10, 4, 2018, 'Sri Lanka')
insert into autolistpartition values (11, 4, 2019, 'Sri Lanka')
insert into autolistpartition values (12, 4, 2020, 'Sri Lanka')
insert into autolistpartition values (13, 5, 2018, 'Sri Lanka')
insert into autolistpartition values (14, 5, 2019, 'Sri Lanka')
insert into autolistpartition values (15, 5, 2020, 'Australia')
insert into autolistpartition values (16, 5, 2020, 'Sri Lanka')
insert into autolistpartition values (17, 6, 2018, 'Sri Lanka')
insert into autolistpartition values (18, 6, 2019, 'Sri Lanka')
insert into autolistpartition values (19, 6, 2020, 'Sri Lanka')
insert into autolistpartition values (20, 6, 2015, 'Australia')
insert into autolistpartition values (21, 7, 2016, 'Sri Lanka')
insert into autolistpartition values (22, 7, 2015, 'Sri Lanka')
insert into autolistpartition values (23, 6, 2016, 'Australia')
insert into autolistpartition values (24, 8, 2018, 'Sri Lanka')
insert into autolistpartition values (25, 8, 2020, 'Sri Lanka')
insert into autolistpartition values (26, 9, 2017, 'Sri Lanka')
insert into autolistpartition values (27, 10, 2017, 'Sri Lanka')
insert into autolistpartition values (28, 11, 2017, 'Sri Lanka')
insert into autolistpartition values (29, 12, 2017, 'Sri Lanka')
commit;

rem metadata, newly created partition
select partition_name, high_value 
from user_tab_partitions where table_name='autolistpartition' order by partition_position;

select * from autolistpartition partition (p1);
select * from autolistpartition partition (p2);

rem change auto-generated name
alter table autolistpartition rename partition for (2017) to p2017;

rem standard PMOP that would not be allowed on interval partitioned table
alter table autolistpartition add partition pnew values (2016,2015);

rem see the newly created partition
select partition_name, high_value 
from user_tab_partitions where table_name='autolistpartition' order by partition_position;
