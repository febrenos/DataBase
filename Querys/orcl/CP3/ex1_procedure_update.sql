-- Update procedures
CREATE OR REPLACE PROCEDURE update_bairro(
    p_cod_bairro NUMBER,
    p_nome VARCHAR2,
    p_cidade_cod_cidade NUMBER
)
AS
BEGIN
    UPDATE bairro
    SET nome = p_nome,
        cidade_cod_cidade = p_cidade_cod_cidade
    WHERE cod_bairro = p_cod_bairro;
END;
/

CREATE OR REPLACE PROCEDURE update_cargo(
    p_cod_cargo NUMBER,
    p_nome VARCHAR2
)
AS
BEGIN
    UPDATE cargo
    SET nome = p_nome
    WHERE cod_cargo = p_cod_cargo;
END;
/

CREATE OR REPLACE PROCEDURE update_cidade(
    p_cod_cidade NUMBER,
    p_nome VARCHAR2,
    p_estado_cod_estado NUMBER
)
AS
BEGIN
    UPDATE cidade
    SET nome = p_nome,
        estado_cod_estado = p_estado_cod_estado
    WHERE cod_cidade = p_cod_cidade;
END;
/

CREATE OR REPLACE PROCEDURE update_cliente(
    p_cod_cliente NUMBER,
    p_nome VARCHAR2,
    p_endereco_cliente_cod_endereco NUMBER
)
AS
BEGIN
    UPDATE cliente
    SET nome = p_nome,
        endereco_cliente_cod_endereco = p_endereco_cliente_cod_endereco
    WHERE cod_cliente = p_cod_cliente;
END;
/

CREATE OR REPLACE PROCEDURE update_cliente_fisico(
    p_cod_cli_fisico NUMBER,
    p_cpf NUMBER,
    p_cliente_cod_cliente NUMBER,
    p_genero_cod_genero NUMBER
)
AS
BEGIN
    UPDATE cliente_fisico
    SET cpf = p_cpf,
        cliente_cod_cliente = p_cliente_cod_cliente,
        genero_cod_genero = p_genero_cod_genero
    WHERE cod_cli_fisico = p_cod_cli_fisico;
END;
/

CREATE OR REPLACE PROCEDURE update_cliente_jurica(
    p_cod_pessoa_ju NUMBER,
    p_cnpj NUMBER,
    p_ie NUMBER,
    p_cliente_cod_cliente NUMBER
)
AS
BEGIN
    UPDATE cliente_jurica
    SET cnpj = p_cnpj,
        ie = p_ie,
        cliente_cod_cliente = p_cliente_cod_cliente
    WHERE cod_pessoa_ju = p_cod_pessoa_ju;
END;
/

CREATE OR REPLACE PROCEDURE update_endereco_cliente(
    p_cod_endereco NUMBER,
    p_numero NUMBER,
    p_cep NUMBER,
    p_referencia VARCHAR2,
    p_bairro_cod_bairro NUMBER
)
AS
BEGIN
    UPDATE endereco_cliente
    SET numero = p_numero,
        cep = p_cep,
        referencia = p_referencia,
        bairro_cod_bairro = p_bairro_cod_bairro
    WHERE cod_endereco = p_cod_endereco;
END;
/

CREATE OR REPLACE PROCEDURE update_estado(
    p_cod_estado NUMBER,
    p_nome_estado VARCHAR2,
    p_pais_cod_pais NUMBER
)
AS
BEGIN
    UPDATE estado
    SET nome_estado = p_nome_estado,
        pais_cod_pais = p_pais_cod_pais
    WHERE cod_estado = p_cod_estado;
END;
/

CREATE OR REPLACE PROCEDURE update_funcionario(
    p_cod_funcionario NUMBER,
    p_nome VARCHAR2,
    p_data_cadastro DATE,
    p_cargo_cod_cargo NUMBER,
    p_funcionario_cod_funcionario NUMBER
)
AS
BEGIN
    UPDATE funcionario
    SET nome = p_nome,
        data_cadastro = p_data_cadastro,
        cargo_cod_cargo = p_cargo_cod_cargo,
        funcionario_cod_funcionario = p_funcionario_cod_funcionario
    WHERE cod_funcionario = p_cod_funcionario;
END;
/

CREATE OR REPLACE PROCEDURE update_genero(
    p_cod_genero NUMBER,
    p_descricao VARCHAR2
)
AS
BEGIN
    UPDATE genero
    SET descricao = p_descricao
    WHERE cod_genero = p_cod_genero;
END;
/

CREATE OR REPLACE PROCEDURE update_item_pedido(
    p_quantidade NUMBER,
    p_valor_unitario NUMBER,
    p_valor_total NUMBER,
    p_pedido_cod_pedido NUMBER,
    p_produto_cod_produto NUMBER
)
AS
BEGIN
    UPDATE item_pedido
    SET quantidade = p_quantidade,
        valor_unitario = p_valor_unitario,
        valor_total = p_valor_total,
        produto_cod_produto = p_produto_cod_produto
    WHERE pedido_cod_pedido = p_pedido_cod_pedido;
END;
/

CREATE OR REPLACE PROCEDURE update_pais(
    p_cod_pais NUMBER,
    p_nome VARCHAR2
)
AS
BEGIN
    UPDATE pais
    SET nome = p_nome
    WHERE cod_pais = p_cod_pais;
END;
/

CREATE OR REPLACE PROCEDURE update_pedido(
    p_cod_pedido NUMBER,
    p_data DATE,
    p_cliente_fisico_cod_cli_fisico NUMBER,
    p_cliente_fisico_cliente_cod_cliente NUMBER,
    p_cliente_fisico_genero_cod_genero NUMBER,
    p_funcionario_cod_funcionario NUMBER,
    p_cliente_jurica_cod_pessoa_ju NUMBER,
    p_funcionario_cod_funcionario2 NUMBER
)
AS
BEGIN
    UPDATE pedido
    SET data = p_data,
        cliente_fisico_cod_cli_fisico = p_cliente_fisico_cod_cli_fisico,
        cliente_fisico_cliente_cod_cliente = p_cliente_fisico_cliente_cod_cliente,
        cliente_fisico_genero_cod_genero = p_cliente_fisico_genero_cod_genero,
        funcionario_cod_funcionario = p_funcionario_cod_funcionario,
        cliente_jurica_cod_pessoa_ju = p_cliente_jurica_cod_pessoa_ju,
        funcionario_cod_funcionario2 = p_funcionario_cod_funcionario2
    WHERE cod_pedido = p_cod_pedido;
END;
/

CREATE OR REPLACE PROCEDURE update_produto(
    p_cod_produto NUMBER,
    p_descricao VARCHAR2,
    p_tipo_cod_tipo NUMBER
)
AS
BEGIN
    UPDATE produto
    SET descricao = p_descricao,
        tipo_cod_tipo = p_tipo_cod_tipo
    WHERE cod_produto = p_cod_produto;
END;
/

CREATE OR REPLACE PROCEDURE update_tipo(
    p_cod_tipo NUMBER,
    p_descricao VARCHAR2
)
AS
BEGIN
    UPDATE tipo
    SET descricao = p_descricao
    WHERE cod_tipo = p_cod_tipo;
END;
