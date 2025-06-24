-- ============================================================
-- VIEWS DO BANCO DE DADOS MANICLICK
-- ============================================================

-- ============================================================
-- View 1: Agendamentos detalhados
-- Exibe informações completas de cada agendamento, incluindo cliente e serviço.
-- ============================================================
CREATE VIEW vw_agendamentos_detalhados AS
SELECT a.id_agendamento, c.nome AS cliente, s.nome AS servico, a.data, a.hora, a.status
FROM agendamento a
JOIN cliente c ON a.id_cliente = c.id_cliente
JOIN servico s ON a.id_servico = s.id_servico;

-- ============================================================
-- View 2: Clientes com avaliações
-- Lista todos os clientes e suas avaliações, se houver.
-- ============================================================
CREATE VIEW vw_clientes_avaliacoes AS
SELECT c.nome, a.nota, a.comentario
FROM cliente c
LEFT JOIN avaliacao a ON c.id_cliente = a.id_cliente;

-- ============================================================
-- View 3: Serviços populares
-- Mostra a quantidade de agendamentos para cada serviço.
-- ============================================================
CREATE VIEW vw_servicos_populares AS
SELECT s.nome, COUNT(a.id_agendamento) AS total
FROM servico s
LEFT JOIN agendamento a ON s.id_servico = a.id_servico
GROUP BY s.nome;

-- ============================================================
-- View 4: Próximos agendamentos confirmados
-- Exibe os agendamentos confirmados a partir da data atual.
-- ============================================================
CREATE VIEW vw_proximos_confirmados AS
SELECT a.*, c.nome AS cliente, s.nome AS servico
FROM agendamento a
JOIN cliente c ON a.id_cliente = c.id_cliente
JOIN servico s ON a.id_servico = s.id_servico
WHERE a.status = 'Confirmado' AND a.data >= CURDATE();