-- Trigger 1: Ao inserir avaliação, garantir nota entre 1 e 5
DELIMITER $$
CREATE TRIGGER trg_valida_nota_avaliacao
BEFORE INSERT ON avaliacao
FOR EACH ROW
BEGIN
    IF NEW.nota < 1 OR NEW.nota > 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nota deve ser entre 1 e 5';
    END IF;
END $$
DELIMITER ;

-- Trigger 2: Ao cancelar agendamento, registrar observação
DELIMITER $$
CREATE TRIGGER trg_cancelar_agendamento
BEFORE UPDATE ON agendamento
FOR EACH ROW
BEGIN
    IF NEW.status = 'Cancelado' AND OLD.status <> 'Cancelado' THEN
        SET NEW.observacao = CONCAT(OLD.observacao, ' [Cancelado em ', NOW(), ']');
    END IF;
END $$
DELIMITER ;