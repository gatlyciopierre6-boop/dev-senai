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
('Chamado aberto em duplicidade',           'CANCELADA',    '2026-11-12', '2026-11-12', 'BAIXA'),
('Inspecao preventiva do equipamento 007', 'CANCELADA', '2026-07-07', '2026-07-07', 'URGENTE'),
('Inspecao preventiva do equipamento 008', 'ABERTA', '2026-08-08', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 009', 'EM ANDAMENTO', '2026-09-09', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 010', 'CONCLUIDA', '2026-10-10', '2026-10-10', 'ALTA'),
('Inspecao preventiva do equipamento 011', 'CANCELADA', '2026-11-11', '2026-11-11', 'URGENTE'),
('Inspecao preventiva do equipamento 012', 'ABERTA', '2026-12-12', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 013', 'EM ANDAMENTO', '2026-01-13', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 014', 'CONCLUIDA', '2026-02-14', '2026-02-14', 'ALTA'),
('Inspecao preventiva do equipamento 015', 'CANCELADA', '2026-03-15', '2026-03-15', 'URGENTE'),
('Inspecao preventiva do equipamento 016', 'ABERTA', '2026-04-16', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 017', 'EM ANDAMENTO', '2026-05-17', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 018', 'CONCLUIDA', '2026-06-18', '2026-06-18', 'ALTA'),
('Inspecao preventiva do equipamento 019', 'CANCELADA', '2026-07-19', '2026-07-19', 'URGENTE'),
('Inspecao preventiva do equipamento 020', 'ABERTA', '2026-08-20', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 021', 'EM ANDAMENTO', '2026-09-21', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 022', 'CONCLUIDA', '2026-10-22', '2026-10-22', 'ALTA'),
('Inspecao preventiva do equipamento 023', 'CANCELADA', '2026-11-23', '2026-11-23', 'URGENTE'),
('Inspecao preventiva do equipamento 024', 'ABERTA', '2026-12-24', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 025', 'EM ANDAMENTO', '2026-01-25', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 026', 'CONCLUIDA', '2026-02-26', '2026-02-26', 'ALTA'),
('Inspecao preventiva do equipamento 027', 'CANCELADA', '2026-03-27', '2026-03-27', 'URGENTE'),
('Inspecao preventiva do equipamento 028', 'ABERTA', '2026-04-01', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 029', 'EM ANDAMENTO', '2026-05-02', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 030', 'CONCLUIDA', '2026-06-03', '2026-06-03', 'ALTA'),
('Inspecao preventiva do equipamento 031', 'CANCELADA', '2026-07-04', '2026-07-04', 'URGENTE'),
('Inspecao preventiva do equipamento 032', 'ABERTA', '2026-08-05', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 033', 'EM ANDAMENTO', '2026-09-06', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 034', 'CONCLUIDA', '2026-10-07', '2026-10-07', 'ALTA'),
('Inspecao preventiva do equipamento 035', 'CANCELADA', '2026-11-08', '2026-11-08', 'URGENTE'),
('Inspecao preventiva do equipamento 036', 'ABERTA', '2026-12-09', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 037', 'EM ANDAMENTO', '2026-01-10', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 038', 'CONCLUIDA', '2026-02-11', '2026-02-11', 'ALTA'),
('Inspecao preventiva do equipamento 039', 'CANCELADA', '2026-03-12', '2026-03-12', 'URGENTE'),
('Inspecao preventiva do equipamento 040', 'ABERTA', '2026-04-13', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 041', 'EM ANDAMENTO', '2026-05-14', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 042', 'CONCLUIDA', '2026-06-15', '2026-06-15', 'ALTA'),
('Inspecao preventiva do equipamento 043', 'CANCELADA', '2026-07-16', '2026-07-16', 'URGENTE'),
('Inspecao preventiva do equipamento 044', 'ABERTA', '2026-08-17', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 045', 'EM ANDAMENTO', '2026-09-18', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 046', 'CONCLUIDA', '2026-10-19', '2026-10-19', 'ALTA'),
('Inspecao preventiva do equipamento 047', 'CANCELADA', '2026-11-20', '2026-11-20', 'URGENTE'),
('Inspecao preventiva do equipamento 048', 'ABERTA', '2026-12-21', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 049', 'EM ANDAMENTO', '2026-01-22', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 050', 'CONCLUIDA', '2026-02-23', '2026-02-23', 'ALTA'),
('Inspecao preventiva do equipamento 051', 'CANCELADA', '2026-03-24', '2026-03-24', 'URGENTE'),
('Inspecao preventiva do equipamento 052', 'ABERTA', '2026-04-25', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 053', 'EM ANDAMENTO', '2026-05-26', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 054', 'CONCLUIDA', '2026-06-27', '2026-06-27', 'ALTA'),
('Inspecao preventiva do equipamento 055', 'CANCELADA', '2026-07-01', '2026-07-01', 'URGENTE'),
('Inspecao preventiva do equipamento 056', 'ABERTA', '2026-08-02', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 057', 'EM ANDAMENTO', '2026-09-03', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 058', 'CONCLUIDA', '2026-10-04', '2026-10-04', 'ALTA'),
('Inspecao preventiva do equipamento 059', 'CANCELADA', '2026-11-05', '2026-11-05', 'URGENTE'),
('Inspecao preventiva do equipamento 060', 'ABERTA', '2026-12-06', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 061', 'EM ANDAMENTO', '2026-01-07', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 062', 'CONCLUIDA', '2026-02-08', '2026-02-08', 'ALTA'),
('Inspecao preventiva do equipamento 063', 'CANCELADA', '2026-03-09', '2026-03-09', 'URGENTE'),
('Inspecao preventiva do equipamento 064', 'ABERTA', '2026-04-10', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 065', 'EM ANDAMENTO', '2026-05-11', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 066', 'CONCLUIDA', '2026-06-12', '2026-06-12', 'ALTA'),
('Inspecao preventiva do equipamento 067', 'CANCELADA', '2026-07-13', '2026-07-13', 'URGENTE'),
('Inspecao preventiva do equipamento 068', 'ABERTA', '2026-08-14', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 069', 'EM ANDAMENTO', '2026-09-15', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 070', 'CONCLUIDA', '2026-10-16', '2026-10-16', 'ALTA'),
('Inspecao preventiva do equipamento 071', 'CANCELADA', '2026-11-17', '2026-11-17', 'URGENTE'),
('Inspecao preventiva do equipamento 072', 'ABERTA', '2026-12-18', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 073', 'EM ANDAMENTO', '2026-01-19', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 074', 'CONCLUIDA', '2026-02-20', '2026-02-20', 'ALTA'),
('Inspecao preventiva do equipamento 075', 'CANCELADA', '2026-03-21', '2026-03-21', 'URGENTE'),
('Inspecao preventiva do equipamento 076', 'ABERTA', '2026-04-22', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 077', 'EM ANDAMENTO', '2026-05-23', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 078', 'CONCLUIDA', '2026-06-24', '2026-06-24', 'ALTA'),
('Inspecao preventiva do equipamento 079', 'CANCELADA', '2026-07-25', '2026-07-25', 'URGENTE'),
('Inspecao preventiva do equipamento 080', 'ABERTA', '2026-08-26', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 081', 'EM ANDAMENTO', '2026-09-27', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 082', 'CONCLUIDA', '2026-10-01', '2026-10-01', 'ALTA'),
('Inspecao preventiva do equipamento 083', 'CANCELADA', '2026-11-02', '2026-11-02', 'URGENTE'),
('Inspecao preventiva do equipamento 084', 'ABERTA', '2026-12-03', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 085', 'EM ANDAMENTO', '2026-01-04', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 086', 'CONCLUIDA', '2026-02-05', '2026-02-05', 'ALTA'),
('Inspecao preventiva do equipamento 087', 'CANCELADA', '2026-03-06', '2026-03-06', 'URGENTE'),
('Inspecao preventiva do equipamento 088', 'ABERTA', '2026-04-07', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 089', 'EM ANDAMENTO', '2026-05-08', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 090', 'CONCLUIDA', '2026-06-09', '2026-06-09', 'ALTA'),
('Inspecao preventiva do equipamento 091', 'CANCELADA', '2026-07-10', '2026-07-10', 'URGENTE'),
('Inspecao preventiva do equipamento 092', 'ABERTA', '2026-08-11', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 093', 'EM ANDAMENTO', '2026-09-12', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 094', 'CONCLUIDA', '2026-10-13', '2026-10-13', 'ALTA'),
('Inspecao preventiva do equipamento 095', 'CANCELADA', '2026-11-14', '2026-11-14', 'URGENTE'),
('Inspecao preventiva do equipamento 096', 'ABERTA', '2026-12-15', NULL, 'BAIXA'),
('Inspecao preventiva do equipamento 097', 'EM ANDAMENTO', '2026-01-16', NULL, 'MEDIA'),
('Inspecao preventiva do equipamento 098', 'CONCLUIDA', '2026-02-17', '2026-02-17', 'ALTA'),
('Inspecao preventiva do equipamento 099', 'CANCELADA', '2026-03-18', '2026-03-18', 'URGENTE'),
('Inspecao preventiva do equipamento 100', 'ABERTA', '2026-04-19', NULL, 'BAIXA');

