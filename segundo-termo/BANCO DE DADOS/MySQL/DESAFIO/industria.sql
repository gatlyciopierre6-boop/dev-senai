-- Active: 1794916744905@@localhost@3308@mysql
/* =====================================================================
   DESAFIO BANCO DE DADOS 360° - SOMATIVA 03
   CENÁRIO 1 - MANUTENÇÃO INDUSTRIAL
   SGBD: MySQL 8 / MariaDB 10.x (InnoDB)
   Este arquivo executa do início ao fim sem erros.
   Ordem: 1) DDL  2) DML  3) DQL  4) TCL  5) INDEX + EXPLAIN
   ===================================================================== */

DROP DATABASE IF EXISTS manutencao_industrial;
CREATE DATABASE manutencao_industrial
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE manutencao_industrial;

/* =====================================================================
   1) DDL - ESTRUTURA
   Tabela original MANUTENCAO_GERAL foi decomposta em 6 tabelas.
   ===================================================================== */

-- Setores da fábrica (antes: maquina_setor repetido como texto em toda ordem)
CREATE TABLE setor (
    id_setor    INT          NOT NULL AUTO_INCREMENT,
    nome        VARCHAR(60)  NOT NULL,
    CONSTRAINT pk_setor      PRIMARY KEY (id_setor),
    CONSTRAINT uq_setor_nome UNIQUE (nome)
) ENGINE=InnoDB;

