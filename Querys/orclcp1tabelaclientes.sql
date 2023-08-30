select * from cliente;
select * from cargo;
select * from endereco;
select * from endereco_cliente;
select * from endereco_loja;
select * from fabricante;
select * from funcionario;
select * from nota_fiscal;
select * from item_nf;
select * from loja;
select * from produto;

-- deletei a tabela porque estava já populada e com tipos de dados errados
-- tem que zerar antes
drop table cliente cascade constraints;
CREATE TABLE CLIENTE 
    ( 
     codigo_cliente NUMBER (4)  NOT NULL , 
     nome_cliente VARCHAR2 (60) , 
     cpf NUMBER (11) , 
     data_nasc DATE , 
     sexo VARCHAR2 (10) , 
     estado_civil VARCHAR2 (15) 
    ) 
;
ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( codigo_cliente ) ;

insert into endereco select * from pf1788.endereco;
alter table endereco modify cep number;

insert into endereco_cliente select * from pf1788.endereco_cliente;
insert into endereco_loja select * from pf1788.endereco_loja;
insert into fabricante select * from pf1788.fabricante;
insert into funcionario select * from pf1788.funcionario;



desc cliente;
desc pf1788.cliente;
alter table cliente modify CPF varchar(30);
alter table cliente modify DATA_NASC varchar(30);
alter table cliente modify ESTADO_CIVIL varchar(30);
alter table cliente modify NOME_CLIENTE varchar(100);
insert into cliente select * from pf1788.cliente;

insert into nota_fiscal select * from pf1788.nota_fiscal;



desc NOTA_FISCAL;
desc pf1788.NOTA_FISCAL

desc nota_fiscal;
desc pf1788.nota_fiscal;
alter table nota_fiscal modify CODIGO_PRODUTO varchar(30);
alter table nota_fiscal modify CODIGO_NF number(6);
insert into nota_fiscal select * from pf1788.nota_fiscal;

desc item_nf;
desc pf1788.item_nf;
alter table item_nf modify CODIGO_PRODUTO number(4);
alter table item_nf modify CODIGO_NF number(6);
insert into item_nf select * from pf1788.item_nf;



insert into loja select * from pf1788.loja;

desc produto;
desc pf1788.produto;
alter table produto modify CODIGO_PRODUTO varchar(30);
alter table produto modify NOME_PROD varchar(100);
alter table produto modify NOME_PROD varchar(100);
insert into produto select * from pf1788.produto;


-- procedures
drop procedure Carga_cliente;

create or replace procedure Carga_cliente as
begin
insert into dimensao_cliente
select sk_cliente.nextval,
    nome_cliente,
    case when sexo = 'fem' then
    'FEMININO'
    end SEXO,
    round(sysdate-To_date (data_nasc, 'MM-DD-YYYY'), 2)
from cliente;
commit;
end;

