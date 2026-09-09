CREATE DATABASE IF NOT EXISTS CASTELLO_RELACIONAMENTO_PIERRE;

USE CASTELLO_RELACIONAMENTO_PIERRE;

CREATE TABLE CLIENTES (
    ID_CLIENTE INT AUTO_INCREMENT PRIMARY KEY,
    NOME_CLIENTE VARCHAR(100) NOT NULL
);

CREATE TABLE PEDIDOS (
    ID_PEDIDO INT AUTO_INCREMENT PRIMARY KEY,
    ID_CLIENTE INT NOT NULL,
    DATA_PEDIDO DATE NOT NULL,
    VALOR_TOTAL DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE)
);

CREATE TABLE ESTOQUE (
    ID_ESTOQUE INT AUTO_INCREMENT PRIMARY KEY,
    ID_PRODUTO INT NOT NULL UNIQUE,
    QUANTIDADE INT NOT NULL ,
    FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTOS(ID_PRODUTO)
);

CREATE TABLE PRODUTOS (
    ID_PRODUTO INT AUTO_INCREMENT PRIMARY KEY,
    NOME_PRODUTOS VARCHAR(100) NOT NULL,
    PRECO DECIMAL(10, 2) NOT NULL
); 

SELECT * FROM ESTOQUE;
SELECT * FROM PRODUTOS;
INSERT INTO PRODUTOS (NOME_PRODUTOS, PRECO) VALUES
('PRODUTO A', 10.00),
('PRODUTO B', 20.00),
('PRODUTO C', 30.00);

-- DESAFIO CARDINALIDAES
-- QUESTAO 1
-- 1. Uma categoria pode possuir vários produtos. Cada produto pertence a apenas uma categoria.
-- 1,1------1,N

-- QUESTAO 2 
-- Um funcionário pode registrar vários pedidos. Cada pedido é registrado por um funcionário.
 -- 1,1-----1,N

-- QUESTAO 3
-- 3. Um fornecedor comercializa vários produtos, e o mesmo produto pode ser comprado de vários fornecedores.
-- 1,N-------1,N


-- QUESTAO 4
-- 4. Uma mesa pode existir sem nenhuma reserva futura. Uma reserva deve estar Vinculada a uma mesa.
-- 1,1----0,N


-- QUESTAO 5 
-- Um pedido possui vários itens. Um item de pedido pertence a um único pedido.
-- 1,1-----1,N