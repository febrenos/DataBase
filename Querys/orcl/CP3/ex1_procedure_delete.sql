-- Procedure para excluir registros da tabela Bairro
CREATE OR REPLACE PROCEDURE delete_bairro(p_cod_bairro NUMBER)
AS
BEGIN
    DELETE FROM bairro WHERE cod_bairro = p_cod_bairro;
END;
/
-- Procedure para excluir registros da tabela Cargo
CREATE OR REPLACE PROCEDURE delete_cargo(p_cod_cargo NUMBER)
AS
BEGIN
    DELETE FROM cargo WHERE cod_cargo = p_cod_cargo;
END;
/
-- Procedure para excluir registros da tabela Cidade
CREATE OR REPLACE PROCEDURE delete_cidade(p_cod_cidade NUMBER)
AS
BEGIN
    DELETE FROM cidade WHERE cod_cidade = p_cod_cidade;
END;
/
-- Procedure para excluir registros da tabela Cliente
CREATE OR REPLACE PROCEDURE delete_cliente(p_cod_cliente NUMBER)
AS
BEGIN
    DELETE FROM cliente WHERE cod_cliente = p_cod_cliente;
END;
/
-- Procedure para excluir registros da tabela Cliente_Fisico
CREATE OR REPLACE PROCEDURE delete_cliente_fisico(p_cod_cli_fisico NUMBER,
                                                 p_cliente_cod_cliente NUMBER,
                                                 p_genero_cod_genero NUMBER)
AS
BEGIN
    DELETE FROM cliente_fisico
    WHERE cod_cli_fisico = p_cod_cli_fisico
      AND cliente_cod_cliente = p_cliente_cod_cliente
      AND genero_cod_genero = p_genero_cod_genero;
END;
/
-- Procedure para excluir registros da tabela Cliente_Jurica
CREATE OR REPLACE PROCEDURE delete_cliente_jurica(p_cod_pessoa_ju NUMBER)
AS
BEGIN
    DELETE FROM cliente_jurica WHERE cod_pessoa_ju = p_cod_pessoa_ju;
END;
/
-- Procedure para excluir registros da tabela Endereco_Cliente
CREATE OR REPLACE PROCEDURE delete_endereco_cliente(p_cod_endereco NUMBER)
AS
BEGIN
    DELETE FROM endereco_cliente WHERE cod_endereco = p_cod_endereco;
END;
/
-- Procedure para excluir registros da tabela Estado
CREATE OR REPLACE PROCEDURE delete_estado(p_cod_estado NUMBER)
AS
BEGIN
    DELETE FROM estado WHERE cod_estado = p_cod_estado;
END;
/
-- Procedure para excluir registros da tabela Funcionario
CREATE OR REPLACE PROCEDURE delete_funcionario(p_cod_funcionario NUMBER)
AS
BEGIN
    DELETE FROM funcionario WHERE cod_funcionario = p_cod_funcionario;
END;
/
-- Procedure para excluir registros da tabela Genero
CREATE OR REPLACE PROCEDURE delete_genero(p_cod_genero NUMBER)
AS
BEGIN
    DELETE FROM genero WHERE cod_genero = p_cod_genero;
END;
/
-- Procedure para excluir registros da tabela Item_Pedido
CREATE OR REPLACE PROCEDURE delete_item_pedido(p_pedido_cod_pedido NUMBER,
                                               p_produto_cod_produto NUMBER)
AS
BEGIN
    DELETE FROM item_pedido
    WHERE pedido_cod_pedido = p_pedido_cod_pedido
      AND produto_cod_produto = p_produto_cod_produto;
END;
/
-- Procedure para excluir registros da tabela Pais
CREATE OR REPLACE PROCEDURE delete_pais(p_cod_pais NUMBER)
AS
BEGIN
    DELETE FROM pais WHERE cod_pais = p_cod_pais;
END;
/
-- Procedure para excluir registros da tabela Pedido
CREATE OR REPLACE PROCEDURE delete_pedido(p_cod_pedido NUMBER)
AS
BEGIN
    DELETE FROM pedido WHERE cod_pedido = p_cod_pedido;
END;
/
-- Procedure para excluir registros da tabela Produto
CREATE OR REPLACE PROCEDURE delete_produto(p_cod_produto NUMBER)
AS
BEGIN
    DELETE FROM produto WHERE cod_produto = p_cod_produto;
END;
/
-- Procedure para excluir registros da tabela Tipo
CREATE OR REPLACE PROCEDURE delete_tipo(p_cod_tipo NUMBER)
AS
BEGIN
    DELETE FROM tipo WHERE cod_tipo = p_cod_tipo;
END;
/