-- TECNICO
INSERT INTO tecnico (nome, telefone, data_contratacao, salario, especialidade, email) VALUES
('Carlos Silva',   '(19) 99111-0001', '2019-03-11', 4200.00, 'Mecânica',   'carlos.silva@empresa.com'),
('Mariana Souza',  '(19) 99111-0002', '2020-07-20', 4500.00, 'Preventiva', 'mariana.souza@empresa.com'),
('Roberto Lima',   '(19) 99111-0003', '2018-01-15', 5100.00, 'Hidráulica', 'roberto.lima@empresa.com'),
('Fernanda Costa', '(19) 99111-0004', '2021-09-06', 4800.00, 'Elétrica',   'fernanda.costa@empresa.com'),
('Paulo Mendes',   '(19) 99111-0005', '2022-02-14', 3900.00, 'Mecânica',   'paulo.mendes@empresa.com'),
('Tecnico 006', '(19) 99000-0006', '2020-06-06', 3722.00, 'Hidraulica', 'tecnico006@empresa.com'),
('Tecnico 007', '(19) 99000-0007', '2021-07-07', 3759.00, 'Eletrica', 'tecnico007@empresa.com'),
('Tecnico 008', '(19) 99000-0008', '2022-08-08', 3796.00, 'Mecanica', 'tecnico008@empresa.com'),
('Tecnico 009', '(19) 99000-0009', '2023-09-09', 3833.00, 'Preventiva', 'tecnico009@empresa.com'),
('Tecnico 010', '(19) 99000-0010', '2024-10-10', 3870.00, 'Hidraulica', 'tecnico010@empresa.com'),
('Tecnico 011', '(19) 99000-0011', '2025-11-11', 3907.00, 'Eletrica', 'tecnico011@empresa.com'),
('Tecnico 012', '(19) 99000-0012', '2020-12-12', 3944.00, 'Mecanica', 'tecnico012@empresa.com'),
('Tecnico 013', '(19) 99000-0013', '2021-01-13', 3981.00, 'Preventiva', 'tecnico013@empresa.com'),
('Tecnico 014', '(19) 99000-0014', '2022-02-14', 4018.00, 'Hidraulica', 'tecnico014@empresa.com'),
('Tecnico 015', '(19) 99000-0015', '2023-03-15', 4055.00, 'Eletrica', 'tecnico015@empresa.com'),
('Tecnico 016', '(19) 99000-0016', '2024-04-16', 4092.00, 'Mecanica', 'tecnico016@empresa.com'),
('Tecnico 017', '(19) 99000-0017', '2025-05-17', 4129.00, 'Preventiva', 'tecnico017@empresa.com'),
('Tecnico 018', '(19) 99000-0018', '2020-06-18', 4166.00, 'Hidraulica', 'tecnico018@empresa.com'),
('Tecnico 019', '(19) 99000-0019', '2021-07-19', 4203.00, 'Eletrica', 'tecnico019@empresa.com'),
('Tecnico 020', '(19) 99000-0020', '2022-08-20', 4240.00, 'Mecanica', 'tecnico020@empresa.com'),
('Tecnico 021', '(19) 99000-0021', '2023-09-21', 4277.00, 'Preventiva', 'tecnico021@empresa.com'),
('Tecnico 022', '(19) 99000-0022', '2024-10-22', 4314.00, 'Hidraulica', 'tecnico022@empresa.com'),
('Tecnico 023', '(19) 99000-0023', '2025-11-23', 4351.00, 'Eletrica', 'tecnico023@empresa.com'),
('Tecnico 024', '(19) 99000-0024', '2020-12-24', 4388.00, 'Mecanica', 'tecnico024@empresa.com'),
('Tecnico 025', '(19) 99000-0025', '2021-01-25', 4425.00, 'Preventiva', 'tecnico025@empresa.com'),
('Tecnico 026', '(19) 99000-0026', '2022-02-26', 4462.00, 'Hidraulica', 'tecnico026@empresa.com'),
('Tecnico 027', '(19) 99000-0027', '2023-03-27', 4499.00, 'Eletrica', 'tecnico027@empresa.com'),
('Tecnico 028', '(19) 99000-0028', '2024-04-01', 4536.00, 'Mecanica', 'tecnico028@empresa.com'),
('Tecnico 029', '(19) 99000-0029', '2025-05-02', 4573.00, 'Preventiva', 'tecnico029@empresa.com'),
('Tecnico 030', '(19) 99000-0030', '2020-06-03', 4610.00, 'Hidraulica', 'tecnico030@empresa.com'),
('Tecnico 031', '(19) 99000-0031', '2021-07-04', 4647.00, 'Eletrica', 'tecnico031@empresa.com'),
('Tecnico 032', '(19) 99000-0032', '2022-08-05', 4684.00, 'Mecanica', 'tecnico032@empresa.com'),
('Tecnico 033', '(19) 99000-0033', '2023-09-06', 4721.00, 'Preventiva', 'tecnico033@empresa.com'),
('Tecnico 034', '(19) 99000-0034', '2024-10-07', 4758.00, 'Hidraulica', 'tecnico034@empresa.com'),
('Tecnico 035', '(19) 99000-0035', '2025-11-08', 4795.00, 'Eletrica', 'tecnico035@empresa.com'),
('Tecnico 036', '(19) 99000-0036', '2020-12-09', 4832.00, 'Mecanica', 'tecnico036@empresa.com'),
('Tecnico 037', '(19) 99000-0037', '2021-01-10', 4869.00, 'Preventiva', 'tecnico037@empresa.com'),
('Tecnico 038', '(19) 99000-0038', '2022-02-11', 4906.00, 'Hidraulica', 'tecnico038@empresa.com'),
('Tecnico 039', '(19) 99000-0039', '2023-03-12', 4943.00, 'Eletrica', 'tecnico039@empresa.com'),
('Tecnico 040', '(19) 99000-0040', '2024-04-13', 4980.00, 'Mecanica', 'tecnico040@empresa.com'),
('Tecnico 041', '(19) 99000-0041', '2025-05-14', 5017.00, 'Preventiva', 'tecnico041@empresa.com'),
('Tecnico 042', '(19) 99000-0042', '2020-06-15', 5054.00, 'Hidraulica', 'tecnico042@empresa.com'),
('Tecnico 043', '(19) 99000-0043', '2021-07-16', 5091.00, 'Eletrica', 'tecnico043@empresa.com'),
('Tecnico 044', '(19) 99000-0044', '2022-08-17', 5128.00, 'Mecanica', 'tecnico044@empresa.com'),
('Tecnico 045', '(19) 99000-0045', '2023-09-18', 5165.00, 'Preventiva', 'tecnico045@empresa.com'),
('Tecnico 046', '(19) 99000-0046', '2024-10-19', 5202.00, 'Hidraulica', 'tecnico046@empresa.com'),
('Tecnico 047', '(19) 99000-0047', '2025-11-20', 5239.00, 'Eletrica', 'tecnico047@empresa.com'),
('Tecnico 048', '(19) 99000-0048', '2020-12-21', 5276.00, 'Mecanica', 'tecnico048@empresa.com'),
('Tecnico 049', '(19) 99000-0049', '2021-01-22', 5313.00, 'Preventiva', 'tecnico049@empresa.com'),
('Tecnico 050', '(19) 99000-0050', '2022-02-23', 5350.00, 'Hidraulica', 'tecnico050@empresa.com'),
('Tecnico 051', '(19) 99000-0051', '2023-03-24', 5387.00, 'Eletrica', 'tecnico051@empresa.com'),
('Tecnico 052', '(19) 99000-0052', '2024-04-25', 5424.00, 'Mecanica', 'tecnico052@empresa.com'),
('Tecnico 053', '(19) 99000-0053', '2025-05-26', 5461.00, 'Preventiva', 'tecnico053@empresa.com'),
('Tecnico 054', '(19) 99000-0054', '2020-06-27', 5498.00, 'Hidraulica', 'tecnico054@empresa.com'),
('Tecnico 055', '(19) 99000-0055', '2021-07-01', 5535.00, 'Eletrica', 'tecnico055@empresa.com'),
('Tecnico 056', '(19) 99000-0056', '2022-08-02', 5572.00, 'Mecanica', 'tecnico056@empresa.com'),
('Tecnico 057', '(19) 99000-0057', '2023-09-03', 5609.00, 'Preventiva', 'tecnico057@empresa.com'),
('Tecnico 058', '(19) 99000-0058', '2024-10-04', 5646.00, 'Hidraulica', 'tecnico058@empresa.com'),
('Tecnico 059', '(19) 99000-0059', '2025-11-05', 5683.00, 'Eletrica', 'tecnico059@empresa.com'),
('Tecnico 060', '(19) 99000-0060', '2020-12-06', 5720.00, 'Mecanica', 'tecnico060@empresa.com'),
('Tecnico 061', '(19) 99000-0061', '2021-01-07', 5757.00, 'Preventiva', 'tecnico061@empresa.com'),
('Tecnico 062', '(19) 99000-0062', '2022-02-08', 5794.00, 'Hidraulica', 'tecnico062@empresa.com'),
('Tecnico 063', '(19) 99000-0063', '2023-03-09', 5831.00, 'Eletrica', 'tecnico063@empresa.com'),
('Tecnico 064', '(19) 99000-0064', '2024-04-10', 5868.00, 'Mecanica', 'tecnico064@empresa.com'),
('Tecnico 065', '(19) 99000-0065', '2025-05-11', 5905.00, 'Preventiva', 'tecnico065@empresa.com'),
('Tecnico 066', '(19) 99000-0066', '2020-06-12', 5942.00, 'Hidraulica', 'tecnico066@empresa.com'),
('Tecnico 067', '(19) 99000-0067', '2021-07-13', 5979.00, 'Eletrica', 'tecnico067@empresa.com'),
('Tecnico 068', '(19) 99000-0068', '2022-08-14', 6016.00, 'Mecanica', 'tecnico068@empresa.com'),
('Tecnico 069', '(19) 99000-0069', '2023-09-15', 6053.00, 'Preventiva', 'tecnico069@empresa.com'),
('Tecnico 070', '(19) 99000-0070', '2024-10-16', 6090.00, 'Hidraulica', 'tecnico070@empresa.com'),
('Tecnico 071', '(19) 99000-0071', '2025-11-17', 6127.00, 'Eletrica', 'tecnico071@empresa.com'),
('Tecnico 072', '(19) 99000-0072', '2020-12-18', 6164.00, 'Mecanica', 'tecnico072@empresa.com'),
('Tecnico 073', '(19) 99000-0073', '2021-01-19', 6201.00, 'Preventiva', 'tecnico073@empresa.com'),
('Tecnico 074', '(19) 99000-0074', '2022-02-20', 6238.00, 'Hidraulica', 'tecnico074@empresa.com'),
('Tecnico 075', '(19) 99000-0075', '2023-03-21', 6275.00, 'Eletrica', 'tecnico075@empresa.com'),
('Tecnico 076', '(19) 99000-0076', '2024-04-22', 6312.00, 'Mecanica', 'tecnico076@empresa.com'),
('Tecnico 077', '(19) 99000-0077', '2025-05-23', 6349.00, 'Preventiva', 'tecnico077@empresa.com'),
('Tecnico 078', '(19) 99000-0078', '2020-06-24', 6386.00, 'Hidraulica', 'tecnico078@empresa.com'),
('Tecnico 079', '(19) 99000-0079', '2021-07-25', 6423.00, 'Eletrica', 'tecnico079@empresa.com'),
('Tecnico 080', '(19) 99000-0080', '2022-08-26', 6460.00, 'Mecanica', 'tecnico080@empresa.com'),
('Tecnico 081', '(19) 99000-0081', '2023-09-27', 6497.00, 'Preventiva', 'tecnico081@empresa.com'),
('Tecnico 082', '(19) 99000-0082', '2024-10-01', 3534.00, 'Hidraulica', 'tecnico082@empresa.com'),
('Tecnico 083', '(19) 99000-0083', '2025-11-02', 3571.00, 'Eletrica', 'tecnico083@empresa.com'),
('Tecnico 084', '(19) 99000-0084', '2020-12-03', 3608.00, 'Mecanica', 'tecnico084@empresa.com'),
('Tecnico 085', '(19) 99000-0085', '2021-01-04', 3645.00, 'Preventiva', 'tecnico085@empresa.com'),
('Tecnico 086', '(19) 99000-0086', '2022-02-05', 3682.00, 'Hidraulica', 'tecnico086@empresa.com'),
('Tecnico 087', '(19) 99000-0087', '2023-03-06', 3719.00, 'Eletrica', 'tecnico087@empresa.com'),
('Tecnico 088', '(19) 99000-0088', '2024-04-07', 3756.00, 'Mecanica', 'tecnico088@empresa.com'),
('Tecnico 089', '(19) 99000-0089', '2025-05-08', 3793.00, 'Preventiva', 'tecnico089@empresa.com'),
('Tecnico 090', '(19) 99000-0090', '2020-06-09', 3830.00, 'Hidraulica', 'tecnico090@empresa.com'),
('Tecnico 091', '(19) 99000-0091', '2021-07-10', 3867.00, 'Eletrica', 'tecnico091@empresa.com'),
('Tecnico 092', '(19) 99000-0092', '2022-08-11', 3904.00, 'Mecanica', 'tecnico092@empresa.com'),
('Tecnico 093', '(19) 99000-0093', '2023-09-12', 3941.00, 'Preventiva', 'tecnico093@empresa.com'),
('Tecnico 094', '(19) 99000-0094', '2024-10-13', 3978.00, 'Hidraulica', 'tecnico094@empresa.com'),
('Tecnico 095', '(19) 99000-0095', '2025-11-14', 4015.00, 'Eletrica', 'tecnico095@empresa.com'),
('Tecnico 096', '(19) 99000-0096', '2020-12-15', 4052.00, 'Mecanica', 'tecnico096@empresa.com'),
('Tecnico 097', '(19) 99000-0097', '2021-01-16', 4089.00, 'Preventiva', 'tecnico097@empresa.com'),
('Tecnico 098', '(19) 99000-0098', '2022-02-17', 4126.00, 'Hidraulica', 'tecnico098@empresa.com'),
('Tecnico 099', '(19) 99000-0099', '2023-03-18', 4163.00, 'Eletrica', 'tecnico099@empresa.com'),
('Tecnico 100', '(19) 99000-0100', '2024-04-19', 4200.00, 'Mecanica', 'tecnico100@empresa.com');

