create sequence SQ_T_USUARIO increment BY 1 start with 1;
create table T_USUARIO (cd_usuario number PRIMARY KEY, nm_usuario VARCHAR2(100));
insert into T_USUARIO (cd_usuario, nm_usuario) values (SQ_T_USUARIO.nextval, 'Ronqui');
select * from T_USUARIO;
