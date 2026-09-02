-- SmartCoffee — esquema físico para MySQL 8.0+
-- Execute este arquivo dentro do banco de dados escolhido.

CREATE TABLE clientes (
    id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    cpf CHAR(11) UNIQUE
);

CREATE TABLE funcionarios (
    id_funcionario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf CHAR(11) UNIQUE,
    cargo VARCHAR(80) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    endereco VARCHAR(255),
    CONSTRAINT chk_funcionarios_salario CHECK (salario >= 0)
);

CREATE TABLE produtos (
    id_produto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    tipo VARCHAR(60) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    validade DATE,
    quantidade_estoque INT UNSIGNED NOT NULL DEFAULT 0,
    CONSTRAINT chk_produtos_preco CHECK (preco >= 0)
);

CREATE TABLE pedidos (
    id_pedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT UNSIGNED NOT NULL,
    id_funcionario INT UNSIGNED,
    data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    endereco_entrega VARCHAR(255),
    status VARCHAR(30) NOT NULL DEFAULT 'aberto',
    CONSTRAINT fk_pedidos_cliente
        FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    CONSTRAINT fk_pedidos_funcionario
        FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario)
);

CREATE TABLE itens_pedido (
    id_pedido INT UNSIGNED NOT NULL,
    id_produto INT UNSIGNED NOT NULL,
    quantidade INT UNSIGNED NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    CONSTRAINT chk_itens_pedido_quantidade CHECK (quantidade > 0),
    CONSTRAINT chk_itens_pedido_preco CHECK (preco_unitario >= 0),
    CONSTRAINT fk_itens_pedido_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido),
    CONSTRAINT fk_itens_pedido_produto
        FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

CREATE TABLE pagamentos (
    id_pagamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT UNSIGNED NOT NULL UNIQUE,
    metodo_pagamento ENUM('cartao_credito', 'cartao_debito', 'pix', 'dinheiro') NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_pagamentos_valor CHECK (valor >= 0),
    CONSTRAINT fk_pagamentos_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido)
);

CREATE TABLE estoque (
    id_estoque INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_produto INT UNSIGNED NOT NULL UNIQUE,
    organizacao VARCHAR(120),
    localizacao_produto VARCHAR(120),
    data_recebimento DATE,
    quantidade INT UNSIGNED NOT NULL DEFAULT 0,
    CONSTRAINT fk_estoque_produto
        FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

CREATE TABLE entregas (
    id_entrega INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT UNSIGNED NOT NULL UNIQUE,
    endereco VARCHAR(255) NOT NULL,
    entregador VARCHAR(120),
    status VARCHAR(30) NOT NULL DEFAULT 'pendente',
    CONSTRAINT fk_entregas_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido)
);

CREATE TABLE programa_fidelidade (
    id_fidelidade INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT UNSIGNED NOT NULL UNIQUE,
    data_registro DATE NOT NULL,
    pontos INT UNSIGNED NOT NULL DEFAULT 0,
    CONSTRAINT fk_programa_fidelidade_cliente
        FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);