-- MAQUINA
INSERT INTO maquina (nome, fabricante, setor, modelo, data_aquisicao, status_maquina) VALUES
('Torno CNC 01',         'Romi',    'Usinagem',  'GL 240', '2017-05-10', 'ATIVA'),
('Prensa Hidráulica 02', 'Schuler', 'Montagem',  'PH-100', '2016-08-22', 'ATIVA'),
('Cabine de Pintura 03', 'Wagner',  'Pintura',   'CP-450', '2019-11-05', 'ATIVA'),
('Esteira Montagem 04',  'Siemens', 'Montagem',  'EM-220', '2018-03-30', 'EM MANUTENCAO'),
('Fresadora 05',         'Romi',    'Usinagem',  'D 800',  '2020-06-18', 'ATIVA'),
('Seladora 06',          'Bosch',   'Embalagem', 'SL-30',  '2015-09-12', 'INATIVA'),
('Equipamento 007', 'Schuler', 'Embalagem', 'MOD-007', '2021-07-07', 'EM MANUTENCAO'),
('Equipamento 008', 'Romi', 'Usinagem', 'MOD-008', '2022-08-08', 'INATIVA'),
('Equipamento 009', 'Bosch', 'Montagem', 'MOD-009', '2023-09-09', 'ATIVA'),
('Equipamento 010', 'Siemens', 'Pintura', 'MOD-010', '2024-10-10', 'EM MANUTENCAO'),
('Equipamento 011', 'Schuler', 'Embalagem', 'MOD-011', '2025-11-11', 'INATIVA'),
('Equipamento 012', 'Romi', 'Usinagem', 'MOD-012', '2020-12-12', 'ATIVA'),
('Equipamento 013', 'Bosch', 'Montagem', 'MOD-013', '2021-01-13', 'EM MANUTENCAO'),
('Equipamento 014', 'Siemens', 'Pintura', 'MOD-014', '2022-02-14', 'INATIVA'),
('Equipamento 015', 'Schuler', 'Embalagem', 'MOD-015', '2023-03-15', 'ATIVA'),
('Equipamento 016', 'Romi', 'Usinagem', 'MOD-016', '2024-04-16', 'EM MANUTENCAO'),
('Equipamento 017', 'Bosch', 'Montagem', 'MOD-017', '2025-05-17', 'INATIVA'),
('Equipamento 018', 'Siemens', 'Pintura', 'MOD-018', '2020-06-18', 'ATIVA'),
('Equipamento 019', 'Schuler', 'Embalagem', 'MOD-019', '2021-07-19', 'EM MANUTENCAO'),
('Equipamento 020', 'Romi', 'Usinagem', 'MOD-020', '2022-08-20', 'INATIVA'),
('Equipamento 021', 'Bosch', 'Montagem', 'MOD-021', '2023-09-21', 'ATIVA'),
('Equipamento 022', 'Siemens', 'Pintura', 'MOD-022', '2024-10-22', 'EM MANUTENCAO'),
('Equipamento 023', 'Schuler', 'Embalagem', 'MOD-023', '2025-11-23', 'INATIVA'),
('Equipamento 024', 'Romi', 'Usinagem', 'MOD-024', '2020-12-24', 'ATIVA'),
('Equipamento 025', 'Bosch', 'Montagem', 'MOD-025', '2021-01-25', 'EM MANUTENCAO'),
('Equipamento 026', 'Siemens', 'Pintura', 'MOD-026', '2022-02-26', 'INATIVA'),
('Equipamento 027', 'Schuler', 'Embalagem', 'MOD-027', '2023-03-27', 'ATIVA'),
('Equipamento 028', 'Romi', 'Usinagem', 'MOD-028', '2024-04-01', 'EM MANUTENCAO'),
('Equipamento 029', 'Bosch', 'Montagem', 'MOD-029', '2025-05-02', 'INATIVA'),
('Equipamento 030', 'Siemens', 'Pintura', 'MOD-030', '2020-06-03', 'ATIVA'),
('Equipamento 031', 'Schuler', 'Embalagem', 'MOD-031', '2021-07-04', 'EM MANUTENCAO'),
('Equipamento 032', 'Romi', 'Usinagem', 'MOD-032', '2022-08-05', 'INATIVA'),
('Equipamento 033', 'Bosch', 'Montagem', 'MOD-033', '2023-09-06', 'ATIVA'),
('Equipamento 034', 'Siemens', 'Pintura', 'MOD-034', '2024-10-07', 'EM MANUTENCAO'),
('Equipamento 035', 'Schuler', 'Embalagem', 'MOD-035', '2025-11-08', 'INATIVA'),
('Equipamento 036', 'Romi', 'Usinagem', 'MOD-036', '2020-12-09', 'ATIVA'),
('Equipamento 037', 'Bosch', 'Montagem', 'MOD-037', '2021-01-10', 'EM MANUTENCAO'),
('Equipamento 038', 'Siemens', 'Pintura', 'MOD-038', '2022-02-11', 'INATIVA'),
('Equipamento 039', 'Schuler', 'Embalagem', 'MOD-039', '2023-03-12', 'ATIVA'),
('Equipamento 040', 'Romi', 'Usinagem', 'MOD-040', '2024-04-13', 'EM MANUTENCAO'),
('Equipamento 041', 'Bosch', 'Montagem', 'MOD-041', '2025-05-14', 'INATIVA'),
('Equipamento 042', 'Siemens', 'Pintura', 'MOD-042', '2020-06-15', 'ATIVA'),
('Equipamento 043', 'Schuler', 'Embalagem', 'MOD-043', '2021-07-16', 'EM MANUTENCAO'),
('Equipamento 044', 'Romi', 'Usinagem', 'MOD-044', '2022-08-17', 'INATIVA'),
('Equipamento 045', 'Bosch', 'Montagem', 'MOD-045', '2023-09-18', 'ATIVA'),
('Equipamento 046', 'Siemens', 'Pintura', 'MOD-046', '2024-10-19', 'EM MANUTENCAO'),
('Equipamento 047', 'Schuler', 'Embalagem', 'MOD-047', '2025-11-20', 'INATIVA'),
('Equipamento 048', 'Romi', 'Usinagem', 'MOD-048', '2020-12-21', 'ATIVA'),
('Equipamento 049', 'Bosch', 'Montagem', 'MOD-049', '2021-01-22', 'EM MANUTENCAO'),
('Equipamento 050', 'Siemens', 'Pintura', 'MOD-050', '2022-02-23', 'INATIVA'),
('Equipamento 051', 'Schuler', 'Embalagem', 'MOD-051', '2023-03-24', 'ATIVA'),
('Equipamento 052', 'Romi', 'Usinagem', 'MOD-052', '2024-04-25', 'EM MANUTENCAO'),
('Equipamento 053', 'Bosch', 'Montagem', 'MOD-053', '2025-05-26', 'INATIVA'),
('Equipamento 054', 'Siemens', 'Pintura', 'MOD-054', '2020-06-27', 'ATIVA'),
('Equipamento 055', 'Schuler', 'Embalagem', 'MOD-055', '2021-07-01', 'EM MANUTENCAO'),
('Equipamento 056', 'Romi', 'Usinagem', 'MOD-056', '2022-08-02', 'INATIVA'),
('Equipamento 057', 'Bosch', 'Montagem', 'MOD-057', '2023-09-03', 'ATIVA'),
('Equipamento 058', 'Siemens', 'Pintura', 'MOD-058', '2024-10-04', 'EM MANUTENCAO'),
('Equipamento 059', 'Schuler', 'Embalagem', 'MOD-059', '2025-11-05', 'INATIVA'),
('Equipamento 060', 'Romi', 'Usinagem', 'MOD-060', '2020-12-06', 'ATIVA'),
('Equipamento 061', 'Bosch', 'Montagem', 'MOD-061', '2021-01-07', 'EM MANUTENCAO'),
('Equipamento 062', 'Siemens', 'Pintura', 'MOD-062', '2022-02-08', 'INATIVA'),
('Equipamento 063', 'Schuler', 'Embalagem', 'MOD-063', '2023-03-09', 'ATIVA'),
('Equipamento 064', 'Romi', 'Usinagem', 'MOD-064', '2024-04-10', 'EM MANUTENCAO'),
('Equipamento 065', 'Bosch', 'Montagem', 'MOD-065', '2025-05-11', 'INATIVA'),
('Equipamento 066', 'Siemens', 'Pintura', 'MOD-066', '2020-06-12', 'ATIVA'),
('Equipamento 067', 'Schuler', 'Embalagem', 'MOD-067', '2021-07-13', 'EM MANUTENCAO'),
('Equipamento 068', 'Romi', 'Usinagem', 'MOD-068', '2022-08-14', 'INATIVA'),
('Equipamento 069', 'Bosch', 'Montagem', 'MOD-069', '2023-09-15', 'ATIVA'),
('Equipamento 070', 'Siemens', 'Pintura', 'MOD-070', '2024-10-16', 'EM MANUTENCAO'),
('Equipamento 071', 'Schuler', 'Embalagem', 'MOD-071', '2025-11-17', 'INATIVA'),
('Equipamento 072', 'Romi', 'Usinagem', 'MOD-072', '2020-12-18', 'ATIVA'),
('Equipamento 073', 'Bosch', 'Montagem', 'MOD-073', '2021-01-19', 'EM MANUTENCAO'),
('Equipamento 074', 'Siemens', 'Pintura', 'MOD-074', '2022-02-20', 'INATIVA'),
('Equipamento 075', 'Schuler', 'Embalagem', 'MOD-075', '2023-03-21', 'ATIVA'),
('Equipamento 076', 'Romi', 'Usinagem', 'MOD-076', '2024-04-22', 'EM MANUTENCAO'),
('Equipamento 077', 'Bosch', 'Montagem', 'MOD-077', '2025-05-23', 'INATIVA'),
('Equipamento 078', 'Siemens', 'Pintura', 'MOD-078', '2020-06-24', 'ATIVA'),
('Equipamento 079', 'Schuler', 'Embalagem', 'MOD-079', '2021-07-25', 'EM MANUTENCAO'),
('Equipamento 080', 'Romi', 'Usinagem', 'MOD-080', '2022-08-26', 'INATIVA'),
('Equipamento 081', 'Bosch', 'Montagem', 'MOD-081', '2023-09-27', 'ATIVA'),
('Equipamento 082', 'Siemens', 'Pintura', 'MOD-082', '2024-10-01', 'EM MANUTENCAO'),
('Equipamento 083', 'Schuler', 'Embalagem', 'MOD-083', '2025-11-02', 'INATIVA'),
('Equipamento 084', 'Romi', 'Usinagem', 'MOD-084', '2020-12-03', 'ATIVA'),
('Equipamento 085', 'Bosch', 'Montagem', 'MOD-085', '2021-01-04', 'EM MANUTENCAO'),
('Equipamento 086', 'Siemens', 'Pintura', 'MOD-086', '2022-02-05', 'INATIVA'),
('Equipamento 087', 'Schuler', 'Embalagem', 'MOD-087', '2023-03-06', 'ATIVA'),
('Equipamento 088', 'Romi', 'Usinagem', 'MOD-088', '2024-04-07', 'EM MANUTENCAO'),
('Equipamento 089', 'Bosch', 'Montagem', 'MOD-089', '2025-05-08', 'INATIVA'),
('Equipamento 090', 'Siemens', 'Pintura', 'MOD-090', '2020-06-09', 'ATIVA'),
('Equipamento 091', 'Schuler', 'Embalagem', 'MOD-091', '2021-07-10', 'EM MANUTENCAO'),
('Equipamento 092', 'Romi', 'Usinagem', 'MOD-092', '2022-08-11', 'INATIVA'),
('Equipamento 093', 'Bosch', 'Montagem', 'MOD-093', '2023-09-12', 'ATIVA'),
('Equipamento 094', 'Siemens', 'Pintura', 'MOD-094', '2024-10-13', 'EM MANUTENCAO'),
('Equipamento 095', 'Schuler', 'Embalagem', 'MOD-095', '2025-11-14', 'INATIVA'),
('Equipamento 096', 'Romi', 'Usinagem', 'MOD-096', '2020-12-15', 'ATIVA'),
('Equipamento 097', 'Bosch', 'Montagem', 'MOD-097', '2021-01-16', 'EM MANUTENCAO'),
('Equipamento 098', 'Siemens', 'Pintura', 'MOD-098', '2022-02-17', 'INATIVA'),
('Equipamento 099', 'Schuler', 'Embalagem', 'MOD-099', '2023-03-18', 'ATIVA'),
('Equipamento 100', 'Romi', 'Usinagem', 'MOD-100', '2024-04-19', 'EM MANUTENCAO');

