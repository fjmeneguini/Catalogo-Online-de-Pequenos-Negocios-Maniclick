-- Procedure 1: Inserir novo cliente
DELIMITER $$
CREATE PROCEDURE sp_inserir_cliente(IN p_nome VARCHAR(100), IN p_telefone VARCHAR(20), IN p_email VARCHAR(100))
BEGIN
    INSERT INTO cliente (nome, telefone, email) VALUES (p_nome, p_telefone, p_email);
END $$
DELIMITER ;

-- Procedure 2: Cancelar agendamento
DELIMITER $$
CREATE PROCEDURE sp_cancelar_agendamento(IN p_id_agendamento INT)
BEGIN
    UPDATE agendamento SET status = 'Cancelado' WHERE id_agendamento = p_id_agendamento;
END $$
DELIMITER ;

-- Função 1: Calcular total de agendamentos de um cliente
DELIMITER $$
CREATE FUNCTION fn_total_agendamentos_cliente(p_id_cliente INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM agendamento WHERE id_cliente = p_id_cliente;
    RETURN total;
END $$
DELIMITER ;

-- Função 2: Retornar média de avaliações
DELIMITER $$
CREATE FUNCTION fn_media_avaliacoes() RETURNS DECIMAL(3,2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(3,2);
    SELECT AVG(nota) INTO media FROM avaliacao;
    RETURN media;
END $$
DELIMITER ;