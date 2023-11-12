-- select * from tipo;
-- select * from produto;
-- select * from cargo;
-- select * from funcionario;
-- select * from pais;
-- select * from estado;
-- select * from cidade;
-- select * from bairro;
-- select * from endereco_cliente;
-- select * from cliente;
-- select * from genero;
-- select * from cliente_fisico;
-- select * from cliente_jurica;
-- select * from pedido;
-- select * from item_pedido;

-- item_pedido
TRUNCATE TABLE item_pedido;
TRUNCATE TABLE item_pedido_temp;
DROP TABLE item_pedido_temp;

-- pedido
TRUNCATE TABLE pedido;
TRUNCATE TABLE pedido_temp;
DROP TABLE pedido_temp;

-- cliente_jurica
TRUNCATE TABLE cliente_jurica;
TRUNCATE TABLE cliente_jurica_temp;
DROP TABLE cliente_jurica_temp;

-- cliente_fisico
TRUNCATE TABLE cliente_fisico;
TRUNCATE TABLE cliente_fisico_temp;
DROP TABLE cliente_fisico_temp;

-- genero
TRUNCATE TABLE genero;
TRUNCATE TABLE genero_temp;
DROP TABLE genero_temp;

-- cliente
TRUNCATE TABLE cliente;
TRUNCATE TABLE cliente_temp;
DROP TABLE cliente_temp;

-- endereco_cliente
TRUNCATE TABLE endereco_cliente;
TRUNCATE TABLE endereco_cliente_temp;
DROP TABLE endereco_cliente_temp;

-- bairro
TRUNCATE TABLE bairro;
TRUNCATE TABLE bairro_temp;
DROP TABLE bairro_temp;

-- cidade
TRUNCATE TABLE cidade;
TRUNCATE TABLE cidade_temp;
DROP TABLE cidade_temp;

-- estado
TRUNCATE TABLE estado;
TRUNCATE TABLE estado_temp;
DROP TABLE estado_temp;

-- pais
TRUNCATE TABLE pais;
TRUNCATE TABLE pais_temp;
DROP TABLE pais_temp;

-- Funcionário
TRUNCATE TABLE funcionario;
TRUNCATE TABLE funcionario_temp;
DROP TABLE funcionario_temp;

-- Cargo
TRUNCATE TABLE cargo;
TRUNCATE TABLE cargo_temp;
DROP TABLE cargo_temp;

-- Produto
TRUNCATE TABLE produto;
TRUNCATE TABLE produto_temp;
DROP TABLE produto_temp;

-- Tipo
TRUNCATE TABLE tipo;
TRUNCATE TABLE tipo_temp;
DROP TABLE tipo_temp;

-- tipo
CREATE GLOBAL TEMPORARY TABLE tipo_temp (
    column1 NUMBER,
    column2 VARCHAR2(30)
) ON COMMIT PRESERVE ROWS;

INSERT INTO tipo_temp VALUES (1, 'Tipo A');
INSERT INTO tipo_temp VALUES (2, 'Tipo B');
INSERT INTO tipo_temp VALUES (3, 'Tipo C');
INSERT INTO tipo_temp VALUES (4, 'Tipo D');
INSERT INTO tipo_temp VALUES (5, 'Tipo E');
INSERT INTO tipo_temp VALUES (6, 'Tipo F');
INSERT INTO tipo_temp VALUES (7, 'Tipo G');
INSERT INTO tipo_temp VALUES (8, 'Tipo H');
INSERT INTO tipo_temp VALUES (9, 'Tipo I');
INSERT INTO tipo_temp VALUES (10, 'Tipo J');

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_tipo_temp IS
        SELECT column1, column2 FROM tipo_temp;

    v_cod_tipo NUMBER;
    v_descricao VARCHAR2(30);
BEGIN
    FOR temp_rec IN c_tipo_temp
    LOOP
        v_cod_tipo := temp_rec.column1;
        v_descricao := temp_rec.column2;


        insert_tipo(v_cod_tipo, v_descricao);
        
        DBMS_OUTPUT.PUT_LINE('v_cod_tipo: ' || v_cod_tipo || ', v_descricao: ' || v_descricao);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- produto
