```sql
set SERVEROUTPUT on
```

```sql
--1
DECLARE
    nm_produto VARCHAR(10) := 'test';
    qnt_produto NUMBER(2) :=  3;
    preco NUMBER(10,2):= 10.50;
    final_value NUMBER(10, 5);
BEGIN
    final_value :=  qnt_produto*preco;
    dbms_output.put_line('Valor final da compra ' || final_value);
END;
```

```sql
--2
DECLARE
    v1 NUMBER(10,2):= '&valor_1';
    v2 NUMBER(10,2) :=  '&valor_2';
    final_value NUMBER(10, 5);
BEGIN
    
    IF v1 <= v2 THEN
        final_value := v2/v1;
        dbms_output.put_line('value:' || final_value);
    ELSIF v1 > v2 THEN
        final_value := v1/v2;
        dbms_output.put_line('value:' || final_value);
    ELSE
        dbms_output.put_line('Somethig is wrog');
    END IF;
END;
```

```sql
--3
DECLARE
    salario NUMBER(10,2):= '&digite_mensal_do_salario';
    bonus NUMBER(10,2) :=  '&digite_mensal_do_bonus';
    final_value NUMBER(10, 5);
BEGIN
    IF salario is null OR salario <= 0 OR bonus is null OR bonus < 0 THEN
        dbms_output.put_line('error salario or/end bonus');
    ELSE
        final_value :=  salario*12 + bonus*12;
        dbms_output.put_line('Salario:'|| salario);
        dbms_output.put_line('Bonus:'|| bonus);
        dbms_output.put_line('Salario+Bonus:'|| final_value);
    END IF;
END;
```

```sql
--4
/*criar Tabela*/
CREATE TABLE PRODUTO (
CODIGO NUMBER(4),
CATEGORIA CHAR(1),
VALOR NUMBER(4,2));

/*inserir dados na tabela*/
INSERT INTO PRODUTO VALUES (1001,'A',7.55);
INSERT INTO PRODUTO VALUES (1002,'B',5.95);
INSERT INTO PRODUTO VALUES (1003,'C',3.45);


DECLARE
    v1 NUMBER(10, 5);
    v2 NUMBER(10, 5);
    v3 NUMBER(10, 5);
BEGIN
    SELECT VALOR INTO v1 FROM PRODUTO
    WHERE CODIGO = 1001;
    SELECT VALOR INTO v2 FROM PRODUTO
    WHERE CODIGO = 1002;
    SELECT VALOR INTO v3 FROM PRODUTO
    WHERE CODIGO = 1003;
    
    UPDATE Produto 
    SET Valor = v1 + (v1*5)/100
    WHERE CODIGO = 1001;
    
    UPDATE Produto 
    SET Valor = v2 + (v2*10)/100
    WHERE CODIGO = 1002;
    
    UPDATE Produto 
    SET Valor = v3 + (v3*15)/100
    WHERE CODIGO = 1003;
END;

SELECT * FROM PRODUTO;
```






