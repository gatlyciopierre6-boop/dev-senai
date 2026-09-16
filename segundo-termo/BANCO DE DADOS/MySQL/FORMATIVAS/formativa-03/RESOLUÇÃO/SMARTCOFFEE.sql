-- =========================================================
-- BANCO DE DADOS SMARTCOFFEE
-- =========================================================

CREATE DATABASE IF NOT EXISTS smartcoffee_pierre

USE smartcoffee_pierre;


-- =========================================================
-- 1. FUNCIONARIO
-- =========================================================

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_contratacao DATE,
    salario DECIMAL(10,2),
    cargo VARCHAR(50)
);


-- =========================================================
-- 2. CLIENTE
-- =========================================================

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_cadastro DATETIME,
    descricao VARCHAR(255)
);


-- =========================================================
-- 3. FIDELIDADE
-- =========================================================

CREATE TABLE fidelidade (
    id_fidelidade INT AUTO_INCREMENT PRIMARY KEY,
    pontos_acumulados INT DEFAULT 0,
    saldo_pontos INT DEFAULT 0,
    nome_programa VARCHAR(100),
    nivel VARCHAR(30),
    data_ultima_atualizacao DATETIME,
    id_cliente INT NOT NULL UNIQUE,
    CONSTRAINT fk_fidelidade_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);


-- =========================================================
-- 4. PEDIDO
-- =========================================================

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    observacao VARCHAR(255),
    tipo_pedido VARCHAR(20) NOT NULL,
    status_pedido VARCHAR(30) NOT NULL,
    data_pedido DATETIME NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    id_funcionario INT,
    id_cliente INT NOT NULL,

    CONSTRAINT fk_pedido_funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id_funcionario),

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),

    CONSTRAINT chk_tipo_pedido
        CHECK (tipo_pedido IN ('presencial', 'delivery')),

    CONSTRAINT chk_valor_pedido
        CHECK (valor_total >= 0)
);


-- =========================================================
-- 5. PAGAMENTO
-- =========================================================

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    forma_pagamento VARCHAR(30) NOT NULL,
    codigo_transacao VARCHAR(100),
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    status_pagamento VARCHAR(30) NOT NULL,
    id_pedido INT NOT NULL UNIQUE,

    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),

    CONSTRAINT chk_valor_pagamento
        CHECK (valor >= 0)
);


-- =========================================================
-- 6. DELIVERY
-- =========================================================

CREATE TABLE delivery (
    id_delivery INT AUTO_INCREMENT,
    numero VARCHAR(10),
    cidade VARCHAR(100) NOT NULL,
    endereco_entrega VARCHAR(255) NOT NULL,
    taxa_entrega DECIMAL(10,2) DEFAULT 0,
    status_entrega VARCHAR(30) NOT NULL,
    bairro VARCHAR(100),

    id_pedido INT NOT NULL,

    PRIMARY KEY (id_delivery),

    UNIQUE (id_pedido),

    CONSTRAINT fk_delivery_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),

    CONSTRAINT chk_taxa_entrega
        CHECK (taxa_entrega >= 0)
);


-- =========================================================
-- 7. PRODUTO
-- =========================================================

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    quantidade_estoque INT DEFAULT 0,
    status VARCHAR(30) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    descricao VARCHAR(255),
    categoria VARCHAR(50),

    PRIMARY KEY (id_produto),

    CONSTRAINT chk_quantidade_estoque
        CHECK (quantidade_estoque >= 0),

    CONSTRAINT chk_preco_produto
        CHECK (preco_unitario >= 0)
);


-- =========================================================
-- 8. ITEM_PEDIDO
-- =========================================================

CREATE TABLE item_pedido (
    id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,

    CONSTRAINT fk_item_pedido_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),

    CONSTRAINT fk_item_pedido_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto),

    CONSTRAINT chk_quantidade_item
        CHECK (quantidade > 0),

    CONSTRAINT chk_preco_item
        CHECK (preco_unitario >= 0),

    CONSTRAINT chk_subtotal_item
        CHECK (subtotal >= 0),

    UNIQUE (id_pedido, id_produto)
);


-- =========================================================
-- 9. ESTOQUE_INS​UMOS
-- =========================================================

CREATE TABLE estoque_insumos (
    id_estoque_insumos INT AUTO_INCREMENT PRIMARY KEY,
    nome_insumo VARCHAR(100) NOT NULL,
    unidade_medida VARCHAR(10) NOT NULL,
    quantidade_minima DECIMAL(10,2) NOT NULL,
    data_atualizacao DATETIME,
    quantidade_atual DECIMAL(10,2) NOT NULL,
    localizacao VARCHAR(100),
    id_produto INT NOT NULL,


    CONSTRAINT fk_estoque_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto),

    CONSTRAINT chk_unidade_medida
        CHECK (unidade_medida IN ('kg', 'ml', 'un')),

    CONSTRAINT chk_quantidade_minima
        CHECK (quantidade_minima >= 0),

    CONSTRAINT chk_quantidade_atual
        CHECK (quantidade_atual >= 0)
);