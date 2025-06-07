-- Listar todos os agendamentos futuros
SELECT a.id_agendamento, c.nome AS cliente, s.nome AS servico, a.data, a.hora, a.status
FROM agendamento a
JOIN cliente c ON a.id_cliente = c.id_cliente
JOIN servico s ON a.id_servico = s.id_servico
WHERE a.data >= CURDATE();

-- Listar clientes e suas avaliações
SELECT c.nome, a.nota, a.comentario
FROM avaliacao a
JOIN cliente c ON a.id_cliente = c.id_cliente;

-- Serviços mais agendados
SELECT s.nome, COUNT(*) AS total_agendamentos
FROM agendamento a
JOIN servico s ON a.id_servico = s.id_servico
GROUP BY s.nome
ORDER BY total_agendamentos DESC;

-- Agendamentos por status
SELECT status, COUNT(*) AS quantidade
FROM agendamento
GROUP BY status;