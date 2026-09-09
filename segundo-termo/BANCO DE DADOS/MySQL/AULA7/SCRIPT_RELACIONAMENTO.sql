-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE clientes (
nome VARCHAR(120) NOT NULL,
id_clientes INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY
)

CREATE TABLE pedidos (
status VARCHAR(30) NOT NULL DEFAULT 'pendente',
id_pedidos INT  AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
id_clientes INT AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY(id_clientes) REFERENCES clientes (id_clientes)
)

CREATE TABLE produtos+estoque (
nome varchar(100),
id_produto INT AUTO_INCREMENT PRIMARY KEY,
id_estoque INT AUTO_INCREMENT PRIMARY KEY,
quantidade_estoque int,
PRIMARY KEY(id_produto,id_estoque)
)

CREATE TABLE fornecedores (
id_fornecedores Texto(1) PRIMARY KEY,
razao_social varchar(100)
)

CREATE TABLE produto (
id_produto Texto(1) PRIMARY KEY,
nome_produto varchar(100)
)

CREATE TABLE item_produto (
id_produto int,
id_fornecedores int,
id_item_produto int auto increment primary key PRIMARY KEY,
quantidade int
)

