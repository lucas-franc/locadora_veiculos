create schema veiculos

create table veiculos (
 placa int not null primary key,
 modelo varchar(45),
 cor varchar(45)
);

create table clientes (
 cpf varchar(11) not null primary key,
 nome varchar(45),
 nascimento date
);

create table locacoes (
    codigo int not null primary key auto_increment,
    veiculo_placa int not null,
	FOREIGN KEY (veiculo_placa) REFERENCES veiculos(placa),
   cliente_cpf varchar(11) not null,
    FOREIGN KEY (cliente_cpf) REFERENCES clientes(cpf),
    dias INT,
    valorDiaria DECIMAL(9,2)
);


CREATE VIEW LocacoesVeiculosClientes AS
SELECT l.codigo AS codigo_locacao,
       v.placa AS placa_veiculo,
       v.modelo AS modelo_veiculo,
       v.cor AS cor_veiculo,
       c.cpf AS cpf_cliente,
       c.nome AS nome_cliente,
       c.nascimento AS nascimento_cliente,
       l.dias AS dias_locacao,
       l.valorDiaria AS valor_diaria
FROM locacoes l
INNER JOIN veiculos v ON l.veiculo_placa = v.placa
INNER JOIN clientes c ON l.cliente_cpf = c.cpf;


INSERT INTO veiculos (placa, modelo, cor) VALUES
(1234, 'Gol', 'Preto'),
(5678, 'Uno', 'Branco'),
(9876, 'Corsa', 'Prata');


INSERT INTO clientes (cpf, nome, nascimento) VALUES
('11111111111', 'João da Silva', '1990-05-15'),
('22222222222', 'Maria Oliveira', '1985-10-22'),
('33333333333', 'Pedro Santos', '1995-12-07');


INSERT INTO locacoes (veiculo_placa, cliente_cpf, dias, valorDiaria) VALUES
(1234, '11111111111', 5, 150.00), -- João alugou o Gol por 5 dias
(5678, '22222222222', 3, 120.00), -- Maria alugou o Uno por 3 dias
(9876, '33333333333', 7, 180.00); -- Pedro alugou o Corsa por 7 dias


SELECT * FROM ViewLocacoesVeiculosClientes