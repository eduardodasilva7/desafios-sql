drop database dbCds;

create database dbCds; 

use dbCds;

create table tbArtistas(
    codArt int not null auto_increment,
    nomeArt varchar(100) not null unique,
    primary key(codArt)
);

create table tbGravadoras (
    codGrav int not null auto_increment,
    nomeGrav varchar(50) not null unique,
    primary key(codGrav)
);

create table tbCategorias(
    codCat int not null auto_increment,
    nomeCat varchar(50) not null unique,
    primary key(codCat)
);

create table tbEstados(
    siglaEst char(2) not null,
    nomeEst varchar(50) not null unique,
    primary key(siglaEst)
);

create table tbCidades(
    codCid int not null auto_increment,
    siglaEst char(2) not null,
    nomeCid varchar(50) not null,
    primary key(codCid),
    foreign key(siglaEst) references tbEstados(siglaEst)
);

create table tbClientes(
    codCli int not null auto_increment,
    codCid int not null,
    nomeCli varchar(50) not null,
    endCli varchar(100) not null,
    rendaCli decimal(9,2) not null default 0 check(rendaCli >= 0),
    sexoCli char(1) not null default 'F' check(sexoCli in ('F','M')),
    primary key(codCli),
    foreign key(codCid) references tbCidades(codCid)
);

create table tbConjuge(
    codConj int not null auto_increment,
    codCli int not null,
    nomeConj varchar(50) not null,
    rendaConj decimal(9,2) not null default 0 check(rendaConj >= 0),
    sexoConj char(1) not null default 'F' check(sexoConj in ('F','M')),
    primary key(codConj),
    foreign key(codCli) references tbClientes(codCli)
);

create table tbFuncionarios(
    codFunc int not null auto_increment,
    nomeFunc varchar(50) not null,
    endFunc varchar(100) not null,
    salFunc decimal(9,2) not null default 0 check(salFunc >= 0),
    sexoFun char(1) not null default 'F' check(sexoFun in('F','M')),
    primary key(codFunc)
);

