create database invetario_2b1;
use invetario_2b1;
create table fabricantes (
id_fabric int not null primary key,
nome varchar(65) not null,
endereco varchar(150),
tel1 char(14),
tel2 char (14)
);
create table equipamentos(
id_equip int not null primary key,
modelo varchar(20) not null,
num_serie int,
ano_fabric char(4),
id_fabric int,
foreign key (id_fab) references fabricantes (id_fabric)
);
create table software(
id_soft int not null primary key,
nome varchar(20) not null,
versao int,
ano_fabric char(4),
id_fabric int,
foreign key (id_fab) references fabricantes (id_fabric)
);

show tables;
desc fabricantes;
desc equipamentos;
desc software;

-- Usando o comando alter table o nome  do campo ano_fa
alter table equipamentos rename column ano_fabric to data_fabric;
alter table software rename column ano_fabric to data_fabric;

alter table equipamentos modify data_fabric date;
alter table software modify data_fabric date;

alter table software modify versao char(10);

alter table equipamentos modify num_serie varchar(20);

insert into fabricantes (id_fabric, nome, endereco, tel1, tel2)
values
(1, 'Apple', 'Rua da Maçã', '31997894561', '31997894562'),
(2, 'CISCO', 'Rua do Galho', '5512478931', '5512378931'),
(3, 'Oracle', 'Rua do Banco', '9874562133', '9874562132'),
(4, 'Huawei', 'Rua da China', '6548713487', '6548713485'),
(5, 'Microsoft', 'Rua do Gates', '7458794134', '7458794132');
insert into equipamentos (id_equip, modelo, num_serie, data_fabric, id_fab)
values
(1, 'Roteador 4321', 'CISCO4321', '2019-05-05', 2),
(2, 'Switch', 'n9000', '2018-10-01', 4),
(3, 'Switch Nexus', 'nxs9k', '2022-09-01', 2),
(4, 'DWDM', 'DWDM32456', '2021-11-11', 4),
(5, 'Roteador 4431', 'CISCO4431', '2020-12-21', 2);
insert into software (id_soft, nome, versao, data_fabric, id_fab)
values
(1, 'Office 365', '2024', '2024-05-05', 5),
(2, 'Cisco PKT Tracer', '2020', '2020-10-01', 2),
(3, 'Oracle SGBD', 'Pro', '2021-09-01', 3),
(4, 'Windows Server', '2023', '2022-12-12', 5),
(5, 'IOS', '18', '2024-12-21', 1);

-- COnfira o conteúdo da tabela 
select * from fabricantes;
select * from equipamentos;
select * from software;

-- Crie uma consulta para visualizar o nome do fabricante e o nome dos softwares que foram fabricados em 2024
select f.nome as Nome_fabricante, s.nome as Nome_software from fabricantes as f join softwares as s on f.id_fabric = s.id_fab where data_fabric like '2024%';
-- Crie uma consulta para visualizar o nome do fabricante de todos os switchs existentes na tabela equipamentos
select f.nome, modelo from fabricantes as f join equipamentos on f.id_fabric = id_fab where modelo like 'Switch%';

