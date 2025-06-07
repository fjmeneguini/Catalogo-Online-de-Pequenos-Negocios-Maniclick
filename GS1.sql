-- Criação das tabelas principais

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    duracao_minutos INT NOT NULL
);

CREATE TABLE agendamento (
    id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_servico INT,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Pendente',
    observacao VARCHAR(255),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
);

CREATE TABLE avaliacao (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    comentario VARCHAR(255),
    data_avaliacao DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);