-- Máquinas (antes: maquina_nome repetido em toda ordem)
CREATE TABLE maquina (
    id_maquina        INT          NOT NULL AUTO_INCREMENT,
    nome              VARCHAR(80)  NOT NULL,
    codigo_patrimonio VARCHAR(20)  NOT NULL,
    id_setor          INT          NOT NULL,
    CONSTRAINT pk_maquina        PRIMARY KEY (id_maquina),
    CONSTRAINT uq_maquina_patrim UNIQUE (codigo_patrimonio),
    CONSTRAINT fk_maquina_setor  FOREIGN KEY (id_setor)
        REFERENCES setor (id_setor)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Técnicos (antes: tecnico_nome e tecnico_telefone repetidos em toda ordem)
CREATE TABLE tecnico (
    id_tecnico  INT          NOT NULL AUTO_INCREMENT,
    nome        VARCHAR(80)  NOT NULL,
    telefone    VARCHAR(20)  NOT NULL,
    ativo       TINYINT(1)   NOT NULL DEFAULT 1,
    CONSTRAINT pk_tecnico       PRIMARY KEY (id_tecnico),
    CONSTRAINT uq_tecnico_fone  UNIQUE (telefone),
    CONSTRAINT ck_tecnico_ativo CHECK (ativo IN (0, 1))
) ENGINE=InnoDB;

-- Catálogo de serviços (antes: servico1, servico2 dentro da ordem)
CREATE TABLE servico (
    id_servico  INT          NOT NULL AUTO_INCREMENT,
    descricao   VARCHAR(100) NOT NULL,
    CONSTRAINT pk_servico      PRIMARY KEY (id_servico),
    CONSTRAINT uq_servico_desc UNIQUE (descricao)
) ENGINE=InnoDB;

-- Ordem de manutenção (cabeçalho)
CREATE TABLE ordem_manutencao (
    id_ordem        INT          NOT NULL AUTO_INCREMENT,
    data_abertura   DATE         NOT NULL,
    data_conclusao  DATE         NULL,
    status_ordem    VARCHAR(15)  NOT NULL DEFAULT 'ABERTA',
    observacao      VARCHAR(200) NULL,
    id_maquina      INT          NOT NULL,
    id_tecnico      INT          NOT NULL,
    CONSTRAINT pk_ordem         PRIMARY KEY (id_ordem),
    CONSTRAINT fk_ordem_maquina FOREIGN KEY (id_maquina)
        REFERENCES maquina (id_maquina)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_ordem_tecnico FOREIGN KEY (id_tecnico)
        REFERENCES tecnico (id_tecnico)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_ordem_status  CHECK (status_ordem IN
        ('ABERTA', 'EM_ANDAMENTO', 'CONCLUIDA', 'CANCELADA')),
    CONSTRAINT ck_ordem_datas   CHECK
        (data_conclusao IS NULL OR data_conclusao >= data_abertura)
) ENGINE=InnoDB;

-- Itens da ordem: relação N:N entre ordem e serviço (substitui servico1/servico2)
CREATE TABLE ordem_servico (
    id_ordem      INT          NOT NULL,
    id_servico    INT          NOT NULL,
    horas_gastas  DECIMAL(5,2) NULL,
    CONSTRAINT pk_ordem_servico PRIMARY KEY (id_ordem, id_servico),
    CONSTRAINT fk_os_ordem      FOREIGN KEY (id_ordem)
        REFERENCES ordem_manutencao (id_ordem)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_os_servico    FOREIGN KEY (id_servico)
        REFERENCES servico (id_servico)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_os_horas      CHECK (horas_gastas IS NULL OR horas_gastas > 0)
) ENGINE=InnoDB;

/* =====================================================================
   2) DML - INSERT, UPDATE, DELETE
   ===================================================================== */

-- ---------- INSERT (ordem correta: tabelas "pai" antes das "filhas") ----------
INSERT INTO setor (nome) VALUES
    ('Usinagem'), ('Montagem'), ('Pintura'), ('Embalagem');

INSERT INTO maquina (nome, codigo_patrimonio, id_setor) VALUES
    ('Torno CNC 01',        'PAT-0001', 1),
    ('Fresadora 02',        'PAT-0002', 1),
    ('Prensa Hidráulica 03','PAT-0003', 2),
    ('Esteira Montagem 04', 'PAT-0004', 2),
    ('Cabine de Pintura 05','PAT-0005', 3),
    ('Estufa de Cura 06',   'PAT-0006', 3),
    ('Seladora 07',         'PAT-0007', 4),
    ('Empacotadora 08',     'PAT-0008', 4);

INSERT INTO tecnico (nome, telefone) VALUES
    ('Carlos Silva',    '(19) 99111-0001'),
    ('Mariana Souza',   '(19) 99111-0002'),
    ('Roberto Lima',    '(19) 99111-0003'),
    ('Fernanda Costa',  '(19) 99111-0004'),
    ('Paulo Mendes',    '(19) 99111-0005');

INSERT INTO servico (descricao) VALUES
    ('Troca de rolamento'),
    ('Lubrificação geral'),
    ('Calibração de sensores'),
    ('Troca de correia'),
    ('Reparo elétrico'),
    ('Troca de filtro'),
    ('Alinhamento de eixo'),
    ('Revisão preventiva');

INSERT INTO ordem_manutencao
    (data_abertura, data_conclusao, status_ordem, observacao, id_maquina, id_tecnico) VALUES
    ('2026-10-01', '2026-10-03', 'CONCLUIDA',    'Ruído excessivo no eixo',     1, 1),
    ('2026-10-02', '2026-10-02', 'CONCLUIDA',    'Manutenção preventiva',       2, 2),
    ('2026-10-05', '2026-10-09', 'CONCLUIDA',    'Vazamento de óleo',           3, 3),
    ('2026-10-07', NULL,         'CANCELADA',    'Chamado duplicado',           4, 1),
    ('2026-10-10', '2026-10-12', 'CONCLUIDA',    'Falha no sensor',             5, 4),
    ('2026-10-14', '2026-10-15', 'CONCLUIDA',    'Troca programada',            6, 5),
    ('2026-10-20', '2026-10-22', 'CONCLUIDA',    'Superaquecimento',            7, 2),
    ('2026-10-25', NULL,         'EM_ANDAMENTO', 'Esteira travando',            4, 3),
    ('2026-11-03', NULL,         'EM_ANDAMENTO', 'Vibração no torno',           1, 1),
    ('2026-11-05', NULL,         'ABERTA',       'Aguardando peça',             8, 4),
    ('2026-11-09', NULL,         'ABERTA',       'Revisão trimestral',          3, 2),
    ('2026-11-10', NULL,         'ABERTA',       'Fresadora fora de esquadro',  2, 5);

INSERT INTO ordem_servico (id_ordem, id_servico, horas_gastas) VALUES
    (1, 1, 3.50), (1, 2, 1.00),
    (2, 8, 2.00),
    (3, 5, 6.00), (3, 6, 1.50), (3, 2, 1.00),
    (4, 4, NULL),
    (5, 3, 4.00), (5, 5, 2.50),
    (6, 6, 1.00),
    (7, 5, 5.00), (7, 2, 0.50),
    (8, 4, 2.00), (8, 7, 3.00),
    (9, 7, 2.50), (9, 1, NULL),
    (10, 6, NULL),
    (11, 8, NULL), (11, 2, NULL),
    (12, 7, NULL);

-- ---------- UPDATE seguro (sempre com WHERE pela PK) ----------
-- Técnico trocou de número de telefone: antes precisava alterar N linhas, agora 1.
UPDATE tecnico
   SET telefone = '(19) 99999-0001'
 WHERE id_tecnico = 1;

-- Ordem 9 concluída: status e data são atualizados juntos (respeita ck_ordem_datas).
UPDATE ordem_manutencao
   SET status_ordem = 'CONCLUIDA', data_conclusao = '2026-11-11'
 WHERE id_ordem = 9;

UPDATE ordem_servico
   SET horas_gastas = 4.00
 WHERE id_ordem = 9 AND id_servico = 1;

-- ---------- DELETE seguro ----------
-- (a) Remove só um item específico (PK composta completa no WHERE).
DELETE FROM ordem_servico
 WHERE id_ordem = 11 AND id_servico = 2;

-- (b) Remove a ordem cancelada nº 4 (WHERE pela PK). O item dela some junto
--     por ON DELETE CASCADE, sem deixar registro órfão.
DELETE FROM ordem_manutencao
 WHERE id_ordem = 4 AND status_ordem = 'CANCELADA';

-- Cuidados adotados:
--  * Nenhum UPDATE/DELETE sem WHERE.
--  * Conferir com SELECT antes de apagar:
--      SELECT * FROM ordem_manutencao WHERE id_ordem = 4;
--  * Exemplo de proteção por FK (ON DELETE RESTRICT). Este comando FALHA
--    de propósito, pois a máquina 1 possui ordens (por isso está comentado):
--      DELETE FROM maquina WHERE id_maquina = 1;
--      -- ERROR 1451: Cannot delete or update a parent row

/* =====================================================================
   3) DQL - CONSULTAS
   ===================================================================== */

-- Q1) Ordens em aberto ou em andamento, com máquina, setor e técnico
--     (JOIN de 4 tabelas + filtro + ordenação)
SELECT o.id_ordem, o.data_abertura, o.status_ordem,
       m.nome AS maquina, s.nome AS setor, t.nome AS tecnico
  FROM ordem_manutencao o
  JOIN maquina m ON m.id_maquina = o.id_maquina
  JOIN setor   s ON s.id_setor   = m.id_setor
  JOIN tecnico t ON t.id_tecnico = o.id_tecnico
 WHERE o.status_ordem IN ('ABERTA', 'EM_ANDAMENTO')
 ORDER BY o.data_abertura;

