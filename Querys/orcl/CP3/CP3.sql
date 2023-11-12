DROP TABLE bairro CASCADE CONSTRAINTS;

DROP TABLE cargo CASCADE CONSTRAINTS;

DROP TABLE cidade CASCADE CONSTRAINTS;

DROP TABLE cliente CASCADE CONSTRAINTS;

DROP TABLE cliente_fisico CASCADE CONSTRAINTS;

DROP TABLE cliente_jurica CASCADE CONSTRAINTS;

DROP TABLE endereco_cliente CASCADE CONSTRAINTS;

DROP TABLE estado CASCADE CONSTRAINTS;

DROP TABLE funcionario CASCADE CONSTRAINTS;

DROP TABLE genero CASCADE CONSTRAINTS;

DROP TABLE item_pedido CASCADE CONSTRAINTS;

DROP TABLE pais CASCADE CONSTRAINTS;

DROP TABLE pedido CASCADE CONSTRAINTS;

DROP TABLE produto CASCADE CONSTRAINTS;

DROP TABLE tipo CASCADE CONSTRAINTS;



CREATE TABLE bairro (
    cod_bairro        NUMBER NOT NULL,
    nome              VARCHAR2(30),
    cidade_cod_cidade NUMBER NOT NULL
);

ALTER TABLE bairro ADD CONSTRAINT bairro_pk PRIMARY KEY ( cod_bairro );

CREATE TABLE cargo (
    cod_cargo NUMBER NOT NULL,
    nome      VARCHAR2(30)
);

ALTER TABLE cargo ADD CONSTRAINT cargo_pk PRIMARY KEY ( cod_cargo );

CREATE TABLE cidade (
    cod_cidade        NUMBER NOT NULL,
    nome              VARCHAR2(30),
    estado_cod_estado NUMBER NOT NULL
);

ALTER TABLE cidade ADD CONSTRAINT cidade_pk PRIMARY KEY ( cod_cidade );

CREATE TABLE cliente (
    cod_cliente                   NUMBER NOT NULL,
    nome                          VARCHAR2(50),
    endereco_cliente_cod_endereco NUMBER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cod_cliente );

CREATE TABLE cliente_fisico (
    cod_cli_fisico      NUMBER NOT NULL,
    cpf                 NUMBER,
    cliente_cod_cliente NUMBER NOT NULL,
    genero_cod_genero   NUMBER NOT NULL
);

ALTER TABLE cliente_fisico
    ADD CONSTRAINT cliente_fisico_pk PRIMARY KEY ( cod_cli_fisico,
                                                   cliente_cod_cliente,
                                                   genero_cod_genero );

CREATE TABLE cliente_jurica (
    cod_pessoa_ju       NUMBER NOT NULL,
    cnpj                NUMBER,
    ie                  NUMBER,
    cliente_cod_cliente NUMBER NOT NULL
);

ALTER TABLE cliente_jurica ADD CONSTRAINT cliente_jurica_pk PRIMARY KEY ( cod_pessoa_ju );

CREATE TABLE endereco_cliente (
    cod_endereco      NUMBER NOT NULL,
    numero            NUMBER,
    cep               NUMBER,
    referencia        VARCHAR2(200),
    bairro_cod_bairro NUMBER NOT NULL
);

ALTER TABLE endereco_cliente ADD CONSTRAINT endereco_cliente_pk PRIMARY KEY ( cod_endereco );

CREATE TABLE estado (
    cod_estado    NUMBER NOT NULL,
    nome_estado   VARCHAR2(30),
    pais_cod_pais NUMBER NOT NULL
);

ALTER TABLE estado ADD CONSTRAINT estado_pk PRIMARY KEY ( cod_estado );

CREATE TABLE funcionario (
    cod_funcionario             NUMBER NOT NULL,
    nome                        VARCHAR2(30),
    data_cadastro               DATE,
    cargo_cod_cargo             NUMBER NOT NULL,
    funcionario_cod_funcionario NUMBER
);

CREATE UNIQUE INDEX funcionario__idx ON
    funcionario (
        cargo_cod_cargo
    ASC );

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( cod_funcionario );

CREATE TABLE genero (
    cod_genero NUMBER NOT NULL,
    descricao  VARCHAR2(30)
);

ALTER TABLE genero ADD CONSTRAINT genero_pk PRIMARY KEY ( cod_genero );

CREATE TABLE item_pedido (
    quantidade          NUMBER(10),
    valor_unitario      NUMBER(10),
    valor_total         NUMBER(10),
    pedido_cod_pedido   NUMBER NOT NULL,
    produto_cod_produto NUMBER NOT NULL
);

ALTER TABLE item_pedido ADD CONSTRAINT item_pedido_pk PRIMARY KEY ( pedido_cod_pedido,
                                                                    produto_cod_produto );

