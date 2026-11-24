-- Active: 1794916744905@@localhost@3308@sistema_manutencao
CREATE DATABASE sistema_manutencao;
USE sistema_manutencao;

-- =====================================
-- 1. TABELA ORDEM
-- =====================================

CREATE TABLE ordem (
    id_ordem INT AUTO_INCREMENT,
    descricao_problema VARCHAR(500) NOT NULL,
    status_ordem VARCHAR(30) NOT NULL,
    data_abertura DATE NOT NULL,
    data_fechamento DATE,
    prioridade VARCHAR(20) NOT NULL,

    CONSTRAINT pk_ordem PRIMARY KEY (id_ordem),

    CONSTRAINT chk_status_ordem CHECK (status_ordem IN ('ABERTA', 'EM ANDAMENTO', 'CONCLUIDA', 'CANCELADA' )),

    CONSTRAINT chk_prioridade CHECK (prioridade IN ('BAIXA', 'MEDIA', 'ALTA', 'URGENTE' ))
);

-- =====================================
-- 2. TABELA TECNICO
-- =====================================

CREATE TABLE tecnico (
    id_tecnico INT AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    data_contratacao DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    email VARCHAR(120) NOT NULL,

    CONSTRAINT pk_tecnico PRIMARY KEY (id_tecnico),

    CONSTRAINT uq_tecnico_email UNIQUE (email)
);

-- =====================================
-- 3. TABELA MAQUINA
-- =====================================

CREATE TABLE maquina (
    id_maquina INT AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    fabricante VARCHAR(100) NOT NULL,
    setor VARCHAR(80) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    data_aquisicao DATE NOT NULL,
    status_maquina ENUM( 'ATIVA', 'EM MANUTENCAO', 'INATIVA') NOT NULL,

    CONSTRAINT pk_maquina PRIMARY KEY (id_maquina)
);

-- =====================================
-- 4. TABELA MANUTENCAO
-- =====================================

CREATE TABLE manutencao (
    id_manutencao INT AUTO_INCREMENT,
    id_ordem INT NOT NULL,
    id_tecnico INT NOT NULL,
    tipo_manutencao VARCHAR(50) NOT NULL,
    descricao VARCHAR(500) NOT NULL,
    data_manutencao DATE NOT NULL,
    custo DECIMAL(10,2) NOT NULL,
    id_maquina INT NOT NULL,

    CONSTRAINT pk_manutencao PRIMARY KEY (id_manutencao),

    CONSTRAINT fk_manutencao_ordem FOREIGN KEY (id_ordem) REFERENCES ordem(id_ordem),

    CONSTRAINT fk_manutencao_tecnico FOREIGN KEY (id_tecnico) REFERENCES tecnico(id_tecnico),

    CONSTRAINT fk_manutencao_maquina FOREIGN KEY (id_maquina) REFERENCES maquina(id_maquina)
);

-- =====================================
-- 5. TABELA SERVICO
-- =====================================

CREATE TABLE servico (
    id_servico INT AUTO_INCREMENT,
    garantia_dias INT NOT NULL,
    nome_servico VARCHAR(120) NOT NULL,
    valor_servico DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(60) NOT NULL,
    tempo_estimado INT NOT NULL,
    descricao VARCHAR(500) NOT NULL,

    CONSTRAINT pk_servico PRIMARY KEY (id_servico)
);

-- =====================================
-- 6. TABELA MANUTENCAO_SERVICO
-- =====================================

CREATE TABLE manutencao_servico (
    id_servico INT NOT NULL,
    id_manutencao INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_manutencao_servico PRIMARY KEY (id_servico, id_manutencao),

    CONSTRAINT fk_ms_servico FOREIGN KEY (id_servico) REFERENCES servico(id_servico),

    CONSTRAINT fk_ms_manutencao FOREIGN KEY (id_manutencao) REFERENCES manutencao(id_manutencao)
);


USE sistema_manutencao;

-- =====================================
-- INSERT
-- =====================================

