--ORACLE
CREATE TABLE tablins
(codigo NUMBER(5) PRIMARY KEY,
nome VARCHAR2(30),
salario NUMBER(9,2),
gerente NUMBER(5),
contr DATE);

INSERT INTO
tablins(codigo, nome, salario, gerente, contr)
VALUES(10, 'Felipe', 12345.67, 30, SYSDATE-180);//-180 dias

INSERT INTO
tablins(codigo, nome, salario, gerente, contr)
VALUES(11, 'julia', 12345.67, 30, SYSDATE-90);

INSERT INTO
tablins(codigo, nome, salario, gerente, contr)
VALUES(11, 'Ana', 12345.67, NULL, SYSDATE-90);


-- pipe || = and
-- "" colunm title
-- '' value in row
-- , separa colunas
-- || cocatena
-- DISTINCTY rm duplicate
-- ORDER BY DESC, ASC
-- commit salva os dados
-- SELECT TEXT FROM V$SQL; powers admnistrator see ALL querys runned
SELECT * FROM tablins;
SELECT nome FROM tablins;
DESCRIBE tablins;
--rotulo / alias / label / literal
SELECT nome, salario, (salario + 100) * 12 "New Salary", TRUNC((salario + 100) / salario,4) || '%' 'Percent' FROM tablins;
SELECT nome || '@fiap.com.br' "email" FROM tablins;
SELECT DISTINCT gerente FROM tablins;
SELECT nome, salario FROM tablins ORDER BY salario DESC, ASC

