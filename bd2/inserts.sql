-- Clientes
INSERT INTO cliente (nome, telefone, email) VALUES
('Ana Paula', '19999999999', 'ana@email.com'),
('Bruna Silva', '19988888888', 'bruna@email.com'),
('Carla Mendes', '19977777777', 'carla@email.com');

-- Serviços
INSERT INTO servico (nome, preco, duracao_minutos) VALUES
('Esmaltação simples', 20.00, 30),
('Francesinha', 25.00, 40),
('Unha decorada', 30.00, 50),
('Pé e mão', 45.00, 60);

-- Agendamentos
INSERT INTO agendamento (id_cliente, id_servico, data, hora, status, observacao) VALUES
(1, 1, '2024-06-10', '10:00', 'Confirmado', ''),
(2, 2, '2024-06-11', '14:00', 'Pendente', 'Cliente pediu francesinha especial'),
(3, 3, '2024-06-12', '16:00', 'Cancelado', 'Cancelado pelo cliente');

-- Avaliações
INSERT INTO avaliacao (id_cliente, nota, comentario, data_avaliacao) VALUES
(1, 5, 'Ótimo atendimento!', '2024-06-10'),
(2, 4, 'Gostei muito!', '2024-06-11');