CREATE GLOBAL TEMPORARY TABLE produto_temp (
    column1 NUMBER,
    column2 VARCHAR2(30),
    column3 NUMBER
) ON COMMIT PRESERVE ROWS; --disponível até o final da sessão orcl

INSERT INTO produto_temp VALUES (1, 'Produto A', 1);
INSERT INTO produto_temp VALUES (2, 'Produto B', 2);
INSERT INTO produto_temp VALUES (3, 'Produto C', 3);
INSERT INTO produto_temp VALUES (4, 'Produto D', 4);
INSERT INTO produto_temp VALUES (5, 'Produto E', 5);
INSERT INTO produto_temp VALUES (6, 'Produto F', 6);
INSERT INTO produto_temp VALUES (7, 'Produto G', 7);
INSERT INTO produto_temp VALUES (8, 'Produto H', 8);
INSERT INTO produto_temp VALUES (9, 'Produto I', 9);
INSERT INTO produto_temp VALUES (10, 'Produto J', 10);


SET SERVEROUTPUT ON
DECLARE
    CURSOR c_produto_temp IS
        SELECT column1, column2, column3 FROM produto_temp;

    p_cod_produto NUMBER;
    p_descricao VARCHAR2(30);
    p_tipo_cod_tipo NUMBER;
BEGIN
    FOR temp_rec IN c_produto_temp
    LOOP
        p_cod_produto := temp_rec.column1;
        p_descricao := temp_rec.column2;
        p_tipo_cod_tipo := temp_rec.column3;

        insert_produto(p_cod_produto, p_descricao, p_tipo_cod_tipo);
        
        DBMS_OUTPUT.PUT_LINE('p_cod_produto: ' || p_cod_produto || ', p_descricao: ' || p_descricao || ', p_tipo_cod_tipo: ' || p_tipo_cod_tipo);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- cargo
CREATE GLOBAL TEMPORARY TABLE cargo_temp (
    column1 NUMBER,
    column2 VARCHAR2(30)
) ON COMMIT PRESERVE ROWS; --disponível até o final da sessão orcl

INSERT INTO cargo_temp VALUES (1, 'Cargo B');
INSERT INTO cargo_temp VALUES (2, 'Cargo B');
INSERT INTO cargo_temp VALUES (3, 'Cargo C');
INSERT INTO cargo_temp VALUES (4, 'Cargo D');
INSERT INTO cargo_temp VALUES (5, 'Cargo E');
INSERT INTO cargo_temp VALUES (6, 'Cargo F');
INSERT INTO cargo_temp VALUES (7, 'Cargo G');
INSERT INTO cargo_temp VALUES (8, 'Cargo H');
INSERT INTO cargo_temp VALUES (9, 'Cargo I');
INSERT INTO cargo_temp VALUES (10, 'Cargo J');

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_cargo_temp IS
        SELECT column1, column2 FROM cargo_temp;

    p_cod_cargo NUMBER;
    p_nome VARCHAR2(30);
BEGIN
    FOR temp_rec IN c_cargo_temp
    LOOP
        p_cod_cargo := temp_rec.column1;
        p_nome := temp_rec.column2;

        insert_cargo(p_cod_cargo, p_nome);
        
        DBMS_OUTPUT.PUT_LINE('p_cod_cargo: ' || p_cod_cargo || ', p_nome: ' || p_nome);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- funcionario
CREATE GLOBAL TEMPORARY TABLE funcionario_temp (
    column1 NUMBER,
    column2 VARCHAR2(30),
    column3 DATE,
    column4 NUMBER,
    column5 NUMBER
) ON COMMIT PRESERVE ROWS; --disponível até o final da sessão orcl

