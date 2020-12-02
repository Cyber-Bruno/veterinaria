use veterinaria;

create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

-- O comando abaixo descreve a tabela
describe tbusuarios;

-- O comando abaixo insere dado na tabela (CRUD)--------------------------------------------------------------
-- Creat -> Insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1, 'José de Assis', '9979-4651', 'joseassis','8647d2');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2, 'Administrador', '9999-0051', 'adm','adm');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3, 'Mario de Santos', '9900-0012', 'mariosantos','mario123');

-- O comando abaixo insere dado na tabela (CRUD)--------------------------------------------------------------
-- read -> Select 
select * from tbusuarios;

-- a linha abaixo modifica dados na tabela (CRUD)--------------------------------------------------------------
-- update -> update
update tbusuarios set fone='8888-8888' where iduser=2;

-- a linha abaixo apaga um registro da tabela (CRUD)--------------------------------------------------------------
-- delete -> delete
delete from tbusuarios where iduser=3;

-- tabela de cadastro ---------------------- -------------
create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);
describe tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values('Linus Torvalds', 'Rua Tus,2015' ,'9999-9999', 'linus@linux.com');
select * from tbclientes;

-- tabela Ordem de Serviço  ---------------------- -------------
create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,

raca varchar(50) not null,
nomedog varchar (50) not null,
sintoma varchar(150) not null,
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);
describe tbos;

insert into tbos (raca, nomedog, sintoma, valor, idcli)
values ('Vira lata', 'Princesa', 'Vomito', 78.54, 1);
select * from tbos;

-- o codigo abaixo traz informações de duas tabelas
select
O.os,raca,nomedog,sintoma,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);