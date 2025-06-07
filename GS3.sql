-- Exemplo de transação: inserir cliente e agendamento juntos

START TRANSACTION;

INSERT INTO cliente (nome, telefone, email) VALUES ('João Teste', '19912345678', 'joao@email.com');
SET @id_cliente = LAST_INSERT_ID();

INSERT INTO agendamento (id_cliente, id_servico, data, hora, status)
VALUES (@id_cliente, 1, '2024-06-15', '15:00', 'Confirmado');

COMMIT;