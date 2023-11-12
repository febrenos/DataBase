-- tipo
CREATE OR REPLACE PROCEDURE insert_tipo(
    p_cod_tipo NUMBER,
    p_descricao VARCHAR2
)
AS
BEGIN
    INSERT INTO tipo (cod_tipo, descricao)
    VALUES (p_cod_tipo, p_descricao);
END;
/

-- produto
CREATE OR REPLACE PROCEDURE insert_produto(
    p_cod_produto NUMBER,
    p_descricao VARCHAR2,
    p_tipo_cod_tipo NUMBER
)
AS
BEGIN
    INSERT INTO produto (cod_produto, descricao, tipo_cod_tipo)
    VALUES (p_cod_produto, p_descricao, p_tipo_cod_tipo);
END;
/

-- cargo
CREATE OR REPLACE PROCEDURE insert_cargo(
    p_cod_cargo NUMBER,
    p_nome VARCHAR2
)
AS
BEGIN
    INSERT INTO cargo (cod_cargo, nome)
    VALUES (p_cod_cargo, p_nome);
END;
/

-- funcionario
CREATE OR REPLACE PROCEDURE insert_funcionario(
    p_cod_funcionario NUMBER,
    p_nome VARCHAR2,
    p_data_cadastro DATE,
    p_cargo_cod_cargo NUMBER,
    p_funcionario_cod_funcionario NUMBER
)
AS
BEGIN
    -- Inserting data into the funcionario table
    INSERT INTO funcionario (cod_funcionario, nome, data_cadastro, cargo_cod_cargo, funcionario_cod_funcionario)
    VALUES (p_cod_funcionario, p_nome, p_data_cadastro, p_cargo_cod_cargo, p_funcionario_cod_funcionario);

    COMMIT; -- Committing the changes to make them permanent

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK; -- Rolling back in case of an error to maintain data consistency
END;
/

-- pais
CREATE OR REPLACE PROCEDURE insert_pais(
    p_cod_pais NUMBER,
    p_nome VARCHAR2
)
AS
BEGIN
    INSERT INTO pais (cod_pais, nome)
    VALUES (p_cod_pais, p_nome);
END;
/

-- estado
CREATE OR REPLACE PROCEDURE insert_estado(
    p_cod_estado NUMBER,
    p_nome VARCHAR2,
    p_pais_cod_pais NUMBER
)
AS
    v_count NUMBER;
BEGIN
    -- Verifica se o cod_estado já existe na tabela
    SELECT COUNT(*)
    INTO v_count
    FROM estado
    WHERE cod_estado = p_cod_estado;

    -- Se o cod_estado não existe, realiza a inserção
    IF v_count = 0 THEN
        INSERT INTO estado (cod_estado, nome_estado, pais_cod_pais)
        VALUES (p_cod_estado, p_nome, p_pais_cod_pais);
    ELSE
        -- Se o cod_estado já existe, você pode decidir o que fazer aqui,
        -- por exemplo, levantar uma exceção ou realizar alguma ação específica.
        -- Neste exemplo, vou levantar uma exceção.
        RAISE_APPLICATION_ERROR(-20001, 'O cod_estado já existe na tabela estado.');
    END IF;
END;
/


-- cidade
CREATE OR REPLACE PROCEDURE insert_cidade(
    p_cod_cidade NUMBER,
    p_nome VARCHAR2,
    p_estado_cod_estado NUMBER
)
AS
    v_count NUMBER;
BEGIN
    -- Verifica se o estado_cod_estado existe na tabela estado
    SELECT COUNT(*)
    INTO v_count
    FROM estado
    WHERE cod_estado = p_estado_cod_estado;

    -- Se o estado_cod_estado existe, realiza a inserção na tabela cidade
    IF v_count > 0 THEN
        INSERT INTO cidade (cod_cidade, nome, estado_cod_estado)
        VALUES (p_cod_cidade, p_nome, p_estado_cod_estado);
    ELSE
        -- Se o estado_cod_estado não existe, levanta uma exceção
        RAISE_APPLICATION_ERROR(-20001, 'O estado_cod_estado não existe na tabela estado.');
    END IF;
END;
/


-- bairro
CREATE OR REPLACE PROCEDURE insert_bairro(
    p_cod_bairro NUMBER, 
    p_nome VARCHAR2, 
    p_cidade_cod_cidade NUMBER) IS
