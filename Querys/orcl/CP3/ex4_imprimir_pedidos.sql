CREATE OR REPLACE PROCEDURE imprimir_pedidos AS
  -- Declaração de variáveis
  v_pedido_id_1 NUMBER;
  v_pedido_id_2 NUMBER;

  -- Cursor para buscar detalhes do pedido
  CURSOR pedido_cursor IS
    SELECT
      p.cod_pedido,
      p.data,
      c1.nome AS nome_cliente,
      c2.nome AS nome_funcionario,
      pr.descricao AS produto,
      ip.quantidade,
      ip.valor_unitario,
      ip.valor_total
    FROM
      pedido p
      JOIN cliente_fisico cf ON p.cliente_fisico_cod_cli_fisico = cf.cod_cli_fisico
      JOIN cliente c1 ON cf.cliente_cod_cliente = c1.cod_cliente
      JOIN funcionario f ON p.funcionario_cod_funcionario = f.cod_funcionario
      JOIN cliente_jurica cj ON p.cliente_jurica_cod_pessoa_ju = cj.cod_pessoa_ju
      JOIN cliente c2 ON cj.cliente_cod_cliente = c2.cod_cliente
      JOIN item_pedido ip ON p.cod_pedido = ip.pedido_cod_pedido
      JOIN produto pr ON ip.produto_cod_produto = pr.cod_produto
    WHERE
      ROWNUM <= 11; -- Limita dois primeiros

  -- Função para calcular o total do pedido
  FUNCTION calcular_total_pedido(pedido_id NUMBER) RETURN NUMBER IS
    v_total NUMBER;
  BEGIN
    SELECT SUM(valor_total)
    INTO v_total
    FROM item_pedido
    WHERE pedido_cod_pedido = pedido_id;

    RETURN v_total;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 0;
  END calcular_total_pedido;

BEGIN
  -- Loop para imprimir detalhes dos pedidos
  FOR pedido_rec IN pedido_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Pedido: ' || pedido_rec.cod_pedido);
    DBMS_OUTPUT.PUT_LINE('Data: ' || pedido_rec.data);
    DBMS_OUTPUT.PUT_LINE('Cliente: ' || pedido_rec.nome_cliente);
    DBMS_OUTPUT.PUT_LINE('Funcionário: ' || pedido_rec.nome_funcionario);
    DBMS_OUTPUT.PUT_LINE('Produto: ' || pedido_rec.produto);
    DBMS_OUTPUT.PUT_LINE('Quantidade: ' || pedido_rec.quantidade);
    DBMS_OUTPUT.PUT_LINE('Valor Unitário: ' || pedido_rec.valor_unitario);
    DBMS_OUTPUT.PUT_LINE('Valor Total: ' || pedido_rec.valor_total);
    DBMS_OUTPUT.PUT_LINE('Total do Pedido: ' || calcular_total_pedido(pedido_rec.cod_pedido));
    DBMS_OUTPUT.PUT_LINE('---------------------------------');
  END LOOP;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END imprimir_pedidos;
/

EXEC imprimir_pedidos;
