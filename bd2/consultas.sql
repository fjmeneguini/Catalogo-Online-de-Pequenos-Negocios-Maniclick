-- ============================================================
-- CONSULTAS SQL DO SISTEMA MANICLICK
-- ============================================================
-- Este arquivo contém consultas úteis para relatórios e análises
-- do sistema de agendamento e avaliações do ManiClick.
-- ============================================================

-- ============================================================
-- LISTAR TODOS OS AGENDAMENTOS FUTUROS
-- Mostra os agendamentos a partir da data atual, com cliente e serviço.
-- ============================================================
SELECT a.id_agendamento, c.nome AS cliente, s.nome AS servico, a.data, a.hora, a.status
FROM agendamento a
JOIN cliente c ON a.id_cliente = c.id_cliente
JOIN servico s ON a.id_servico = s.id_servico
WHERE a.data >= CURDATE();

-- ============================================================
-- LISTAR CLIENTES E SUAS AVALIAÇÕES
-- Exibe o nome do cliente, nota e comentário de cada avaliação.
-- ============================================================
SELECT c.nome, a.nota, a.comentario
FROM avaliacao a
JOIN cliente c ON a.id_cliente = c.id_cliente;

-- ============================================================
-- SERVIÇOS MAIS AGENDADOS
-- Mostra a quantidade de agendamentos por serviço, em ordem decrescente.
-- ============================================================
SELECT s.nome, COUNT(*) AS total_agendamentos
FROM agendamento a
JOIN servico s ON a.id_servico = s.id_servico
GROUP BY s.nome
ORDER BY total_agendamentos DESC;

-- ============================================================
-- AGENDAMENTOS POR STATUS
-- Conta quantos agendamentos existem para cada status.
-- ============================================================
SELECT status, COUNT(*) AS quantidade
FROM agendamento
GROUP BY status;