INSERT INTO funcionario_temp VALUES (1, 'Funcionario A', SYSDATE, 1, 1);
INSERT INTO funcionario_temp VALUES (2, 'Funcionario B', SYSDATE, 2, 1);
INSERT INTO funcionario_temp VALUES (3, 'Funcionario C', SYSDATE, 3, 2);
INSERT INTO funcionario_temp VALUES (4, 'Funcionario D', SYSDATE, 4, 3);
INSERT INTO funcionario_temp VALUES (5, 'Funcionario E', SYSDATE, 5, 4);
INSERT INTO funcionario_temp VALUES (6, 'Funcionario F', SYSDATE, 6, 5);
INSERT INTO funcionario_temp VALUES (7, 'Funcionario G', SYSDATE, 7, 6);
INSERT INTO funcionario_temp VALUES (8, 'Funcionario H', SYSDATE, 8, 7);
INSERT INTO funcionario_temp VALUES (9, 'Funcionario I', SYSDATE, 9, 8);
INSERT INTO funcionario_temp VALUES (10, 'Funcionario J', SYSDATE, 10, 9);

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_funcionario_temp IS
        SELECT column1, column2, column3, column4, column5 FROM funcionario_temp;

    p_cod_funcionario NUMBER;
    p_nome VARCHAR2(30);
    p_data_cadastro DATE;
    p_cargo_cod_cargo NUMBER;
    p_funcionario_cod_funcionario NUMBER;
BEGIN
    FOR temp_rec IN c_funcionario_temp
    LOOP
        p_cod_funcionario := temp_rec.column1;
        p_nome := temp_rec.column2;
        p_data_cadastro := temp_rec.column3;
        p_cargo_cod_cargo := temp_rec.column4;
        p_funcionario_cod_funcionario := temp_rec.column5;

        insert_funcionario(p_cod_funcionario, p_nome, p_data_cadastro, p_cargo_cod_cargo, p_funcionario_cod_funcionario);
        
        DBMS_OUTPUT.PUT_LINE('p_cod_funcionario: ' || p_cod_funcionario || ', ' ||
            'p_nome: ' || p_nome || ', ' ||
            'p_data_cadastro: ' || p_data_cadastro || ', ' ||
            'p_cargo_cod_cargo: ' || p_cargo_cod_cargo || ', ' ||
            'p_funcionario_cod_funcionario: ' || p_funcionario_cod_funcionario);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- pais
CREATE GLOBAL TEMPORARY TABLE pais_temp (
    column1 NUMBER,
    column2 VARCHAR2(30)
) ON COMMIT PRESERVE ROWS;
INSERT INTO pais_temp VALUES (1, 'Pais A');
INSERT INTO pais_temp VALUES (2, 'Pais B');
INSERT INTO pais_temp VALUES (3, 'Pais C');
INSERT INTO pais_temp VALUES (4, 'Pais D');
INSERT INTO pais_temp VALUES (5, 'Pais E');
INSERT INTO pais_temp VALUES (6, 'Pais F');
INSERT INTO pais_temp VALUES (7, 'Pais G');
INSERT INTO pais_temp VALUES (8, 'Pais H');
INSERT INTO pais_temp VALUES (9, 'Pais I');
INSERT INTO pais_temp VALUES (10, 'Pais J');

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_pais_temp IS
        SELECT column1, column2 FROM pais_temp;

    p_cod_pais NUMBER;
    p_nome VARCHAR2(30);
BEGIN
    FOR temp_rec IN c_pais_temp
    LOOP
        p_cod_pais := temp_rec.column1;
        p_nome := temp_rec.column2;

        insert_pais(p_cod_pais, p_nome);
        
        DBMS_OUTPUT.PUT_LINE('p_cod_pais: ' || p_cod_pais || ', p_nome: ' || p_nome);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- estado
CREATE GLOBAL TEMPORARY TABLE estado_temp (
    column1 NUMBER,
    column2 VARCHAR2(30),
    column3 NUMBER
) ON COMMIT PRESERVE ROWS;

INSERT INTO estado_temp VALUES (1, 'Estado A', 1);
INSERT INTO estado_temp VALUES (2, 'Estado B', 2);
INSERT INTO estado_temp VALUES (3, 'Estado C', 3);
INSERT INTO estado_temp VALUES (4, 'Estado D', 4);
INSERT INTO estado_temp VALUES (5, 'Estado E', 5);
INSERT INTO estado_temp VALUES (6, 'Estado F', 6);
INSERT INTO estado_temp VALUES (7, 'Estado G', 7);
INSERT INTO estado_temp VALUES (8, 'Estado H', 8);
INSERT INTO estado_temp VALUES (9, 'Estado I', 9);
INSERT INTO estado_temp VALUES (10, 'Estado J', 10);

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_estado_temp IS
        SELECT column1, column2, column3 FROM estado_temp;

    p_cod_estado NUMBER;
    p_nome VARCHAR2(30);
    p_pais_cod_pais NUMBER;
