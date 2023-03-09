
-- sequence1
CREATE sequence SQ_T_USUARIO INCREMENT BY 1 START WITH 1;
CREATE TABLE T_USUARIO (cd_usuario number PRIMARY KEY, nm_usuario VARCHAR2(100));
INSERT INTO T_USUARIO (cd_usuario, nm_usuario) VALUES (SQ_T_USUARIO.nextval, 'Ronqui');
select * from T_USUARIO;

-- sequence2
CREATE SEQUENCE user_seq START WITH 1;
CREATE TABLE estacao_recarga (
    id_estacao INTEGER DEFAULT user_seq.nextval NOT NULL,
    nome_estacao VARCHAR2(100) NOT NULL,
    nome_empresa VARCHAR2(100),