-- ORDEM
INSERT INTO ordem (descricao_problema, status_ordem, data_abertura, data_fechamento, prioridade) VALUES
('Ruído excessivo no eixo do torno',        'CONCLUIDA',    '2026-10-01', '2026-10-03', 'ALTA'),
('Vazamento de óleo na prensa hidráulica',  'CONCLUIDA',    '2026-10-05', '2026-10-09', 'URGENTE'),
('Falha no sensor da cabine de pintura',    'CONCLUIDA',    '2026-10-10', '2026-10-12', 'MEDIA'),
('Esteira de montagem travando',            'EM ANDAMENTO', '2026-11-03', NULL,         'ALTA'),
('Revisão trimestral da fresadora',         'ABERTA',       '2026-11-10', NULL,         'BAIXA'),
('Chamado aberto em duplicidade',           'CANCELADA',    '2026-11-12', '2026-11-12', 'BAIXA');

-- TECNICO
INSERT INTO tecnico (nome, telefone, data_contratacao, salario, especialidade, email) VALUES
('Carlos Silva',   '(19) 99111-0001', '2019-03-11', 4200.00, 'Mecânica',   'carlos.silva@empresa.com'),
('Mariana Souza',  '(19) 99111-0002', '2020-07-20', 4500.00, 'Preventiva', 'mariana.souza@empresa.com'),
('Roberto Lima',   '(19) 99111-0003', '2018-01-15', 5100.00, 'Hidráulica', 'roberto.lima@empresa.com'),
('Fernanda Costa', '(19) 99111-0004', '2021-09-06', 4800.00, 'Elétrica',   'fernanda.costa@empresa.com'),
('Paulo Mendes',   '(19) 99111-0005', '2022-02-14', 3900.00, 'Mecânica',   'paulo.mendes@empresa.com');

-- MAQUINA
INSERT INTO maquina (nome, fabricante, setor, modelo, data_aquisicao, status_maquina) VALUES
('Torno CNC 01',         'Romi',    'Usinagem',  'GL 240', '2017-05-10', 'ATIVA'),
('Prensa Hidráulica 02', 'Schuler', 'Montagem',  'PH-100', '2016-08-22', 'ATIVA'),
('Cabine de Pintura 03', 'Wagner',  'Pintura',   'CP-450', '2019-11-05', 'ATIVA'),
('Esteira Montagem 04',  'Siemens', 'Montagem',  'EM-220', '2018-03-30', 'EM MANUTENCAO'),
('Fresadora 05',         'Romi',    'Usinagem',  'D 800',  '2020-06-18', 'ATIVA'),
('Seladora 06',          'Bosch',   'Embalagem', 'SL-30',  '2015-09-12', 'INATIVA');

-- SERVICO
INSERT INTO servico (garantia_dias, nome_servico, valor_servico, categoria, tempo_estimado, descricao) VALUES
(90,  'Troca de rolamento',     350.00, 'Mecânica',   3, 'Substituição de rolamentos desgastados do eixo ou do motor'),
(30,  'Lubrificação geral',     120.00, 'Preventiva', 1, 'Lubrificação de eixos, guias e articulações da máquina'),
(60,  'Calibração de sensores', 280.00, 'Elétrica',   2, 'Ajuste e teste dos sensores de posição e temperatura'),
(90,  'Troca de correia',       220.00, 'Mecânica',   2, 'Substituição de correias de transmissão'),
(120, 'Reparo elétrico',        450.00, 'Elétrica',   4, 'Diagnóstico e reparo de falhas no circuito elétrico'),
(30,  'Troca de filtro',         90.00, 'Preventiva', 1, 'Substituição de filtros de óleo, ar ou hidráulicos'),
(90,  'Alinhamento de eixo',    380.00, 'Mecânica',   3, 'Alinhamento e balanceamento do eixo principal'),
(30,  'Revisão preventiva',     200.00, 'Preventiva', 2, 'Inspeção completa seguindo o checklist do fabricante');

-- MANUTENCAO
INSERT INTO manutencao (id_ordem, id_tecnico, tipo_manutencao, descricao, data_manutencao, custo, id_maquina) VALUES
(1, 1, 'Corretiva',  'Troca de rolamento e lubrificação do eixo do torno',  '2026-10-02', 470.00, 1),
(2, 3, 'Corretiva',  'Reparo do circuito e troca de filtros da prensa',     '2026-10-07', 630.00, 2),
(3, 4, 'Corretiva',  'Calibração dos sensores da cabine de pintura',        '2026-10-11', 280.00, 3),
(4, 3, 'Corretiva',  'Troca de correia e alinhamento do eixo da esteira',   '2026-11-04', 600.00, 4),
(1, 2, 'Preventiva', 'Revisão do torno após a troca de rolamento',          '2026-10-03', 200.00, 1),
(5, 5, 'Preventiva', 'Revisão trimestral e lubrificação da fresadora',      '2026-11-11', 320.00, 5);