-- SERVICO
INSERT INTO servico (garantia_dias, nome_servico, valor_servico, categoria, tempo_estimado, descricao) VALUES
(90,  'Troca de rolamento',     350.00, 'Mecânica',   3, 'Substituição de rolamentos desgastados do eixo ou do motor'),
(30,  'Lubrificação geral',     120.00, 'Preventiva', 1, 'Lubrificação de eixos, guias e articulações da máquina'),
(60,  'Calibração de sensores', 280.00, 'Elétrica',   2, 'Ajuste e teste dos sensores de posição e temperatura'),
(90,  'Troca de correia',       220.00, 'Mecânica',   2, 'Substituição de correias de transmissão'),
(120, 'Reparo elétrico',        450.00, 'Elétrica',   4, 'Diagnóstico e reparo de falhas no circuito elétrico'),
(30,  'Troca de filtro',         90.00, 'Preventiva', 1, 'Substituição de filtros de óleo, ar ou hidráulicos'),
(90,  'Alinhamento de eixo',    380.00, 'Mecânica',   3, 'Alinhamento e balanceamento do eixo principal'),
(30,  'Revisão preventiva',     200.00, 'Preventiva', 2, 'Inspeção completa seguindo o checklist do fabricante'),
(150, 'Servico de manutencao 009', 307.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 009'),
(30, 'Servico de manutencao 010', 330.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 010'),
(60, 'Servico de manutencao 011', 353.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 011'),
(90, 'Servico de manutencao 012', 376.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 012'),
(120, 'Servico de manutencao 013', 399.00, 'Preventiva', 6, 'Servico tecnico de manutencao preventiva e corretiva numero 013'),
(150, 'Servico de manutencao 014', 422.00, 'Eletrica', 7, 'Servico tecnico de manutencao preventiva e corretiva numero 014'),
(30, 'Servico de manutencao 015', 445.00, 'Hidraulica', 8, 'Servico tecnico de manutencao preventiva e corretiva numero 015'),
(60, 'Servico de manutencao 016', 468.00, 'Mecanica', 1, 'Servico tecnico de manutencao preventiva e corretiva numero 016'),
(90, 'Servico de manutencao 017', 491.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 017'),
(120, 'Servico de manutencao 018', 514.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 018'),
(150, 'Servico de manutencao 019', 537.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 019'),
(30, 'Servico de manutencao 020', 560.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 020'),
(60, 'Servico de manutencao 021', 583.00, 'Preventiva', 6, 'Servico tecnico de manutencao preventiva e corretiva numero 021'),
(90, 'Servico de manutencao 022', 606.00, 'Eletrica', 7, 'Servico tecnico de manutencao preventiva e corretiva numero 022'),
(120, 'Servico de manutencao 023', 629.00, 'Hidraulica', 8, 'Servico tecnico de manutencao preventiva e corretiva numero 023'),
(150, 'Servico de manutencao 024', 652.00, 'Mecanica', 1, 'Servico tecnico de manutencao preventiva e corretiva numero 024'),
(30, 'Servico de manutencao 025', 675.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 025'),
(60, 'Servico de manutencao 026', 698.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 026'),
(90, 'Servico de manutencao 027', 721.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 027'),
(120, 'Servico de manutencao 028', 744.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 028'),
(150, 'Servico de manutencao 029', 767.00, 'Preventiva', 6, 'Servico tecnico de manutencao preventiva e corretiva numero 029'),
(30, 'Servico de manutencao 030', 790.00, 'Eletrica', 7, 'Servico tecnico de manutencao preventiva e corretiva numero 030'),
(60, 'Servico de manutencao 031', 813.00, 'Hidraulica', 8, 'Servico tecnico de manutencao preventiva e corretiva numero 031'),
(90, 'Servico de manutencao 032', 836.00, 'Mecanica', 1, 'Servico tecnico de manutencao preventiva e corretiva numero 032'),
(120, 'Servico de manutencao 033', 859.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 033'),
(150, 'Servico de manutencao 034', 882.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 034'),
(30, 'Servico de manutencao 035', 905.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 035'),
(60, 'Servico de manutencao 036', 928.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 036'),
(90, 'Servico de manutencao 037', 951.00, 'Preventiva', 6, 'Servico tecnico de manutencao preventiva e corretiva numero 037'),
(120, 'Servico de manutencao 038', 974.00, 'Eletrica', 7, 'Servico tecnico de manutencao preventiva e corretiva numero 038'),
(150, 'Servico de manutencao 039', 997.00, 'Hidraulica', 8, 'Servico tecnico de manutencao preventiva e corretiva numero 039'),
(30, 'Servico de manutencao 040', 120.00, 'Mecanica', 1, 'Servico tecnico de manutencao preventiva e corretiva numero 040'),
(60, 'Servico de manutencao 041', 143.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 041'),
(90, 'Servico de manutencao 042', 166.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 042'),
(120, 'Servico de manutencao 043', 189.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 043'),
(150, 'Servico de manutencao 044', 212.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 044'),
(30, 'Servico de manutencao 045', 235.00, 'Preventiva', 6, 'Servico tecnico de manutencao preventiva e corretiva numero 045'),
(60, 'Servico de manutencao 046', 258.00, 'Eletrica', 7, 'Servico tecnico de manutencao preventiva e corretiva numero 046'),
(90, 'Servico de manutencao 047', 281.00, 'Hidraulica', 8, 'Servico tecnico de manutencao preventiva e corretiva numero 047'),
(120, 'Servico de manutencao 048', 304.00, 'Mecanica', 1, 'Servico tecnico de manutencao preventiva e corretiva numero 048'),
(150, 'Servico de manutencao 049', 327.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 049'),
(30, 'Servico de manutencao 050', 350.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 050'),
(60, 'Servico de manutencao 051', 373.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 051'),
(90, 'Servico de manutencao 052', 396.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 052'),
(120, 'Servico de manutencao 053', 419.00, 'Preventiva', 6, 'Servico tecnico de manutencao preventiva e corretiva numero 053'),
(150, 'Servico de manutencao 054', 442.00, 'Eletrica', 7, 'Servico tecnico de manutencao preventiva e corretiva numero 054'),
(30, 'Servico de manutencao 055', 465.00, 'Hidraulica', 8, 'Servico tecnico de manutencao preventiva e corretiva numero 055'),
(60, 'Servico de manutencao 056', 488.00, 'Mecanica', 1, 'Servico tecnico de manutencao preventiva e corretiva numero 056'),
(90, 'Servico de manutencao 057', 511.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 057'),
(120, 'Servico de manutencao 058', 534.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 058'),
(150, 'Servico de manutencao 059', 557.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 059'),
(30, 'Servico de manutencao 060', 580.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 060'),
(60, 'Servico de manutencao 061', 603.00, 'Preventiva', 6, 'Servico tecnico de manutencao preventiva e corretiva numero 061'),
(90, 'Servico de manutencao 062', 626.00, 'Eletrica', 7, 'Servico tecnico de manutencao preventiva e corretiva numero 062'),
(120, 'Servico de manutencao 063', 649.00, 'Hidraulica', 8, 'Servico tecnico de manutencao preventiva e corretiva numero 063'),
(150, 'Servico de manutencao 064', 672.00, 'Mecanica', 1, 'Servico tecnico de manutencao preventiva e corretiva numero 064'),
(30, 'Servico de manutencao 065', 695.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 065'),
(60, 'Servico de manutencao 066', 718.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 066'),
(90, 'Servico de manutencao 067', 741.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 067'),
(120, 'Servico de manutencao 068', 764.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 068'),
(150, 'Servico de manutencao 069', 787.00, 'Preventiva', 6, 'Servico tecnico de manutencao preventiva e corretiva numero 069'),
(30, 'Servico de manutencao 070', 810.00, 'Eletrica', 7, 'Servico tecnico de manutencao preventiva e corretiva numero 070'),
(60, 'Servico de manutencao 071', 833.00, 'Hidraulica', 8, 'Servico tecnico de manutencao preventiva e corretiva numero 071'),
(90, 'Servico de manutencao 072', 856.00, 'Mecanica', 1, 'Servico tecnico de manutencao preventiva e corretiva numero 072'),
(120, 'Servico de manutencao 073', 879.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 073'),
(150, 'Servico de manutencao 074', 902.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 074'),
(30, 'Servico de manutencao 075', 925.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 075'),
(60, 'Servico de manutencao 076', 948.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 076'),
(90, 'Servico de manutencao 077', 971.00, 'Preventiva', 6, 'Servico tecnico de manutencao preventiva e corretiva numero 077'),
(120, 'Servico de manutencao 078', 994.00, 'Eletrica', 7, 'Servico tecnico de manutencao preventiva e corretiva numero 078'),
(150, 'Servico de manutencao 079', 117.00, 'Hidraulica', 8, 'Servico tecnico de manutencao preventiva e corretiva numero 079'),
(30, 'Servico de manutencao 080', 140.00, 'Mecanica', 1, 'Servico tecnico de manutencao preventiva e corretiva numero 080'),
(60, 'Servico de manutencao 081', 163.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 081'),
(90, 'Servico de manutencao 082', 186.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 082'),
(120, 'Servico de manutencao 083', 209.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 083'),
(150, 'Servico de manutencao 084', 232.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 084'),
(30, 'Servico de manutencao 085', 255.00, 'Preventiva', 6, 'Servico tecnico de manutencao preventiva e corretiva numero 085'),
(60, 'Servico de manutencao 086', 278.00, 'Eletrica', 7, 'Servico tecnico de manutencao preventiva e corretiva numero 086'),
(90, 'Servico de manutencao 087', 301.00, 'Hidraulica', 8, 'Servico tecnico de manutencao preventiva e corretiva numero 087'),
(120, 'Servico de manutencao 088', 324.00, 'Mecanica', 1, 'Servico tecnico de manutencao preventiva e corretiva numero 088'),
(150, 'Servico de manutencao 089', 347.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 089'),
(30, 'Servico de manutencao 090', 370.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 090'),
(60, 'Servico de manutencao 091', 393.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 091'),
(90, 'Servico de manutencao 092', 416.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 092'),
(120, 'Servico de manutencao 093', 439.00, 'Preventiva', 6, 'Servico tecnico de manutencao preventiva e corretiva numero 093'),
(150, 'Servico de manutencao 094', 462.00, 'Eletrica', 7, 'Servico tecnico de manutencao preventiva e corretiva numero 094'),
(30, 'Servico de manutencao 095', 485.00, 'Hidraulica', 8, 'Servico tecnico de manutencao preventiva e corretiva numero 095'),
(60, 'Servico de manutencao 096', 508.00, 'Mecanica', 1, 'Servico tecnico de manutencao preventiva e corretiva numero 096'),
(90, 'Servico de manutencao 097', 531.00, 'Preventiva', 2, 'Servico tecnico de manutencao preventiva e corretiva numero 097'),
(120, 'Servico de manutencao 098', 554.00, 'Eletrica', 3, 'Servico tecnico de manutencao preventiva e corretiva numero 098'),
(150, 'Servico de manutencao 099', 577.00, 'Hidraulica', 4, 'Servico tecnico de manutencao preventiva e corretiva numero 099'),
(30, 'Servico de manutencao 100', 600.00, 'Mecanica', 5, 'Servico tecnico de manutencao preventiva e corretiva numero 100');

-- MANUTENCAO
INSERT INTO manutencao (id_ordem, id_tecnico, tipo_manutencao, descricao, data_manutencao, custo, id_maquina) VALUES
(1, 1, 'Corretiva',  'Troca de rolamento e lubrificação do eixo do torno',  '2026-10-02', 470.00, 1),
(2, 3, 'Corretiva',  'Reparo do circuito e troca de filtros da prensa',     '2026-10-07', 630.00, 2),
(3, 4, 'Corretiva',  'Calibração dos sensores da cabine de pintura',        '2026-10-11', 280.00, 3),
(4, 3, 'Corretiva',  'Troca de correia e alinhamento do eixo da esteira',   '2026-11-04', 600.00, 4),
(1, 2, 'Preventiva', 'Revisão do torno após a troca de rolamento',          '2026-10-03', 200.00, 1),
(5, 5, 'Preventiva', 'Revisão trimestral e lubrificação da fresadora',      '2026-11-11', 320.00, 5),
(8, 8, 'Preventiva', 'Manutencao programada do equipamento 007', '2026-07-07', 437.00, 8),
(9, 9, 'Corretiva', 'Manutencao programada do equipamento 008', '2026-08-08', 478.00, 9),
(10, 10, 'Preventiva', 'Manutencao programada do equipamento 009', '2026-09-09', 519.00, 10),
(11, 11, 'Corretiva', 'Manutencao programada do equipamento 010', '2026-10-10', 560.00, 11),
(12, 12, 'Preventiva', 'Manutencao programada do equipamento 011', '2026-11-11', 601.00, 12),
(13, 13, 'Corretiva', 'Manutencao programada do equipamento 012', '2026-12-12', 642.00, 13),
(14, 14, 'Preventiva', 'Manutencao programada do equipamento 013', '2026-01-13', 683.00, 14),
(15, 15, 'Corretiva', 'Manutencao programada do equipamento 014', '2026-02-14', 724.00, 15),
(16, 16, 'Preventiva', 'Manutencao programada do equipamento 015', '2026-03-15', 765.00, 16),
(17, 17, 'Corretiva', 'Manutencao programada do equipamento 016', '2026-04-16', 806.00, 17),
(18, 18, 'Preventiva', 'Manutencao programada do equipamento 017', '2026-05-17', 847.00, 18),
(19, 19, 'Corretiva', 'Manutencao programada do equipamento 018', '2026-06-18', 888.00, 19),
(20, 20, 'Preventiva', 'Manutencao programada do equipamento 019', '2026-07-19', 929.00, 20),
(21, 21, 'Corretiva', 'Manutencao programada do equipamento 020', '2026-08-20', 970.00, 21),
(22, 22, 'Preventiva', 'Manutencao programada do equipamento 021', '2026-09-21', 1011.00, 22),
(23, 23, 'Corretiva', 'Manutencao programada do equipamento 022', '2026-10-22', 1052.00, 23),
(24, 24, 'Preventiva', 'Manutencao programada do equipamento 023', '2026-11-23', 1093.00, 24),
(25, 25, 'Corretiva', 'Manutencao programada do equipamento 024', '2026-12-24', 1134.00, 25),
(26, 26, 'Preventiva', 'Manutencao programada do equipamento 025', '2026-01-25', 1175.00, 26),
(27, 27, 'Corretiva', 'Manutencao programada do equipamento 026', '2026-02-26', 1216.00, 27),
(28, 28, 'Preventiva', 'Manutencao programada do equipamento 027', '2026-03-27', 1257.00, 28),
(29, 29, 'Corretiva', 'Manutencao programada do equipamento 028', '2026-04-01', 1298.00, 29),
(30, 30, 'Preventiva', 'Manutencao programada do equipamento 029', '2026-05-02', 1339.00, 30),
(31, 31, 'Corretiva', 'Manutencao programada do equipamento 030', '2026-06-03', 1380.00, 31),
(32, 32, 'Preventiva', 'Manutencao programada do equipamento 031', '2026-07-04', 1421.00, 32),
(33, 33, 'Corretiva', 'Manutencao programada do equipamento 032', '2026-08-05', 1462.00, 33),
(34, 34, 'Preventiva', 'Manutencao programada do equipamento 033', '2026-09-06', 1503.00, 34),
(35, 35, 'Corretiva', 'Manutencao programada do equipamento 034', '2026-10-07', 1544.00, 35),
(36, 36, 'Preventiva', 'Manutencao programada do equipamento 035', '2026-11-08', 1585.00, 36),
(37, 37, 'Corretiva', 'Manutencao programada do equipamento 036', '2026-12-09', 1626.00, 37),
(38, 38, 'Preventiva', 'Manutencao programada do equipamento 037', '2026-01-10', 1667.00, 38),
(39, 39, 'Corretiva', 'Manutencao programada do equipamento 038', '2026-02-11', 1708.00, 39),
(40, 40, 'Preventiva', 'Manutencao programada do equipamento 039', '2026-03-12', 1749.00, 40),
(41, 41, 'Corretiva', 'Manutencao programada do equipamento 040', '2026-04-13', 1790.00, 41),
(42, 42, 'Preventiva', 'Manutencao programada do equipamento 041', '2026-05-14', 1831.00, 42),
(43, 43, 'Corretiva', 'Manutencao programada do equipamento 042', '2026-06-15', 1872.00, 43),
(44, 44, 'Preventiva', 'Manutencao programada do equipamento 043', '2026-07-16', 1913.00, 44),
(45, 45, 'Corretiva', 'Manutencao programada do equipamento 044', '2026-08-17', 154.00, 45),
(46, 46, 'Preventiva', 'Manutencao programada do equipamento 045', '2026-09-18', 195.00, 46),
(47, 47, 'Corretiva', 'Manutencao programada do equipamento 046', '2026-10-19', 236.00, 47),
(48, 48, 'Preventiva', 'Manutencao programada do equipamento 047', '2026-11-20', 277.00, 48),
(49, 49, 'Corretiva', 'Manutencao programada do equipamento 048', '2026-12-21', 318.00, 49),
(50, 50, 'Preventiva', 'Manutencao programada do equipamento 049', '2026-01-22', 359.00, 50),
(51, 51, 'Corretiva', 'Manutencao programada do equipamento 050', '2026-02-23', 400.00, 51),
(52, 52, 'Preventiva', 'Manutencao programada do equipamento 051', '2026-03-24', 441.00, 52),
(53, 53, 'Corretiva', 'Manutencao programada do equipamento 052', '2026-04-25', 482.00, 53),
(54, 54, 'Preventiva', 'Manutencao programada do equipamento 053', '2026-05-26', 523.00, 54),
(55, 55, 'Corretiva', 'Manutencao programada do equipamento 054', '2026-06-27', 564.00, 55),
(56, 56, 'Preventiva', 'Manutencao programada do equipamento 055', '2026-07-01', 605.00, 56),
(57, 57, 'Corretiva', 'Manutencao programada do equipamento 056', '2026-08-02', 646.00, 57),
(58, 58, 'Preventiva', 'Manutencao programada do equipamento 057', '2026-09-03', 687.00, 58),
(59, 59, 'Corretiva', 'Manutencao programada do equipamento 058', '2026-10-04', 728.00, 59),
(60, 60, 'Preventiva', 'Manutencao programada do equipamento 059', '2026-11-05', 769.00, 60),
(61, 61, 'Corretiva', 'Manutencao programada do equipamento 060', '2026-12-06', 810.00, 61),
(62, 62, 'Preventiva', 'Manutencao programada do equipamento 061', '2026-01-07', 851.00, 62),
(63, 63, 'Corretiva', 'Manutencao programada do equipamento 062', '2026-02-08', 892.00, 63),
(64, 64, 'Preventiva', 'Manutencao programada do equipamento 063', '2026-03-09', 933.00, 64),
(65, 65, 'Corretiva', 'Manutencao programada do equipamento 064', '2026-04-10', 974.00, 65),
(66, 66, 'Preventiva', 'Manutencao programada do equipamento 065', '2026-05-11', 1015.00, 66),
(67, 67, 'Corretiva', 'Manutencao programada do equipamento 066', '2026-06-12', 1056.00, 67),
(68, 68, 'Preventiva', 'Manutencao programada do equipamento 067', '2026-07-13', 1097.00, 68),
(69, 69, 'Corretiva', 'Manutencao programada do equipamento 068', '2026-08-14', 1138.00, 69),
(70, 70, 'Preventiva', 'Manutencao programada do equipamento 069', '2026-09-15', 1179.00, 70),
(71, 71, 'Corretiva', 'Manutencao programada do equipamento 070', '2026-10-16', 1220.00, 71),
(72, 72, 'Preventiva', 'Manutencao programada do equipamento 071', '2026-11-17', 1261.00, 72),
(73, 73, 'Corretiva', 'Manutencao programada do equipamento 072', '2026-12-18', 1302.00, 73),
(74, 74, 'Preventiva', 'Manutencao programada do equipamento 073', '2026-01-19', 1343.00, 74),
(75, 75, 'Corretiva', 'Manutencao programada do equipamento 074', '2026-02-20', 1384.00, 75),
(76, 76, 'Preventiva', 'Manutencao programada do equipamento 075', '2026-03-21', 1425.00, 76),
(77, 77, 'Corretiva', 'Manutencao programada do equipamento 076', '2026-04-22', 1466.00, 77),
(78, 78, 'Preventiva', 'Manutencao programada do equipamento 077', '2026-05-23', 1507.00, 78),
(79, 79, 'Corretiva', 'Manutencao programada do equipamento 078', '2026-06-24', 1548.00, 79),
(80, 80, 'Preventiva', 'Manutencao programada do equipamento 079', '2026-07-25', 1589.00, 80),
(81, 81, 'Corretiva', 'Manutencao programada do equipamento 080', '2026-08-26', 1630.00, 81),
(82, 82, 'Preventiva', 'Manutencao programada do equipamento 081', '2026-09-27', 1671.00, 82),
(83, 83, 'Corretiva', 'Manutencao programada do equipamento 082', '2026-10-01', 1712.00, 83),
(84, 84, 'Preventiva', 'Manutencao programada do equipamento 083', '2026-11-02', 1753.00, 84),
(85, 85, 'Corretiva', 'Manutencao programada do equipamento 084', '2026-12-03', 1794.00, 85),
(86, 86, 'Preventiva', 'Manutencao programada do equipamento 085', '2026-01-04', 1835.00, 86),
(87, 87, 'Corretiva', 'Manutencao programada do equipamento 086', '2026-02-05', 1876.00, 87),
(88, 88, 'Preventiva', 'Manutencao programada do equipamento 087', '2026-03-06', 1917.00, 88),
(89, 89, 'Corretiva', 'Manutencao programada do equipamento 088', '2026-04-07', 158.00, 89),
(90, 90, 'Preventiva', 'Manutencao programada do equipamento 089', '2026-05-08', 199.00, 90),
(91, 91, 'Corretiva', 'Manutencao programada do equipamento 090', '2026-06-09', 240.00, 91),
(92, 92, 'Preventiva', 'Manutencao programada do equipamento 091', '2026-07-10', 281.00, 92),
(93, 93, 'Corretiva', 'Manutencao programada do equipamento 092', '2026-08-11', 322.00, 93),
(94, 94, 'Preventiva', 'Manutencao programada do equipamento 093', '2026-09-12', 363.00, 94),
(95, 95, 'Corretiva', 'Manutencao programada do equipamento 094', '2026-10-13', 404.00, 95),
(96, 96, 'Preventiva', 'Manutencao programada do equipamento 095', '2026-11-14', 445.00, 96),
(97, 97, 'Corretiva', 'Manutencao programada do equipamento 096', '2026-12-15', 486.00, 97),
(98, 98, 'Preventiva', 'Manutencao programada do equipamento 097', '2026-01-16', 527.00, 98),
(99, 99, 'Corretiva', 'Manutencao programada do equipamento 098', '2026-02-17', 568.00, 99),
(100, 100, 'Preventiva', 'Manutencao programada do equipamento 099', '2026-03-18', 609.00, 100),
(1, 1, 'Corretiva', 'Manutencao programada do equipamento 100', '2026-04-19', 650.00, 1);

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
(2, 6, 1, 120.00),
(11, 7, 4, 267.00),
(12, 8, 1, 284.00),
(13, 9, 2, 301.00),
(14, 10, 3, 318.00),
(15, 11, 4, 335.00),
(16, 12, 1, 352.00),
(17, 13, 2, 369.00),
(18, 14, 3, 386.00),
(19, 15, 4, 403.00),
(20, 16, 1, 420.00),
(21, 17, 2, 437.00),
(22, 18, 3, 454.00),
(23, 19, 4, 471.00),
(24, 20, 1, 488.00),
(25, 21, 2, 505.00),
(26, 22, 3, 522.00),
(27, 23, 4, 539.00),
(28, 24, 1, 556.00),
(29, 25, 2, 573.00),
(30, 26, 3, 590.00),
(31, 27, 4, 607.00),
(32, 28, 1, 624.00),
(33, 29, 2, 641.00),
(34, 30, 3, 658.00),
(35, 31, 4, 675.00),
(36, 32, 1, 692.00),
(37, 33, 2, 709.00),
(38, 34, 3, 726.00),
(39, 35, 4, 743.00),
(40, 36, 1, 760.00),
(41, 37, 2, 777.00),
(42, 38, 3, 94.00),
(43, 39, 4, 111.00),
(44, 40, 1, 128.00),
(45, 41, 2, 145.00),
(46, 42, 3, 162.00),
(47, 43, 4, 179.00),
(48, 44, 1, 196.00),
(49, 45, 2, 213.00),
(50, 46, 3, 230.00),
(51, 47, 4, 247.00),
(52, 48, 1, 264.00),
(53, 49, 2, 281.00),
(54, 50, 3, 298.00),
(55, 51, 4, 315.00),
(56, 52, 1, 332.00),
(57, 53, 2, 349.00),
(58, 54, 3, 366.00),
(59, 55, 4, 383.00),
(60, 56, 1, 400.00),
(61, 57, 2, 417.00),
(62, 58, 3, 434.00),
(63, 59, 4, 451.00),
(64, 60, 1, 468.00),
(65, 61, 2, 485.00),
(66, 62, 3, 502.00),
(67, 63, 4, 519.00),
(68, 64, 1, 536.00),
(69, 65, 2, 553.00),
(70, 66, 3, 570.00),
(71, 67, 4, 587.00),
(72, 68, 1, 604.00),
(73, 69, 2, 621.00),
(74, 70, 3, 638.00),
(75, 71, 4, 655.00),
(76, 72, 1, 672.00),
(77, 73, 2, 689.00),
(78, 74, 3, 706.00),
(79, 75, 4, 723.00),
(80, 76, 1, 740.00),
(81, 77, 2, 757.00),
(82, 78, 3, 774.00),
(83, 79, 4, 91.00),
(84, 80, 1, 108.00),
(85, 81, 2, 125.00),
(86, 82, 3, 142.00),
(87, 83, 4, 159.00),
(88, 84, 1, 176.00),
(89, 85, 2, 193.00),
(90, 86, 3, 210.00),
(91, 87, 4, 227.00),
(92, 88, 1, 244.00),
(93, 89, 2, 261.00),
(94, 90, 3, 278.00),
(95, 91, 4, 295.00),
(96, 92, 1, 312.00),
(97, 93, 2, 329.00),
(98, 94, 3, 346.00),
(99, 95, 4, 363.00),
(100, 96, 1, 380.00);

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
VALUES ('Corretiva', 'Troca de rolamento', CURDATE(), 450.00, 1, 2, 3),
(3, 3, 'Corretiva', 'Manutencao programada do equipamento 002', '2026-02-02', 232.00, 3),
(4, 4, 'Preventiva', 'Manutencao programada do equipamento 003', '2026-03-03', 273.00, 4),
(5, 5, 'Corretiva', 'Manutencao programada do equipamento 004', '2026-04-04', 314.00, 5),
(6, 6, 'Preventiva', 'Manutencao programada do equipamento 005', '2026-05-05', 355.00, 6),
(7, 7, 'Corretiva', 'Manutencao programada do equipamento 006', '2026-06-06', 396.00, 7),
(8, 8, 'Preventiva', 'Manutencao programada do equipamento 007', '2026-07-07', 437.00, 8),
(9, 9, 'Corretiva', 'Manutencao programada do equipamento 008', '2026-08-08', 478.00, 9),
(10, 10, 'Preventiva', 'Manutencao programada do equipamento 009', '2026-09-09', 519.00, 10),
(11, 11, 'Corretiva', 'Manutencao programada do equipamento 010', '2026-10-10', 560.00, 11),
(12, 12, 'Preventiva', 'Manutencao programada do equipamento 011', '2026-11-11', 601.00, 12),
(13, 13, 'Corretiva', 'Manutencao programada do equipamento 012', '2026-12-12', 642.00, 13),
(14, 14, 'Preventiva', 'Manutencao programada do equipamento 013', '2026-01-13', 683.00, 14),
(15, 15, 'Corretiva', 'Manutencao programada do equipamento 014', '2026-02-14', 724.00, 15),
(16, 16, 'Preventiva', 'Manutencao programada do equipamento 015', '2026-03-15', 765.00, 16),
(17, 17, 'Corretiva', 'Manutencao programada do equipamento 016', '2026-04-16', 806.00, 17),
(18, 18, 'Preventiva', 'Manutencao programada do equipamento 017', '2026-05-17', 847.00, 18),
(19, 19, 'Corretiva', 'Manutencao programada do equipamento 018', '2026-06-18', 888.00, 19),
(20, 20, 'Preventiva', 'Manutencao programada do equipamento 019', '2026-07-19', 929.00, 20),
(21, 21, 'Corretiva', 'Manutencao programada do equipamento 020', '2026-08-20', 970.00, 21),
(22, 22, 'Preventiva', 'Manutencao programada do equipamento 021', '2026-09-21', 1011.00, 22),
(23, 23, 'Corretiva', 'Manutencao programada do equipamento 022', '2026-10-22', 1052.00, 23),
(24, 24, 'Preventiva', 'Manutencao programada do equipamento 023', '2026-11-23', 1093.00, 24),
(25, 25, 'Corretiva', 'Manutencao programada do equipamento 024', '2026-12-24', 1134.00, 25),
(26, 26, 'Preventiva', 'Manutencao programada do equipamento 025', '2026-01-25', 1175.00, 26),
(27, 27, 'Corretiva', 'Manutencao programada do equipamento 026', '2026-02-26', 1216.00, 27),
(28, 28, 'Preventiva', 'Manutencao programada do equipamento 027', '2026-03-27', 1257.00, 28),
(29, 29, 'Corretiva', 'Manutencao programada do equipamento 028', '2026-04-01', 1298.00, 29),
(30, 30, 'Preventiva', 'Manutencao programada do equipamento 029', '2026-05-02', 1339.00, 30),
(31, 31, 'Corretiva', 'Manutencao programada do equipamento 030', '2026-06-03', 1380.00, 31),
(32, 32, 'Preventiva', 'Manutencao programada do equipamento 031', '2026-07-04', 1421.00, 32),
(33, 33, 'Corretiva', 'Manutencao programada do equipamento 032', '2026-08-05', 1462.00, 33),
(34, 34, 'Preventiva', 'Manutencao programada do equipamento 033', '2026-09-06', 1503.00, 34),
(35, 35, 'Corretiva', 'Manutencao programada do equipamento 034', '2026-10-07', 1544.00, 35),
(36, 36, 'Preventiva', 'Manutencao programada do equipamento 035', '2026-11-08', 1585.00, 36),
(37, 37, 'Corretiva', 'Manutencao programada do equipamento 036', '2026-12-09', 1626.00, 37),
(38, 38, 'Preventiva', 'Manutencao programada do equipamento 037', '2026-01-10', 1667.00, 38),
(39, 39, 'Corretiva', 'Manutencao programada do equipamento 038', '2026-02-11', 1708.00, 39),
(40, 40, 'Preventiva', 'Manutencao programada do equipamento 039', '2026-03-12', 1749.00, 40),
(41, 41, 'Corretiva', 'Manutencao programada do equipamento 040', '2026-04-13', 1790.00, 41),
(42, 42, 'Preventiva', 'Manutencao programada do equipamento 041', '2026-05-14', 1831.00, 42),
(43, 43, 'Corretiva', 'Manutencao programada do equipamento 042', '2026-06-15', 1872.00, 43),
(44, 44, 'Preventiva', 'Manutencao programada do equipamento 043', '2026-07-16', 1913.00, 44),
(45, 45, 'Corretiva', 'Manutencao programada do equipamento 044', '2026-08-17', 154.00, 45),
(46, 46, 'Preventiva', 'Manutencao programada do equipamento 045', '2026-09-18', 195.00, 46),
(47, 47, 'Corretiva', 'Manutencao programada do equipamento 046', '2026-10-19', 236.00, 47),
(48, 48, 'Preventiva', 'Manutencao programada do equipamento 047', '2026-11-20', 277.00, 48),
(49, 49, 'Corretiva', 'Manutencao programada do equipamento 048', '2026-12-21', 318.00, 49),
(50, 50, 'Preventiva', 'Manutencao programada do equipamento 049', '2026-01-22', 359.00, 50),
(51, 51, 'Corretiva', 'Manutencao programada do equipamento 050', '2026-02-23', 400.00, 51),
(52, 52, 'Preventiva', 'Manutencao programada do equipamento 051', '2026-03-24', 441.00, 52),
(53, 53, 'Corretiva', 'Manutencao programada do equipamento 052', '2026-04-25', 482.00, 53),
(54, 54, 'Preventiva', 'Manutencao programada do equipamento 053', '2026-05-26', 523.00, 54),
(55, 55, 'Corretiva', 'Manutencao programada do equipamento 054', '2026-06-27', 564.00, 55),
(56, 56, 'Preventiva', 'Manutencao programada do equipamento 055', '2026-07-01', 605.00, 56),
(57, 57, 'Corretiva', 'Manutencao programada do equipamento 056', '2026-08-02', 646.00, 57),
(58, 58, 'Preventiva', 'Manutencao programada do equipamento 057', '2026-09-03', 687.00, 58),
(59, 59, 'Corretiva', 'Manutencao programada do equipamento 058', '2026-10-04', 728.00, 59),
(60, 60, 'Preventiva', 'Manutencao programada do equipamento 059', '2026-11-05', 769.00, 60),
(61, 61, 'Corretiva', 'Manutencao programada do equipamento 060', '2026-12-06', 810.00, 61),
(62, 62, 'Preventiva', 'Manutencao programada do equipamento 061', '2026-01-07', 851.00, 62),
(63, 63, 'Corretiva', 'Manutencao programada do equipamento 062', '2026-02-08', 892.00, 63),
(64, 64, 'Preventiva', 'Manutencao programada do equipamento 063', '2026-03-09', 933.00, 64),
(65, 65, 'Corretiva', 'Manutencao programada do equipamento 064', '2026-04-10', 974.00, 65),
(66, 66, 'Preventiva', 'Manutencao programada do equipamento 065', '2026-05-11', 1015.00, 66),
(67, 67, 'Corretiva', 'Manutencao programada do equipamento 066', '2026-06-12', 1056.00, 67),
(68, 68, 'Preventiva', 'Manutencao programada do equipamento 067', '2026-07-13', 1097.00, 68),
(69, 69, 'Corretiva', 'Manutencao programada do equipamento 068', '2026-08-14', 1138.00, 69),
(70, 70, 'Preventiva', 'Manutencao programada do equipamento 069', '2026-09-15', 1179.00, 70),
(71, 71, 'Corretiva', 'Manutencao programada do equipamento 070', '2026-10-16', 1220.00, 71),
(72, 72, 'Preventiva', 'Manutencao programada do equipamento 071', '2026-11-17', 1261.00, 72),
(73, 73, 'Corretiva', 'Manutencao programada do equipamento 072', '2026-12-18', 1302.00, 73),
(74, 74, 'Preventiva', 'Manutencao programada do equipamento 073', '2026-01-19', 1343.00, 74),
(75, 75, 'Corretiva', 'Manutencao programada do equipamento 074', '2026-02-20', 1384.00, 75),
(76, 76, 'Preventiva', 'Manutencao programada do equipamento 075', '2026-03-21', 1425.00, 76),
(77, 77, 'Corretiva', 'Manutencao programada do equipamento 076', '2026-04-22', 1466.00, 77),
(78, 78, 'Preventiva', 'Manutencao programada do equipamento 077', '2026-05-23', 1507.00, 78),
(79, 79, 'Corretiva', 'Manutencao programada do equipamento 078', '2026-06-24', 1548.00, 79),
(80, 80, 'Preventiva', 'Manutencao programada do equipamento 079', '2026-07-25', 1589.00, 80),
(81, 81, 'Corretiva', 'Manutencao programada do equipamento 080', '2026-08-26', 1630.00, 81),
(82, 82, 'Preventiva', 'Manutencao programada do equipamento 081', '2026-09-27', 1671.00, 82),
(83, 83, 'Corretiva', 'Manutencao programada do equipamento 082', '2026-10-01', 1712.00, 83),
(84, 84, 'Preventiva', 'Manutencao programada do equipamento 083', '2026-11-02', 1753.00, 84),
(85, 85, 'Corretiva', 'Manutencao programada do equipamento 084', '2026-12-03', 1794.00, 85),
(86, 86, 'Preventiva', 'Manutencao programada do equipamento 085', '2026-01-04', 1835.00, 86),
(87, 87, 'Corretiva', 'Manutencao programada do equipamento 086', '2026-02-05', 1876.00, 87),
(88, 88, 'Preventiva', 'Manutencao programada do equipamento 087', '2026-03-06', 1917.00, 88),
(89, 89, 'Corretiva', 'Manutencao programada do equipamento 088', '2026-04-07', 158.00, 89),
(90, 90, 'Preventiva', 'Manutencao programada do equipamento 089', '2026-05-08', 199.00, 90),
(91, 91, 'Corretiva', 'Manutencao programada do equipamento 090', '2026-06-09', 240.00, 91),
(92, 92, 'Preventiva', 'Manutencao programada do equipamento 091', '2026-07-10', 281.00, 92),
(93, 93, 'Corretiva', 'Manutencao programada do equipamento 092', '2026-08-11', 322.00, 93),
(94, 94, 'Preventiva', 'Manutencao programada do equipamento 093', '2026-09-12', 363.00, 94),
(95, 95, 'Corretiva', 'Manutencao programada do equipamento 094', '2026-10-13', 404.00, 95),
(96, 96, 'Preventiva', 'Manutencao programada do equipamento 095', '2026-11-14', 445.00, 96),
(97, 97, 'Corretiva', 'Manutencao programada do equipamento 096', '2026-12-15', 486.00, 97),
(98, 98, 'Preventiva', 'Manutencao programada do equipamento 097', '2026-01-16', 527.00, 98),
(99, 99, 'Corretiva', 'Manutencao programada do equipamento 098', '2026-02-17', 568.00, 99),
(100, 100, 'Preventiva', 'Manutencao programada do equipamento 099', '2026-03-18', 609.00, 100),
(1, 1, 'Corretiva', 'Manutencao programada do equipamento 100', '2026-04-19', 650.00, 1);

UPDATE ordem
SET status_ordem = 'concluida', data_fechamento = CURDATE()
WHERE id_ordem = 1;

SAVEPOINT update1;

UPDATE maquina
SET status_maquina = 'ativa'
WHERE id_maquina = 3;

ROLLBACK TO update1;

COMMIT;

USE sistema_manutencao;

-- =====================================
-- INDEX E EXPLAIN
-- =====================================

INSERT INTO ordem (descricao_problema, status_ordem, data_abertura, data_fechamento, prioridade)
SELECT 'CARGA_TESTE',
       CASE WHEN n MOD 10 = 0 THEN 'ABERTA'
            WHEN n MOD 10 = 1 THEN 'EM ANDAMENTO'
            WHEN n MOD 10 = 2 THEN 'CANCELADA'
            ELSE 'CONCLUIDA' END,
       DATE_ADD('2026-01-01', INTERVAL (n MOD 300) DAY),
       NULL,
       ELT(((n DIV 10) MOD 4) + 1, 'BAIXA', 'MEDIA', 'ALTA', 'URGENTE')
  FROM (SELECT a.d + b.d*10 + c.d*100 + e.d*1000 AS n
          FROM (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
                UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
               (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
                UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
               (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
                UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c,
               (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
                UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) e
       ) nums;

INSERT INTO manutencao (id_ordem, id_tecnico, tipo_manutencao, descricao, data_manutencao, custo, id_maquina)
SELECT (n MOD 5) + 1,
       (n MOD 5) + 1,
       ELT((n MOD 2) + 1, 'Corretiva', 'Preventiva'),
       'CARGA_TESTE',
       DATE_ADD('2026-01-01', INTERVAL (n MOD 300) DAY),
       100 + (n MOD 900),
       (n MOD 5) + 1
  FROM (SELECT a.d + b.d*10 + c.d*100 + e.d*1000 AS n
          FROM (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
                UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
               (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
                UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
               (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
                UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c,
               (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
                UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) e
       ) nums;

ANALYZE TABLE ordem, manutencao;

-- =====================================
-- CONSULTA 1: ordens urgentes em aberto
-- =====================================

-- EXPLAIN antes do índice
EXPLAIN
SELECT id_ordem, descricao_problema, data_abertura
  FROM ordem
 WHERE status_ordem = 'ABERTA'
   AND prioridade = 'URGENTE';

-- Índice
CREATE INDEX idx_ordem_status_prioridade
    ON ordem (status_ordem, prioridade);

ANALYZE TABLE ordem;

-- EXPLAIN depois do índice
EXPLAIN
SELECT id_ordem, descricao_problema, data_abertura
  FROM ordem
 WHERE status_ordem = 'ABERTA'
   AND prioridade = 'URGENTE';

-- =====================================
-- CONSULTA 2: manutenções de um período
-- =====================================

-- EXPLAIN antes do índice
EXPLAIN
SELECT id_manutencao, descricao, data_manutencao, custo
  FROM manutencao
 WHERE data_manutencao BETWEEN '2026-11-01' AND '2026-11-30';

-- Índice
CREATE INDEX idx_manutencao_data
    ON manutencao (data_manutencao);

ANALYZE TABLE manutencao;

-- EXPLAIN depois do índice
EXPLAIN
SELECT id_manutencao, descricao, data_manutencao, custo
  FROM manutencao
 WHERE data_manutencao BETWEEN '2026-11-01' AND '2026-11-30';

-- =====================================
-- CONSULTA 3: custo total por máquina
-- =====================================

-- EXPLAIN antes do índice
EXPLAIN
SELECT maquina.nome, SUM(manutencao.custo) AS custo_total
  FROM manutencao
  JOIN maquina ON manutencao.id_maquina = maquina.id_maquina
 GROUP BY maquina.nome;

-- Índice
CREATE INDEX idx_manutencao_maquina_custo
    ON manutencao (id_maquina, custo);

ANALYZE TABLE manutencao;

-- EXPLAIN depois do índice
EXPLAIN
SELECT maquina.nome, SUM(manutencao.custo) AS custo_total
  FROM manutencao
  JOIN maquina ON manutencao.id_maquina = maquina.id_maquina
 GROUP BY maquina.nome;

-- Conferir os índices criados
SHOW INDEX FROM ordem;
SHOW INDEX FROM manutencao;
