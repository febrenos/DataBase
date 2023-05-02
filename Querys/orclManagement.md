```sql
select 'drop table ' || table_name || ' cascade;' from user_tables; //generate query
select  * from user_tables;
update CIDADE set cod_cidade=0 where cod_cidade = 0;
create table CIDADE_BACKUP as select * from CIDADE;
select * from dba_users

drop table CIDADE cascade;
```