BEGIN
    FOR temp_rec IN c_estado_temp
    LOOP
        p_cod_estado := temp_rec.column1;
        p_nome := temp_rec.column2;
        p_pais_cod_pais := temp_rec.column3;

        insert_estado(p_cod_estado, p_nome, p_pais_cod_pais);
        
        DBMS_OUTPUT.PUT_LINE('p_cod_estado: ' || p_cod_estado || ', p_nome: ' || p_nome || ', p_pais_cod_pais: ' || p_pais_cod_pais);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- cidade
CREATE GLOBAL TEMPORARY TABLE cidade_temp (
    column1 NUMBER,
    column2 VARCHAR2(30),
    column3 NUMBER
) ON COMMIT PRESERVE ROWS;

INSERT INTO cidade_temp VALUES (1, 'Cidade A', 1);
INSERT INTO cidade_temp VALUES (2, 'Cidade B', 1);
INSERT INTO cidade_temp VALUES (3, 'Cidade C', 1);
INSERT INTO cidade_temp VALUES (4, 'Cidade D', 2);
INSERT INTO cidade_temp VALUES (5, 'Cidade E', 2);
INSERT INTO cidade_temp VALUES (6, 'Cidade F', 2);
INSERT INTO cidade_temp VALUES (7, 'Cidade G', 3);
INSERT INTO cidade_temp VALUES (8, 'Cidade H', 3);
INSERT INTO cidade_temp VALUES (9, 'Cidade I', 4);
INSERT INTO cidade_temp VALUES (10, 'Cidade J', 4);

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_cidade_temp IS
        SELECT column1, column2, column3 FROM cidade_temp;

    p_cod_cidade NUMBER;
    p_nome VARCHAR2(30);
    p_estado_cod_estado NUMBER;
BEGIN
    FOR temp_rec IN c_cidade_temp
    LOOP
        p_cod_cidade := temp_rec.column1;
        p_nome := temp_rec.column2;
        p_estado_cod_estado := temp_rec.column3;

        insert_cidade(p_cod_cidade, p_nome, p_estado_cod_estado);
        
        DBMS_OUTPUT.PUT_LINE('p_cod_cidade: ' || p_cod_cidade || ', p_nome: ' || p_nome || ', p_estado_cod_estado: ' || p_estado_cod_estado);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- bairro
CREATE GLOBAL TEMPORARY TABLE bairro_temp (
    column1 NUMBER, 
    column2 VARCHAR2(30), 
    column3 NUMBER
) ON COMMIT PRESERVE ROWS;

INSERT INTO bairro_temp VALUES (1, 'Bairro1', 1);
INSERT INTO bairro_temp VALUES (2, 'Bairro2', 2);
INSERT INTO bairro_temp VALUES (3, 'Bairro3', 3);
INSERT INTO bairro_temp VALUES (4, 'Bairro4', 4);
INSERT INTO bairro_temp VALUES (5, 'Bairro5', 5);
INSERT INTO bairro_temp VALUES (6, 'Bairro6', 6);
INSERT INTO bairro_temp VALUES (7, 'Bairro7', 7);
INSERT INTO bairro_temp VALUES (8, 'Bairro8', 8);
INSERT INTO bairro_temp VALUES (9, 'Bairro9', 9);
INSERT INTO bairro_temp VALUES (10, 'Bairro10', 10);

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_bairro_temp IS
        SELECT column1, column2, column3 FROM bairro_temp;

    p_cod_bairro NUMBER;
    p_nome VARCHAR2(30);
    p_cidade_cod_cidade NUMBER;
BEGIN
    FOR temp_rec IN c_bairro_temp
    LOOP
        p_cod_bairro := temp_rec.column1;
        p_nome := temp_rec.column2;
        p_cidade_cod_cidade := temp_rec.column3;

        insert_bairro(p_cod_bairro, p_nome, p_cidade_cod_cidade);
        
        DBMS_OUTPUT.PUT_LINE('p_cod_bairro: ' || p_cod_bairro || ', p_nome: ' || p_nome || ', p_cidade_cod_cidade: ' || p_cidade_cod_cidade);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- endereco_cliente
