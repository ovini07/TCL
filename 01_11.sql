create database bd_exporta;
use bd_exporta;

Create table departamento (
id int primary key auto_increment not null,
nome varchar(50),
localizacao varchar(50),
orcamento decimal(10,2)
);

insert into departamento (nome, localizacao, orcamento) values
('Recursos Humanos', 'São Paulo', 100000.00),
('Financeiro', 'Rio de Janeiro', 250000.00),
('Tecnologia', 'Belo Horizonte', 500000.00),
('Marketing', 'Curitiba', 150000.00),
('Vendas', 'Porto Alegre', 300000.00);

select * from departamento
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

show variables like 'secure_file_priv';

delete from departamento
where id=5;


load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
into table departamento
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

start transaction;
	update departamento set orcamento = orcamento + 1000.00 where nome = 'TI';
    
    update departamento set orcamento = orcamento + 1000.00 where nome = 'Financeiro';
    commit;