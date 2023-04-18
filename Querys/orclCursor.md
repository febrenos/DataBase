```sql
SELECT * FROM TABELAS_VENDAS;

CREATE TABLE TABELA_VENDAS_VAZIA AS SELECT * FROM TABELAS_VENDAS WHERE 1=2;

SELECT * FROM TABELA_VENDAS_VAZIA;

INSERT INTO tabela_vendas_vazia (
    ordernumber,
    quantityordered,
    priceeach,
    orderlinenumber,
    sales,
    orderdate,
    status,
    qtr_id,
    month_id,
    year_id,
    productline,
    msrp,
    productcode,
    customername,
    phone,
    addressline1,
    addressline2,
    city,
    state,
    postalcode,
    country,
    territory,
    contactlastname,
    contactfirstname,
    dealsize
) VALUES (
    :v0,
    :v1,
    :v2,
    :v3,
    :v4,
    :v5,
    :v6,
    :v7,
    :v8,
    :v9,
    :v10,
    :v11,
    :v12,
    :v13,
    :v14,
    :v15,
    :v16,
    :v17,
    :v18,
    :v19,
    :v20,
    :v21,
    :v22,
    :v23,
    :v24
);
Declare
  v_codigo TABELAS_VENDAS.ORDERNUMBER%type := 10258;
  cursor cur_emp is
    select * from TABELAS_VENDAS where ORDERNUMBER = 10258;
Begin
  for x in cur_emp loop
    Insert into TABELA_VENDAS_VAZIA(ordernumber,
    quantityordered,
    priceeach) values (x.ordernumber,
    x.quantityordered,
    x.priceeach
    );
    COMMIT;
  End loop;
End;
```