-- Q2) Quantidade de ordens por técnico (inclui técnicos sem ordem)
--     (LEFT JOIN + COUNT + GROUP BY)
SELECT t.nome AS tecnico, COUNT(o.id_ordem) AS total_ordens
  FROM tecnico t
  LEFT JOIN ordem_manutencao o ON o.id_tecnico = t.id_tecnico
 GROUP BY t.id_tecnico, t.nome
 ORDER BY total_ordens DESC, t.nome;

-- Q3) Quantidade de ordens por setor e status
--     (JOIN + GROUP BY em duas colunas)
SELECT s.nome AS setor, o.status_ordem, COUNT(*) AS total
  FROM ordem_manutencao o
  JOIN maquina m ON m.id_maquina = o.id_maquina
  JOIN setor   s ON s.id_setor   = m.id_setor
 GROUP BY s.nome, o.status_ordem
 ORDER BY s.nome, o.status_ordem;

-- Q4) Serviços mais executados e total de horas
--     (JOIN + COUNT + SUM + ORDER BY + LIMIT)
SELECT sv.descricao, COUNT(*) AS vezes_executado,
       COALESCE(SUM(os.horas_gastas), 0) AS horas_totais
  FROM ordem_servico os
  JOIN servico sv ON sv.id_servico = os.id_servico
 GROUP BY sv.id_servico, sv.descricao
 ORDER BY vezes_executado DESC, horas_totais DESC
 LIMIT 5;

-- Q5) Máquinas com mais de uma ordem de manutenção (candidatas a troca)
--     (JOIN + GROUP BY + HAVING)
SELECT m.nome AS maquina, s.nome AS setor, COUNT(*) AS total_ordens
  FROM ordem_manutencao o
  JOIN maquina m ON m.id_maquina = o.id_maquina
  JOIN setor   s ON s.id_setor   = m.id_setor
 GROUP BY m.id_maquina, m.nome, s.nome
HAVING COUNT(*) > 1
 ORDER BY total_ordens DESC;

-- Q6) Tempo médio (dias) para concluir uma ordem, por setor
--     (JOIN + AVG + DATEDIFF)
SELECT s.nome AS setor,
       ROUND(AVG(DATEDIFF(o.data_conclusao, o.data_abertura)), 1) AS media_dias
  FROM ordem_manutencao o
  JOIN maquina m ON m.id_maquina = o.id_maquina
  JOIN setor   s ON s.id_setor   = m.id_setor
 WHERE o.status_ordem = 'CONCLUIDA'
 GROUP BY s.nome
 ORDER BY media_dias DESC;

