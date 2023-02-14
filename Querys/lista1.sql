/*1*/
SET SERVEROUT ON

DECLARE
    saldoAtual number(10,2) := 1302.00;
    saldoReajente number(10,2);
BEGIN
    saldoReajente := saldoAtual * 1.25;
    DBMS_OUTPUT.PUT_LINE('salario atual - R$: '||saldoAtual);
    DBMS_OUTPUT.PUT_LINE('salario atual - R$: '||saldoReajente);
END;

SET SERVEROUT ON

/*2*/
DECLARE
    valorReal number(10,2) := 45.00;
    valorDolar number(10,2);
    valorCambio number(10,2) := 2.98;
    valorDolarParaReal number(10,2) := 5.16;
BEGIN
    valorDolar := valorReal / valorDolarParaReal + valorCambio;
    DBMS_OUTPUT.PUT_LINE('R$: '||valorReal);
    DBMS_OUTPUT.PUT_LINE('$: '||valorDolar);
END;

/*3*/
DECLARE 
    valorSalario number(10,2) := 1000.00;
    ValorSalarioAtualizado number(10,2);
    percentual number(10,2) := 0.25;
BEGIN
    ValorSalarioAtualizado := valorSalario * percentual;
    DBMS_OUTPUT.PUT_LINE('valorSalario: '||valorSalario);
    DBMS_OUTPUT.PUT_LINE('percentual: '||ValorSalarioAtualizado);
END;

/*4*/
DECLARE
    valorDolar number(10,2);
    valorReal number(10,2) := 10;
    valorCambio number(10,2) := 2.98;
    valorDolarParaReal number(10,2) := 5.16;
BEGIN
    valorReal := (valorReal * valorDolarParaReal) + valorCambio;
    DBMS_OUTPUT.PUT_LINE('R$: '||valorReal);
    DBMS_OUTPUT.PUT_LINE('$: '||valorDolar);
END;


/*5*/
DECLARE
    valorcompra number(10,2) := 1000.00;
    parcela number(10,2) := 10;
    juros number(10,2) := 0.3;
    valorFinal number(10,2);
BEGIN
    valorPorParcela := ( valorcompra * juros) / parcela;
    DBMS_OUTPUT.PUT_LINE('R$: '||valorPorParcela);
END;

/*6*/
DECLARE
    valorcompra number(10,2) := 1000.00;
    parcela number(10,2) := 6;
    
BEGIN
    IF NOT parcela LIKE 6 THEN
        OPEN c1;
      END IF;
    valorPorParcela := ( valorcompra * juros) / parcela;
    DBMS_OUTPUT.PUT_LINE('R$: '||valorPorParcela);
END;
