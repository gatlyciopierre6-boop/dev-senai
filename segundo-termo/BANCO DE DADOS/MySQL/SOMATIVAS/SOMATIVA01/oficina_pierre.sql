-- Criar o banco de dados
CREATE DATABASE oficina_pierre;
USE oficina_pierre;

-- 1. Tabela Marcas (criada antes para referenciar em modelos)
CREATE TABLE marcas (
    id_marcas INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    site VARCHAR(120),
    fabricante VARCHAR(60),
    pais_origem VARCHAR(150),
    fundador VARCHAR(60),
    ano_fundacao VARCHAR(4),
    nome_marca VARCHAR(60) NOT NULL
);

-- 2. Tabela Clientes
CREATE TABLE clientes (
    id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    nome VARCHAR(120) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    endereco VARCHAR(250),
    telefone VARCHAR(20) NOT NULL
);

-- 3. Tabela Funcionarios
CREATE TABLE funcionarios (
    id_funcionario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cpf CHAR(11) UNIQUE,
    cargo VARCHAR(80) NOT NULL,
    turno VARCHAR(60),
    salario DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    data_admissao DATE NOT NULL
);

-- 4. Tabela Modelos
CREATE TABLE modelos (
    id_modelos INT UNSIGNED AUTO_INCREMENT,
    nome_modelo VARCHAR(60) NOT NULL,
    ano VARCHAR(4),
    categoria VARCHAR(60),
    motor VARCHAR(20),
    id_marca INT UNSIGNED,
    PRIMARY KEY(id_modelos, id_marca),
    FOREIGN KEY(id_marca) REFERENCES marcas(id_marcas)
);

-- 5. Tabela Veiculos
CREATE TABLE veiculos (
    id_veiculos INT UNSIGNED AUTO_INCREMENT,
    modelo VARCHAR(60),
    ano VARCHAR(4),
    marca VARCHAR(60),
    placa VARCHAR(10) NOT NULL UNIQUE,
    id_cliente INT UNSIGNED,
    quilometragem VARCHAR(20),
    PRIMARY KEY(id_veiculos, id_cliente),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente)
);

-- 6. Tabela Ordens de Serviços
CREATE TABLE ordens_servicos (
    id_ordens_servicos INT UNSIGNED AUTO_INCREMENT,
    data_entrada DATE NOT NULL,
    data_saida DATE NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pendente',
    valor_total DECIMAL(10, 2) NOT NULL,
    id_veiculo INT UNSIGNED,
    PRIMARY KEY(id_ordens_servicos, id_veiculo),
    FOREIGN KEY(id_veiculo) REFERENCES veiculos(id_veiculos)
);

-- 7. Tabela Peças
CREATE TABLE pecas (
    id_peca INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    localizacao VARCHAR(100),
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    id_veiculo INT UNSIGNED,
    categoria VARCHAR(60),
    FOREIGN KEY(id_veiculo) REFERENCES veiculos(id_veiculos)
);

-- 8. Tabela Servicos
CREATE TABLE servicos (
    id_servicos INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(60),
    status VARCHAR(20) NOT NULL DEFAULT 'pendente',
    descricao VARCHAR(150),
    duracao VARCHAR(150) NOT NULL,
    id_ordens_servicos INT UNSIGNED,
    id_veiculo INT UNSIGNED,
    FOREIGN KEY(id_ordens_servicos, id_veiculo) REFERENCES ordens_servicos(id_ordens_servicos, id_veiculo)
);

-- 9. Tabela Fornecedores
CREATE TABLE proveedores (
    id_fornecedores INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(250)
);

-- 10. Tabela Pagamento
CREATE TABLE pagamento (
    id_pagamento INT UNSIGNED AUTO_INCREMENT,
    debito VARCHAR(5),
    credito VARCHAR(5),
    pix VARCHAR(5),
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'pendente',
    id_os INT UNSIGNED,
    PRIMARY KEY(id_pagamento, id_os),
    FOREIGN KEY(id_os) REFERENCES ordens_servicos(id_ordens_servicos)
)
-- 1. ADICIONAR O CAMPO "carros" EM TODAS AS TABELAS
ALTER TABLE marcas ADD carros VARCHAR(100);
ALTER TABLE clientes ADD carros VARCHAR(100);
ALTER TABLE funcionarios ADD carros VARCHAR(100);
ALTER TABLE modelos ADD carros VARCHAR(100);
ALTER TABLE veiculos ADD carros VARCHAR(100);
ALTER TABLE ordens_servicos ADD carros VARCHAR(100);
ALTER TABLE pecas ADD carros VARCHAR(100);
ALTER TABLE servicos ADD carros VARCHAR(100);
ALTER TABLE proveedores ADD carros VARCHAR(100);
ALTER TABLE pagamento ADD carros VARCHAR(100);


-- 2. APAGAR O CAMPO "carros" DE TODAS AS TABELA
ALTER TABLE marcas DROP COLUMN carros;
ALTER TABLE clientes DROP COLUMN carros;
ALTER TABLE funcionarios DROP COLUMN carros;
ALTER TABLE modelos DROP COLUMN carros;
ALTER TABLE veiculos DROP COLUMN carros;
ALTER TABLE ordens_servicos DROP COLUMN carros;
ALTER TABLE pecas DROP COLUMN carros;
ALTER TABLE servicos DROP COLUMN carros;
ALTER TABLE proveedores DROP COLUMN carros;
ALTER TABLE pagamento DROP COLUMN carros;

-- 3. RENOMEAR A TABELA MODELOS
RENAME TABLE modelos TO modelos_fab;