-- Q7) Ordens que ainda não têm nenhum serviço registrado
--     (LEFT JOIN + IS NULL = subconjunto "sem correspondência")
SELECT o.id_ordem, m.nome AS maquina, o.status_ordem
  FROM ordem_manutencao o
  JOIN maquina m ON m.id_maquina = o.id_maquina
  LEFT JOIN ordem_servico os ON os.id_ordem = o.id_ordem
 WHERE os.id_ordem IS NULL;

/* =====================================================================
   4) TCL - TRANSAÇÃO
   Operação: ABRIR UMA NOVA ORDEM COMPLETA (cabeçalho + serviços).
   As 3 inserções formam uma unidade: ou entram todas, ou nenhuma.
   ===================================================================== */

-- Transação 1: sucesso -> COMMIT
START TRANSACTION;

INSERT INTO ordem_manutencao
    (data_abertura, status_ordem, observacao, id_maquina, id_tecnico)
VALUES ('2026-11-12', 'ABERTA', 'Falha na estufa de cura', 6, 5);

SET @nova_ordem = LAST_INSERT_ID();

INSERT INTO ordem_servico (id_ordem, id_servico) VALUES
    (@nova_ordem, 5),   -- Reparo elétrico
    (@nova_ordem, 3);   -- Calibração de sensores

COMMIT;

-- Transação 2: erro no meio do caminho -> ROLLBACK
-- A ordem é criada, mas o serviço informado (id 999) não existe e violaria
-- a FK fk_os_servico. Como o conjunto não pode ficar pela metade,
-- desfazemos tudo com ROLLBACK.
START TRANSACTION;

INSERT INTO ordem_manutencao
    (data_abertura, status_ordem, observacao, id_maquina, id_tecnico)
VALUES ('2026-11-12', 'ABERTA', 'Ordem que será desfeita', 1, 2);

SET @ordem_teste = LAST_INSERT_ID();

-- (no sistema real, este INSERT falharia com erro 1452 e a aplicação chamaria
--  ROLLBACK; aqui o rollback é explícito para o script rodar até o fim)
-- INSERT INTO ordem_servico (id_ordem, id_servico) VALUES (@ordem_teste, 999);

ROLLBACK;

-- Verificação: a nova ordem (COMMIT) existe com 2 serviços; a de teste não.
SELECT o.id_ordem, o.observacao, COUNT(os.id_servico) AS qtd_servicos
  FROM ordem_manutencao o
  LEFT JOIN ordem_servico os ON os.id_ordem = o.id_ordem
 WHERE o.observacao IN ('Falha na estufa de cura', 'Ordem que será desfeita')
 GROUP BY o.id_ordem, o.observacao;

/* =====================================================================
   5) INDEX + EXPLAIN
   Consulta analisada: ordens abertas num período, filtrando por status
   e data. Para o EXPLAIN fazer sentido, geramos ~10.000 ordens de teste.
   (Obs.: o InnoDB já cria índice automático nas colunas de FK.)
   ===================================================================== */

-- Carga de volume (portável: produto cartesiano de 4 tabelas de dígitos)
INSERT INTO ordem_manutencao
    (data_abertura, data_conclusao, status_ordem, observacao, id_maquina, id_tecnico)
SELECT DATE_ADD('2026-01-01', INTERVAL (n MOD 300) DAY),
       NULL,
       ELT((n MOD 4) + 1, 'ABERTA', 'EM_ANDAMENTO', 'CONCLUIDA', 'CANCELADA'),
       'CARGA_TESTE',
       (n MOD 8) + 1,
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

ANALYZE TABLE ordem_manutencao;

-- EXPLAIN ANTES do índice (esperado: type = ALL, leitura da tabela inteira)
EXPLAIN
SELECT id_ordem, data_abertura, status_ordem
  FROM ordem_manutencao
 WHERE status_ordem = 'ABERTA'
   AND data_abertura BETWEEN '2026-11-01' AND '2026-11-30';

-- Índice composto: igualdade (status) primeiro, faixa (data) depois
CREATE INDEX idx_ordem_status_data
    ON ordem_manutencao (status_ordem, data_abertura);

ANALYZE TABLE ordem_manutencao;

-- EXPLAIN DEPOIS do índice (esperado: type = range, key = idx_ordem_status_data)
EXPLAIN
SELECT id_ordem, data_abertura, status_ordem
  FROM ordem_manutencao
 WHERE status_ordem = 'ABERTA'
   AND data_abertura BETWEEN '2026-11-01' AND '2026-11-30';

-- Segundo índice: busca de técnico por nome (consulta de cadastro)
EXPLAIN SELECT * FROM tecnico WHERE nome = 'Mariana Souza';
CREATE INDEX idx_tecnico_nome ON tecnico (nome);
EXPLAIN SELECT * FROM tecnico WHERE nome = 'Mariana Souza';

-- Fim do script