BEGIN
    INSERT INTO bairro (cod_bairro, nome, cidade_cod_cidade)
    VALUES (p_cod_bairro, p_nome, p_cidade_cod_cidade);
    COMMIT;
END insert_bairro;
/

-- endereco_cliente
CREATE OR REPLACE PROCEDURE insert_endereco_cliente(
    p_cod_endereco NUMBER,
    p_numero NUMBER,
    p_cep NUMBER,
    p_referencia VARCHAR2,
    p_bairro_cod_bairro NUMBER
)
AS
BEGIN
    INSERT INTO endereco_cliente (cod_endereco, numero, cep, referencia, bairro_cod_bairro)
    VALUES (p_cod_endereco, p_numero, p_cep, p_referencia, p_bairro_cod_bairro);
END;
/

-- cliente
CREATE OR REPLACE PROCEDURE insert_cliente(
    p_cod_cliente NUMBER,
    p_nome VARCHAR2,
    p_endereco_cliente_cod_endereco NUMBER
)
AS
BEGIN
    INSERT INTO cliente (cod_cliente, nome, endereco_cliente_cod_endereco)
    VALUES (p_cod_cliente, p_nome, p_endereco_cliente_cod_endereco);
END;
/

-- genero
CREATE OR REPLACE PROCEDURE insert_genero(
    p_cod_genero NUMBER,
    p_descricao VARCHAR2
)
AS
BEGIN
    INSERT INTO genero (cod_genero, descricao)
    VALUES (p_cod_genero, p_descricao);
END;
/

-- cliente_fisico
CREATE OR REPLACE PROCEDURE insert_cliente_fisico(
    p_cod_cli_fisico NUMBER,
    p_cpf NUMBER,
    p_cliente_cod_cliente NUMBER,
    p_genero_cod_genero NUMBER
)
AS
BEGIN
    INSERT INTO cliente_fisico (cod_cli_fisico, cpf, cliente_cod_cliente, genero_cod_genero)
    VALUES (p_cod_cli_fisico, p_cpf, p_cliente_cod_cliente, p_genero_cod_genero);
END;
/

-- cliente_jurica
CREATE OR REPLACE PROCEDURE insert_cliente_jurica(
    p_cod_pessoa_ju NUMBER,
    p_cnpj NUMBER,
    p_ie NUMBER,
    p_cliente_cod_cliente NUMBER
)
AS
BEGIN
    INSERT INTO cliente_jurica (cod_pessoa_ju, cnpj, ie, cliente_cod_cliente)
    VALUES (p_cod_pessoa_ju, p_cnpj, p_ie, p_cliente_cod_cliente);
END;
/

-- pedido
CREATE OR REPLACE PROCEDURE inserir_pedido(
    p_cod_pedido NUMBER, 
    p_data DATE, 
    p_cod_cliente_fisico NUMBER, 
    p_cod_cliente NUMBER, 
    p_cod_genero NUMBER, 
    p_cod_funcionario NUMBER, 
    p_cod_cliente_jurica NUMBER, 
    p_cod_funcionario2 NUMBER) IS
BEGIN
    INSERT INTO pedido (cod_pedido, data, cliente_fisico_cod_cli_fisico,
                        cliente_fisico_cliente_cod_cliente, cliente_fisico_genero_cod_genero,
                        funcionario_cod_funcionario, cliente_jurica_cod_pessoa_ju, 
                        funcionario_cod_funcionario2)
    VALUES (p_cod_pedido, p_data, p_cod_cliente_fisico,
            p_cod_cliente, p_cod_genero, p_cod_funcionario,
            p_cod_cliente_jurica, p_cod_funcionario2);
    COMMIT;
END inserir_pedido;
/

-- item_pedido
CREATE OR REPLACE PROCEDURE insert_item_pedido(
    p_quantidade NUMBER,
    p_valor_unitario NUMBER,
    p_valor_total NUMBER,
    p_pedido_cod_pedido NUMBER,
    p_produto_cod_produto NUMBER
)
AS
BEGIN
    INSERT INTO item_pedido (quantidade, valor_unitario, valor_total, pedido_cod_pedido, produto_cod_produto)
    VALUES (p_quantidade, p_valor_unitario, p_valor_total, p_pedido_cod_pedido, p_produto_cod_produto);
END;
/