CREATE GLOBAL TEMPORARY TABLE endereco_cliente_temp (
    column1 NUMBER,
    column2 NUMBER,
    column3 NUMBER,
    column4 VARCHAR2(200),
    column5 NUMBER
) ON COMMIT PRESERVE ROWS;

INSERT INTO endereco_cliente_temp VALUES (1, 456, 45678, 'Referencia A', 1);
INSERT INTO endereco_cliente_temp VALUES (2, 456, 45678, 'Referencia B', 2);
INSERT INTO endereco_cliente_temp VALUES (3, 789, 78901, 'Referencia C', 3);
INSERT INTO endereco_cliente_temp VALUES (4, 901, 90123, 'Referencia D', 4);
INSERT INTO endereco_cliente_temp VALUES (5, 234, 23456, 'Referencia E', 5);
INSERT INTO endereco_cliente_temp VALUES (6, 567, 56789, 'Referencia F', 6);
INSERT INTO endereco_cliente_temp VALUES (7, 890, 89012, 'Referencia G', 7);
INSERT INTO endereco_cliente_temp VALUES (8, 123, 12345, 'Referencia H', 8);
INSERT INTO endereco_cliente_temp VALUES (9, 432, 43210, 'Referencia I', 9);
INSERT INTO endereco_cliente_temp VALUES (10, 210, 21098, 'Referencia J', 10);

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_bairro_temp IS
        SELECT column1, column2, column3, column4, column5 FROM endereco_cliente_temp;

    p_cod_endereco NUMBER;
    p_numero NUMBER;
    p_cep NUMBER;
    p_referencia VARCHAR2(200);
    p_bairro_cod_bairro NUMBER;
BEGIN
    FOR temp_rec IN c_bairro_temp
    LOOP
        p_cod_endereco := temp_rec.column1;
        p_numero := temp_rec.column2;
        p_cep := temp_rec.column3;
        p_referencia := temp_rec.column4;
        p_bairro_cod_bairro := temp_rec.column5;

        insert_endereco_cliente(p_cod_endereco, p_numero, p_cep, p_referencia, p_bairro_cod_bairro);

        DBMS_OUTPUT.PUT_LINE('p_cod_endereco: ' || p_cod_endereco || ', ' ||
                             'p_numero: ' || p_numero || ', ' ||
                             'p_cep: ' || p_cep || ', ' ||
                             'p_referencia: ' || p_referencia || ', ' ||
                             'p_bairro_cod_bairro: ' || p_bairro_cod_bairro);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- cliente
CREATE GLOBAL TEMPORARY TABLE cliente_temp (
    column1 NUMBER,
    column2 VARCHAR2(50),
    column3 NUMBER
) ON COMMIT PRESERVE ROWS;

INSERT INTO cliente_temp VALUES (1, 'Cliente A', 1);
INSERT INTO cliente_temp VALUES (2, 'Cliente B', 2);
INSERT INTO cliente_temp VALUES (3, 'Cliente C', 3);
INSERT INTO cliente_temp VALUES (4, 'Cliente D', 4);
INSERT INTO cliente_temp VALUES (5, 'Cliente E', 5);
INSERT INTO cliente_temp VALUES (6, 'Cliente F', 6);
INSERT INTO cliente_temp VALUES (7, 'Cliente G', 7);
INSERT INTO cliente_temp VALUES (8, 'Cliente H', 8);
INSERT INTO cliente_temp VALUES (9, 'Cliente I', 9);
INSERT INTO cliente_temp VALUES (10, 'Cliente J', 10);

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_cliente_temp IS
        SELECT column1, column2, column3 FROM cliente_temp;

    p_cod_cliente NUMBER;
    p_nome VARCHAR2(50);
    p_endereco_cliente_cod_endereco NUMBER;