-- MANUTENCAO_SERVICO
INSERT INTO manutencao_servico (id_servico, id_manutencao, quantidade, valor_unitario) VALUES
(1, 1, 1, 350.00),
(2, 1, 1, 120.00),
(5, 2, 1, 450.00),
(6, 2, 2,  90.00),
(3, 3, 1, 280.00),
(4, 4, 1, 220.00),
(7, 4, 1, 380.00),
(8, 5, 1, 200.00),
(8, 6, 1, 200.00),
(2, 6, 1, 120.00);

-- =====================================
-- UPDATE
-- =====================================

-- TECNICO: novo telefone
UPDATE tecnico
   SET telefone = '(19) 99999-0001'
 WHERE id_tecnico = 1;

-- TECNICO: reajuste de salário
UPDATE tecnico
   SET salario = salario * 1.05
 WHERE especialidade = 'Mecânica';

-- ORDEM: iniciar atendimento
UPDATE ordem
   SET status_ordem = 'EM ANDAMENTO'
 WHERE id_ordem = 5
   AND status_ordem = 'ABERTA';

-- ORDEM: concluir ordem
UPDATE ordem
   SET status_ordem = 'CONCLUIDA',
       data_fechamento = '2026-11-20'
 WHERE id_ordem = 4;

-- MAQUINA: voltar a ficar ativa
UPDATE maquina
   SET status_maquina = 'ATIVA'
 WHERE id_maquina = 4;

-- MANUTENCAO_SERVICO: alterar quantidade
UPDATE manutencao_servico
   SET quantidade = 3
 WHERE id_servico = 6
   AND id_manutencao = 2;

-- MANUTENCAO: recalcular custo
UPDATE manutencao
   SET custo = 720.00
 WHERE id_manutencao = 2;

-- SERVICO: reajuste de valor
UPDATE servico
   SET valor_servico = valor_servico * 1.10
 WHERE id_servico = 5;

-- =====================================
-- DELETE
-- =====================================

-- MANUTENCAO_SERVICO: remover um item
DELETE FROM manutencao_servico
 WHERE id_servico = 2
   AND id_manutencao = 6;

-- MANUTENCAO: ajustar custo após remover item
UPDATE manutencao
   SET custo = 200.00
 WHERE id_manutencao = 6;

-- MANUTENCAO: remover manutenção completa (itens primeiro)
DELETE FROM manutencao_servico
 WHERE id_manutencao = 5;

DELETE FROM manutencao
 WHERE id_manutencao = 5;

-- ORDEM: remover ordem cancelada
DELETE FROM ordem
 WHERE id_ordem = 6
   AND status_ordem = 'CANCELADA';

-- MAQUINA: remover máquina inativa
DELETE FROM maquina
 WHERE id_maquina = 6
   AND status_maquina = 'INATIVA';

-- DQL

-- Listar as manutenções realizadas

SELECT manutencao.descricao, tecnico.nome AS tecnico, maquina.nome AS maquina FROM manutencao
JOIN tecnico
    ON manutencao.id_tecnico = tecnico.id_tecnico
JOIN maquina
    ON manutencao.id_maquina = maquina.id_maquina;

-- Consultar ordens em aberto

SELECT * FROM ordem
WHERE status_ordem = 'ABERTA'
   OR status_ordem = 'EM ANDAMENTO';

-- Consultar custo das manutenções por máquina

SELECT maquina.nome, SUM(manutencao.custo) AS custo_total FROM manutencao
JOIN maquina
    ON manutencao.id_maquina = maquina.id_maquina
GROUP BY maquina.nome;
-- =====================================
-- TCL
-- =====================================
START TRANSACTION;

INSERT INTO manutencao (tipo_manutencao, descricao, data_manutencao, custo, id_ordem, id_tecnico, id_maquina)
VALUES ('Corretiva', 'Troca de rolamento', CURDATE(), 450.00, 1, 2, 3);

UPDATE ordem
SET status_ordem = 'concluida', data_fechamento = CURDATE()
WHERE id_ordem = 1;

SAVEPOINT update1;

UPDATE maquina
SET status_maquina = 'ativa'
WHERE id_maquina = 3;

ROLLBACK TO update1;

COMMIT;
