-- ============================================================
-- PROCEDURES E FUNÇÕES DO BANCO DE DADOS MANICLICK
-- ============================================================

-- ============================================================
-- PROCEDURE: INSERIR NOVO CLIENTE
-- Insere um novo cliente na tabela cliente.
-- ============================================================
DELIMITER $$
CREATE PROCEDURE sp_inserir_cliente(IN p_nome VARCHAR(100), IN p_telefone VARCHAR(20), IN p_email VARCHAR(100))
BEGIN
    INSERT INTO cliente (nome, telefone, email) VALUES (p_nome, p_telefone, p_email);
END $$
DELIMITER ;

-- ============================================================
-- PROCEDURE: CANCELAR AGENDAMENTO
-- Atualiza o status de um agendamento para 'Cancelado'.
-- ============================================================
DELIMITER $$
CREATE PROCEDURE sp_cancelar_agendamento(IN p_id_agendamento INT)
BEGIN
    UPDATE agendamento SET status = 'Cancelado' WHERE id_agendamento = p_id_agendamento;
END $$
DELIMITER ;

-- ============================================================
-- FUNÇÃO: TOTAL DE AGENDAMENTOS DE UM CLIENTE
-- Retorna o total de agendamentos feitos por um cliente.
-- ============================================================
DELIMITER $$
CREATE FUNCTION fn_total_agendamentos_cliente(p_id_cliente INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM agendamento WHERE id_cliente = p_id_cliente;
    RETURN total;
END $$
DELIMITER ;

-- ============================================================
-- FUNÇÃO: MÉDIA DE AVALIAÇÕES
-- Retorna a média das avaliações feitas pelos clientes.
-- ============================================================
DELIMITER $$
CREATE FUNCTION fn_media_avaliacoes() RETURNS DECIMAL(3,2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(3,2);
    SELECT AVG(nota) INTO media FROM avaliacao;
    RETURN media;
END $$
DELIMITER ;