CREATE TABLE pais (
    cod_pais NUMBER NOT NULL,
    nome     VARCHAR2(30)
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( cod_pais );

CREATE TABLE pedido (
    cod_pedido                         NUMBER NOT NULL,
    data                               DATE,
    cliente_fisico_cod_cli_fisico      NUMBER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    cliente_fisico_cliente_cod_cliente NUMBER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    cliente_fisico_genero_cod_genero   NUMBER NOT NULL,
    funcionario_cod_funcionario        NUMBER NOT NULL,
    cliente_jurica_cod_pessoa_ju       NUMBER NOT NULL,
    funcionario_cod_funcionario2       NUMBER NOT NULL
);

CREATE UNIQUE INDEX pedido__idx ON
    pedido (
        funcionario_cod_funcionario
    ASC );

CREATE UNIQUE INDEX pedido__idxv1 ON
    pedido (
        funcionario_cod_funcionario2
    ASC );

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( cod_pedido );

CREATE TABLE produto (
    cod_produto   NUMBER NOT NULL,
    descricao     VARCHAR2(30),
    tipo_cod_tipo NUMBER NOT NULL
);

CREATE UNIQUE INDEX produto__idx ON
    produto (
        tipo_cod_tipo
    ASC );

ALTER TABLE produto ADD CONSTRAINT produto_pk PRIMARY KEY ( cod_produto );

CREATE TABLE tipo (
    cod_tipo  NUMBER NOT NULL,
    descricao VARCHAR2(30)
);

ALTER TABLE tipo ADD CONSTRAINT tipo_pk PRIMARY KEY ( cod_tipo );

ALTER TABLE bairro
    ADD CONSTRAINT bairro_cidade_fk FOREIGN KEY ( cidade_cod_cidade )
        REFERENCES cidade ( cod_cidade );

ALTER TABLE cidade
    ADD CONSTRAINT cidade_estado_fk FOREIGN KEY ( estado_cod_estado )
        REFERENCES estado ( cod_estado );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_endereco_cliente_fk FOREIGN KEY ( endereco_cliente_cod_endereco )
        REFERENCES endereco_cliente ( cod_endereco );

ALTER TABLE cliente_fisico
    ADD CONSTRAINT cliente_fisico_cliente_fk FOREIGN KEY ( cliente_cod_cliente )
        REFERENCES cliente ( cod_cliente );

ALTER TABLE cliente_fisico
    ADD CONSTRAINT cliente_fisico_genero_fk FOREIGN KEY ( genero_cod_genero )
        REFERENCES genero ( cod_genero );

ALTER TABLE cliente_jurica
    ADD CONSTRAINT cliente_jurica_cliente_fk FOREIGN KEY ( cliente_cod_cliente )
        REFERENCES cliente ( cod_cliente );

ALTER TABLE endereco_cliente
    ADD CONSTRAINT endereco_cliente_bairro_fk FOREIGN KEY ( bairro_cod_bairro )
        REFERENCES bairro ( cod_bairro );

ALTER TABLE estado
    ADD CONSTRAINT estado_pais_fk FOREIGN KEY ( pais_cod_pais )
        REFERENCES pais ( cod_pais );

ALTER TABLE funcionario
    ADD CONSTRAINT funcionario_cargo_fk FOREIGN KEY ( cargo_cod_cargo )
        REFERENCES cargo ( cod_cargo );

ALTER TABLE funcionario
    ADD CONSTRAINT funcionario_funcionario_fk FOREIGN KEY ( funcionario_cod_funcionario )
        REFERENCES funcionario ( cod_funcionario );

ALTER TABLE item_pedido
    ADD CONSTRAINT item_pedido_pedido_fk FOREIGN KEY ( pedido_cod_pedido )
        REFERENCES pedido ( cod_pedido );

ALTER TABLE item_pedido
    ADD CONSTRAINT item_pedido_produto_fk FOREIGN KEY ( produto_cod_produto )
        REFERENCES produto ( cod_produto );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_cliente_fisico_fk FOREIGN KEY ( cliente_fisico_cod_cli_fisico,
                                                          cliente_fisico_cliente_cod_cliente,
                                                          cliente_fisico_genero_cod_genero )
        REFERENCES cliente_fisico ( cod_cli_fisico,
                                    cliente_cod_cliente,
                                    genero_cod_genero );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_cliente_jurica_fkv1 FOREIGN KEY ( cliente_jurica_cod_pessoa_ju )
        REFERENCES cliente_jurica ( cod_pessoa_ju );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_funcionario_fk FOREIGN KEY ( funcionario_cod_funcionario )
        REFERENCES funcionario ( cod_funcionario );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_funcionario_fkv2 FOREIGN KEY ( funcionario_cod_funcionario2 )
        REFERENCES funcionario ( cod_funcionario );

ALTER TABLE produto
    ADD CONSTRAINT produto_tipo_fk FOREIGN KEY ( tipo_cod_tipo )
        REFERENCES tipo ( cod_tipo );