BEGIN
    FOR temp_rec IN c_cliente_temp
    LOOP
        p_cod_cliente := temp_rec.column1;
        p_nome := temp_rec.column2;
        p_endereco_cliente_cod_endereco := temp_rec.column3;

        insert_cliente(p_cod_cliente, p_nome, p_endereco_cliente_cod_endereco);

        DBMS_OUTPUT.PUT_LINE('p_cod_cliente: ' || p_cod_cliente || ', ' ||
            'p_nome: ' || p_nome || ', ' ||
            'p_endereco_cliente_cod_endereco: ' || p_endereco_cliente_cod_endereco
        );
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- genero
CREATE GLOBAL TEMPORARY TABLE genero_temp (
    column1 NUMBER,
    column2 VARCHAR2(30)

) ON COMMIT PRESERVE ROWS;

INSERT INTO genero_temp VALUES (1, 'Feminino');
INSERT INTO genero_temp VALUES (2, 'Feminino');
INSERT INTO genero_temp VALUES (3, 'Outro');
INSERT INTO genero_temp VALUES (4, 'Não informado');
INSERT INTO genero_temp VALUES (5, 'Masculino');
INSERT INTO genero_temp VALUES (6, 'Feminino');
INSERT INTO genero_temp VALUES (7, 'Outro');
INSERT INTO genero_temp VALUES (8, 'Não informado');
INSERT INTO genero_temp VALUES (9, 'Masculino');
INSERT INTO genero_temp VALUES (10, 'Outros');


SET SERVEROUTPUT ON
DECLARE
    CURSOR c_genero_temp IS
        SELECT column1, column2  FROM genero_temp;
        
    p_cod_genero NUMBER;
    p_descricao VARCHAR2(30);
BEGIN
    FOR temp_rec IN c_genero_temp
    LOOP
        p_cod_genero := temp_rec.column1;
        p_descricao := temp_rec.column2;

        insert_genero(p_cod_genero, p_descricao);
        
        DBMS_OUTPUT.PUT_LINE('p_cod_genero: ' || p_cod_genero || ', ' ||
            'p_descricao: ' || p_descricao);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- cliente_fisico
CREATE GLOBAL TEMPORARY TABLE cliente_fisico_temp (
    column1 NUMBER,
    column2 NUMBER,
    column3 NUMBER,
    column4 NUMBER

) ON COMMIT PRESERVE ROWS;

INSERT INTO cliente_fisico_temp VALUES (1, 987654321, 1, 1);
INSERT INTO cliente_fisico_temp VALUES (2, 987654321, 2, 2);
INSERT INTO cliente_fisico_temp VALUES (3, 234567890, 3, 3);
INSERT INTO cliente_fisico_temp VALUES (4, 345678901, 4, 4);
INSERT INTO cliente_fisico_temp VALUES (5, 456789012, 5, 5);
INSERT INTO cliente_fisico_temp VALUES (6, 567890123, 6, 6);
INSERT INTO cliente_fisico_temp VALUES (7, 678901234, 7, 7);
INSERT INTO cliente_fisico_temp VALUES (8, 789012345, 8, 8);
INSERT INTO cliente_fisico_temp VALUES (9, 890123456, 9, 9);
INSERT INTO cliente_fisico_temp VALUES (10, 901234567, 10, 10);

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_cliente_fisico_temp IS
        SELECT column1, column2, column3, column4  FROM cliente_fisico_temp;

    p_cod_cli_fisico NUMBER;
    p_cpf NUMBER;
    p_cliente_cod_cliente NUMBER;
    p_genero_cod_genero NUMBER;
BEGIN
    FOR temp_rec IN c_cliente_fisico_temp
    LOOP
        p_cod_cli_fisico := temp_rec.column1;
        p_cpf := temp_rec.column2;
        p_cliente_cod_cliente := temp_rec.column3;
        p_genero_cod_genero := temp_rec.column4;

        insert_cliente_fisico(p_cod_cli_fisico, p_cpf, p_cliente_cod_cliente, p_genero_cod_genero);
        
        DBMS_OUTPUT.PUT_LINE('p_cod_cli_fisico: ' || p_cod_cli_fisico || ', ' ||
            'p_cpf: ' || p_cpf ||
            ', p_cliente_cod_cliente: ' || p_cliente_cod_cliente ||
            ', p_genero_cod_genero: ' || p_genero_cod_genero);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- cliente_jurica