create table tbDependentes(
    codDep int not null auto_increment,
    codFunc int not null,
    nomeDep varchar(100) not null,
    sexoDep char(1) not null default 'F' check(sexoDep in('F','M')),
    primary key (codDep),
    foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulos(
    codTit int not null auto_increment,
    codCat int not null,
    codGrav int not null,
    nomeCd varchar(50) not null unique,
    valCd decimal(9,2) not null unique default 0 check(valCd > 0),
    qtdEstq int not null default 0 check(qtdEstq >= 0),
    primary key(codTit),
    foreign key(codCat) references tbCategorias(codCat),
    foreign key(codGrav) references tbGravadoras(codGrav)
);

create table tbPedidos(
    numPed int not null,
    codCli int not null,
    codFunc int not null,
    dataPed datetime not null,
    valPed decimal(9,2) not null default 0 check(valPed >= 0),
    primary key(numPed),
    foreign key(codCli) references tbClientes(codCLi),
    foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulosPedido(
    numPed int not null,
    codTit int not null,
    qtdCd int not null check(qtdCd >= 1),
    valCd decimal(9,2) not null check(valCd >= 0),
    foreign key(numPed) references tbPedidos(numPed),
    foreign key(codTit) references tbTitulos(codTit)
);

create table tbTitulosArtistas(
    codTit int not null,
    codArt int not null,
    foreign key(codTit) references tbTitulos(codTit),
    foreign key(codArt) references tbArtistas(codArt)
);

--INSERT 
insert into tbArtistas(nomeArt) values('Marisa Monte');
insert into tbArtistas(nomeArt) values('Gilberto Gil');
insert into tbArtistas(nomeArt) values('Caertano Veloso');
insert into tbArtistas(nomeArt) values('Milton Nascimento');
insert into tbArtistas(nomeArt) values('Legião Urbana');
insert into tbArtistas(nomeArt) values('The Beatles');
insert into tbArtistas(nomeArt) values('Rita Lee');

insert into tbGravadoras(nomeGrav) values('PolyGram');
insert into tbGravadoras(nomeGrav) values('Emi');
insert into tbGravadoras(nomeGrav) values('Som Livre');
insert into tbGravadoras(nomeGrav) values('Som Music');

insert into tbCategorias(nomeCat) values('MPB');
insert into tbCategorias(nomeCat) values('Trilho Sonoro');
insert into tbCategorias(nomeCat) values('Rock Internacional');
insert into tbCategorias(nomeCat) values('Rock Nacional');

insert into tbEstados(siglaEst, nomeEst) values('SP', 'São Paulo');
insert into tbEstados(siglaEst, nomeEst) values('MG', 'Minas Gerais');
insert into tbEstados(siglaEst, nomeEst) values('RJ', 'Rio de Janeiro');
insert into tbEstados(siglaEst, nomeEst) values('ES', 'Vitória');

insert into tbCidades(siglaEst, nomeCid) values('SP', 'São Paulo');
insert into tbCidades(siglaEst, nomeCid) values('SP', 'Sorocaba');
insert into tbCidades(siglaEst, nomeCid) values('SP', 'Jundiaí');
insert into tbCidades(siglaEst, nomeCid) values('SP', 'Americana');
insert into tbCidades(siglaEst, nomeCid) values('SP', 'Araraquara');
insert into tbCidades(siglaEst, nomeCid) values('MG', 'Ouro Preto');
insert into tbCidades(siglaEst, nomeCid) values('ES', 'Cachoeira do Itapemirim');

insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(1, 'José Nougeira', 'Rua A', 1500.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(1, 'Ângelo Perreira', 'Rua B', 2000.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(1, 'Além Mar Paranhos', 'Rua C', 1500.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(1, 'Catarina Souza', 'Rua D', 892.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(1, 'Vagner Costa', 'Rua E', 950.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(2, 'Antenor da Costa', 'Rua F', 1582.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(2, 'Mari Amélia de Souza', 'Rua G', 1152.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(2, 'Paulo Roberto Silva', 'Rua H', 3250.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(3, 'Fátima Souza', 'Rua I', 1632.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values(3, 'Joel da Rocha', 'Rua J', 2000.00, 'M');

insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj) values(1, 'Carla Nogueira', 2500.00, 'F');
insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj) values(2, 'Emilia Pereira', 5500.00, 'F');
insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj) values(6, 'Altiva da Costa', 3000.00, 'F');
insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj) values(7, 'Carlos de Souza', 3250.00, 'M');

insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFun) values('Vânia Gabriel Pereira', 'Rua A', 2500.00, 'F');
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFun) values('Norberto Pereira da Silva', 'Rua B', 300.00, 'M');
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFun) values('Olavo Linhares', 'Rua C', 580.00, 'M');
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFun) values('Paula da Silva', 'Rua D', 3000.00, 'F');
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFun) values('Rolando Rocha', 'Rua R', 2000.00, 'M');

insert into tbDependentes(codFunc, nomeDep, sexoDep) values(1, 'Ana Pereira', 'F');
insert into tbDependentes(codFunc, nomeDep, sexoDep) values(1, 'Roberto Pereira', 'M');
insert into tbDependentes(codFunc, nomeDep, sexoDep) values(1, 'Celso Pereira', 'M');
insert into tbDependentes(codFunc, nomeDep, sexoDep) values(3, 'Brisa Linhares', 'F');
insert into tbDependentes(codFunc, nomeDep, sexoDep) values(3, 'Mari Sol Linhares', 'F');
insert into tbDependentes(codFunc, nomeDep, sexoDep) values(6, 'Sonia da Silva', 'F');

insert into tbTitulos(codCat, codGrav, nomeCd, valCd, qtdEstq) values(1, 1, 'Tribalistas', 30.00, 1500);
 
select * from tbArtistas;
select * from tbGravadoras;
select * from tbCategorias;
select * from tbEstados;
select * from tbCidades;
select * from tbClientes;
select * from tbConjuge;
select * from tbFuncionarios;
select * from tbDependentes;
select * from tbTitulos;
