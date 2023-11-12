-- Especificação do Pacote
CREATE OR REPLACE PACKAGE PACKAGE1 AS
  PROCEDURE insert_tipo(p_cod_tipo NUMBER, p_descricao VARCHAR2);
  PROCEDURE insert_produto(p_cod_produto NUMBER, p_descricao VARCHAR2, p_tipo_cod_tipo NUMBER);
  PROCEDURE insert_cargo(p_cod_cargo NUMBER, p_nome VARCHAR2);
  PROCEDURE insert_funcionario(p_cod_funcionario NUMBER, p_nome VARCHAR2, p_data_cadastro DATE, p_cargo_cod_cargo NUMBER, p_funcionario_cod_funcionario NUMBER);
  PROCEDURE insert_pais(p_cod_pais NUMBER, p_nome VARCHAR2);
  PROCEDURE insert_estado(p_cod_estado NUMBER, p_nome VARCHAR2, p_pais_cod_pais NUMBER);
  PROCEDURE insert_cidade(p_cod_cidade NUMBER, p_nome VARCHAR2, p_estado_cod_estado NUMBER);
  PROCEDURE insert_bairro(p_cod_bairro NUMBER, p_nome VARCHAR2, p_cidade_cod_cidade NUMBER);
  PROCEDURE insert_endereco_cliente(p_cod_endereco NUMBER, p_numero NUMBER, p_cep NUMBER, p_referencia VARCHAR2, p_bairro_cod_bairro NUMBER);
  PROCEDURE insert_cliente(p_cod_cliente NUMBER, p_nome VARCHAR2, p_endereco_cliente_cod_endereco NUMBER);
  PROCEDURE insert_genero(p_cod_genero NUMBER, p_descricao VARCHAR2);
  PROCEDURE insert_cliente_fisico(p_cod_cli_fisico NUMBER, p_cpf NUMBER, p_cliente_cod_cliente NUMBER, p_genero_cod_genero NUMBER);
  PROCEDURE insert_cliente_jurica(p_cod_pessoa_ju NUMBER, p_cnpj NUMBER, p_ie NUMBER, p_cliente_cod_cliente NUMBER);
  PROCEDURE inserir_pedido(p_cod_pedido NUMBER, p_data DATE, p_cod_cliente_fisico NUMBER, p_cod_cliente NUMBER, p_cod_genero NUMBER, p_cod_funcionario NUMBER, p_cod_cliente_jurica NUMBER, p_cod_funcionario2 NUMBER);
  PROCEDURE insert_item_pedido(p_quantidade NUMBER, p_valor_unitario NUMBER, p_valor_total NUMBER, p_pedido_cod_pedido NUMBER, p_produto_cod_produto NUMBER);

  -- DELETE
  PROCEDURE delete_bairro(p_cod_bairro NUMBER);
  PROCEDURE delete_cargo(p_cod_cargo NUMBER);
  PROCEDURE delete_cidade(p_cod_cidade NUMBER);
  PROCEDURE delete_cliente(p_cod_cliente NUMBER);
  PROCEDURE delete_cliente_fisico(p_cod_cli_fisico NUMBER, p_cliente_cod_cliente NUMBER, p_genero_cod_genero NUMBER);
  PROCEDURE delete_cliente_jurica(p_cod_pessoa_ju NUMBER);
  PROCEDURE delete_endereco_cliente(p_cod_endereco NUMBER);
  PROCEDURE delete_estado(p_cod_estado NUMBER);
  PROCEDURE delete_funcionario(p_cod_funcionario NUMBER);
  PROCEDURE delete_genero(p_cod_genero NUMBER);
  PROCEDURE delete_item_pedido(p_pedido_cod_pedido NUMBER, p_produto_cod_produto NUMBER);
  PROCEDURE delete_pais(p_cod_pais NUMBER);
  PROCEDURE delete_pedido(p_cod_pedido NUMBER);
  PROCEDURE delete_produto(p_cod_produto NUMBER);
  PROCEDURE delete_tipo(p_cod_tipo NUMBER);

  -- UPDATE
  PROCEDURE update_bairro(p_cod_bairro NUMBER, p_nome VARCHAR2, p_cidade_cod_cidade NUMBER);
  PROCEDURE update_cargo(p_cod_cargo NUMBER, p_nome VARCHAR2);
  PROCEDURE update_cidade(p_cod_cidade NUMBER, p_nome VARCHAR2, p_estado_cod_estado NUMBER);
  PROCEDURE update_cliente(p_cod_cliente NUMBER, p_nome VARCHAR2, p_endereco_cliente_cod_endereco NUMBER);
  PROCEDURE update_cliente_fisico(p_cod_cli_fisico NUMBER, p_cpf NUMBER, p_cliente_cod_cliente NUMBER, p_genero_cod_genero NUMBER);
  PROCEDURE update_cliente_jurica(p_cod_pessoa_ju NUMBER, p_cnpj NUMBER, p_ie NUMBER, p_cliente_cod_cliente NUMBER);
  PROCEDURE update_endereco_cliente(p_cod_endereco NUMBER, p_numero NUMBER, p_cep NUMBER, p_referencia VARCHAR2, p_bairro_cod_bairro NUMBER);
  PROCEDURE update_estado(p_cod_estado NUMBER, p_nome_estado VARCHAR2, p_pais_cod_pais NUMBER);
  PROCEDURE update_funcionario(p_cod_funcionario NUMBER, p_nome VARCHAR2, p_data_cadastro DATE, p_cargo_cod_cargo NUMBER, p_funcionario_cod_funcionario NUMBER);
  PROCEDURE update_genero(p_cod_genero NUMBER, p_descricao VARCHAR2);
  PROCEDURE update_item_pedido(p_quantidade NUMBER, p_valor_unitario NUMBER, p_valor_total NUMBER, p_pedido_cod_pedido NUMBER, p_produto_cod_produto NUMBER);
  PROCEDURE update_pais(p_cod_pais NUMBER, p_nome VARCHAR2);
  PROCEDURE update_pedido(p_cod_pedido NUMBER, p_data DATE, p_cliente_fisico_cod_cli_fisico NUMBER, p_cliente_fisico_cliente_cod_cliente NUMBER, p_cliente_fisico_genero_cod_genero NUMBER, p_funcionario_cod_funcionario NUMBER, p_cliente_jurica_cod_pessoa_ju NUMBER, p_funcionario_cod_funcionario2 NUMBER);
  PROCEDURE update_produto(p_cod_produto NUMBER, p_descricao VARCHAR2, p_tipo_cod_tipo NUMBER);
  PROCEDURE update_tipo(p_cod_tipo NUMBER, p_descricao VARCHAR2);

  -- PRINT PEDIDOS
  PROCEDURE imprimir_pedidos;
END PACKAGE1;