CREATE GLOBAL TEMPORARY TABLE cliente_jurica_temp (
    column1 NUMBER,
    column2 NUMBER,
    column3 NUMBER,
    column4 NUMBER

) ON COMMIT PRESERVE ROWS;

INSERT INTO cliente_jurica_temp VALUES (1, 123456789, 654, 1);
INSERT INTO cliente_jurica_temp VALUES (2, 123456789, 654, 2);
INSERT INTO cliente_jurica_temp VALUES (3, 234567890, 321, 3);
INSERT INTO cliente_jurica_temp VALUES (4, 345678901, 987, 4);
INSERT INTO cliente_jurica_temp VALUES (5, 456789012, 456, 5);
INSERT INTO cliente_jurica_temp VALUES (6, 567890123, 789, 6);
INSERT INTO cliente_jurica_temp VALUES (7, 678901234, 321, 7);
INSERT INTO cliente_jurica_temp VALUES (8, 789012345, 654, 8);
INSERT INTO cliente_jurica_temp VALUES (9, 890123456, 987, 9);
INSERT INTO cliente_jurica_temp VALUES (10, 901234567, 123, 10);

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_cliente_jurica_temp IS
        SELECT column1, column2, column3, column4  FROM cliente_jurica_temp;

    p_cod_pessoa_ju NUMBER;
    p_cnpj NUMBER;
    p_ie NUMBER;
    p_cliente_cod_cliente NUMBER;
BEGIN
    FOR temp_rec IN c_cliente_jurica_temp
    LOOP
        p_cod_pessoa_ju := temp_rec.column1;
        p_cnpj := temp_rec.column2;
        p_ie := temp_rec.column3;
        p_cliente_cod_cliente := temp_rec.column4;

        insert_cliente_jurica(p_cod_pessoa_ju, p_cnpj, p_ie, p_cliente_cod_cliente);
        
        DBMS_OUTPUT.PUT_LINE('p_cod_pessoa_ju: ' || p_cod_pessoa_ju ||
            ', p_cnpj: ' || p_cnpj ||
            ', p_ie: ' || p_ie ||
            ', p_cliente_cod_cliente: ' || p_cliente_cod_cliente);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- pedido
CREATE GLOBAL TEMPORARY TABLE pedido_temp (
    column1 NUMBER, 
    column2 DATE, 
    column3 NUMBER, 
    column4 NUMBER, 
    column5 NUMBER, 
    column6 NUMBER, 
    column7 NUMBER, 
    column8 NUMBER
) ON COMMIT PRESERVE ROWS;

INSERT INTO pedido_temp VALUES (1, TO_DATE('2023-11-07', 'YYYY-MM-DD'), 1, 1, 1, 1, 1, 1);
INSERT INTO pedido_temp VALUES (2, TO_DATE('2023-11-08', 'YYYY-MM-DD'), 2, 2, 2, 2, 2, 2);
INSERT INTO pedido_temp VALUES (3, TO_DATE('2023-11-09', 'YYYY-MM-DD'), 3, 3, 3, 3, 3, 3);
INSERT INTO pedido_temp VALUES (4, TO_DATE('2023-11-10', 'YYYY-MM-DD'), 4, 4, 4, 4, 4, 4);
INSERT INTO pedido_temp VALUES (5, TO_DATE('2023-11-11', 'YYYY-MM-DD'), 5, 5, 5, 5, 5, 5);
INSERT INTO pedido_temp VALUES (6, TO_DATE('2023-11-12', 'YYYY-MM-DD'), 6, 6, 6, 6, 6, 6);
INSERT INTO pedido_temp VALUES (7, TO_DATE('2023-11-13', 'YYYY-MM-DD'), 7, 7, 7, 7, 7, 7);
INSERT INTO pedido_temp VALUES (8, TO_DATE('2023-11-14', 'YYYY-MM-DD'), 8, 8, 8, 8, 8, 8);
INSERT INTO pedido_temp VALUES (9, TO_DATE('2023-11-15', 'YYYY-MM-DD'), 9, 9, 9, 9, 9, 9);
INSERT INTO pedido_temp VALUES (10, TO_DATE('2023-11-07', 'YYYY-MM-DD'), 10, 10, 10, 10, 10, 10);

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_pedido_temp IS
        SELECT column1, column2, column3, column4, column5, column6, column7, column8 FROM pedido_temp;

    p_cod_pedido NUMBER;
    p_data DATE;
    p_cod_cliente_fisico NUMBER; 
    p_cod_cliente NUMBER; 
    p_cod_genero NUMBER;
    p_cod_funcionario NUMBER;
    p_cod_cliente_jurica NUMBER; 
    p_cod_funcionario2 NUMBER;
BEGIN
    FOR temp_rec IN c_pedido_temp
    LOOP
        p_cod_pedido := temp_rec.column1;
        p_data := temp_rec.column2;
        p_cod_cliente_fisico := temp_rec.column3;
        p_cod_cliente := temp_rec.column4;
        p_cod_genero := temp_rec.column5;
        p_cod_funcionario := temp_rec.column6;
        p_cod_cliente_jurica := temp_rec.column7; 
        p_cod_funcionario2 := temp_rec.column8;

        insert_pedido(p_cod_pedido, p_data, p_cod_cliente_fisico, p_cod_cliente, p_cod_genero, p_cod_funcionario, p_cod_cliente_jurica, p_cod_funcionario2);
        
        DBMS_OUTPUT.PUT_LINE('p_cod_pedido: ' || p_cod_pedido ||
            ', p_data: ' || p_data ||
            ', p_cod_cliente_fisico: ' || p_cod_cliente_fisico ||
            ', p_cod_cliente: ' || p_cod_cliente ||
            ', p_cod_genero: ' || p_cod_genero ||
            ', p_cod_funcionario: ' || p_cod_funcionario ||
            ', p_cod_cliente_jurica: ' || p_cod_cliente_jurica ||
            ', p_cod_funcionario2: ' || p_cod_funcionario2
        );
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- item_pedido
CREATE GLOBAL TEMPORARY TABLE item_pedido_temp (
    column1 NUMBER, 
    column2 NUMBER, 
    column3 NUMBER, 
    column4 NUMBER, 
    column5 NUMBER
) ON COMMIT PRESERVE ROWS;

INSERT INTO item_pedido_temp VALUES (1, 15, 150, 1, 1);
INSERT INTO item_pedido_temp VALUES (2, 15, 150, 2, 2);
INSERT INTO item_pedido_temp VALUES (3, 20, 200, 3, 3);
INSERT INTO item_pedido_temp VALUES (4, 25, 250, 4, 4);
INSERT INTO item_pedido_temp VALUES (5, 30, 300, 5, 5);
INSERT INTO item_pedido_temp VALUES (6, 35, 350, 6, 6);
INSERT INTO item_pedido_temp VALUES (7, 40, 400, 7, 7);
INSERT INTO item_pedido_temp VALUES (8, 45, 450, 8, 8);
INSERT INTO item_pedido_temp VALUES (9, 50, 500, 9, 9);
INSERT INTO item_pedido_temp VALUES (10, 55, 550, 10, 10);

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_item_pedido_temp IS
        SELECT column1, column2, column3, column4, column5 FROM item_pedido_temp;

    p_quantidade NUMBER;   
    p_valor_unitario NUMBER;
    p_valor_total NUMBER;
    p_pedido_cod_pedido NUMBER;
    p_produto_cod_produto NUMBER;

BEGIN
    FOR temp_rec IN c_item_pedido_temp
    LOOP
        p_quantidade := temp_rec.column1;
        p_valor_unitario := temp_rec.column2;
        p_valor_total := temp_rec.column3;
        p_pedido_cod_pedido := temp_rec.column4;
        p_produto_cod_produto := temp_rec.column5;

        insert_item_pedido(p_quantidade, p_valor_unitario, p_valor_total, p_pedido_cod_pedido, p_produto_cod_produto);
        
        DBMS_OUTPUT.PUT_LINE('p_quantidade: ' || p_quantidade ||
            ', p_valor_unitario: ' || p_valor_unitario ||
            ', p_valor_total: ' || p_valor_total ||
            ', p_pedido_cod_pedido: ' || p_pedido_cod_pedido ||
            ', p_produto_cod_produto: ' || p_produto_cod_produto
        );
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/