drop database dbdesafio2;

create database dbdesafio2;

use dbdesafio2;

create table tbGenero(
    idGenero int not null auto_increment,
    descricao varchar(100),
    primary key(idGenero)
);

create table tbAutor(
    idAutor int not null auto_increment,
    nome varchar(100),
    email varchar(100),
    primary key(idAutor) 
);

create table tbCliente(
    idCliente int not null auto_increment,
    nome varchar(100),
    telefone varchar(45),
    primary key(idCliente)
);


create table tbLivro(
    idLivro int not null auto_increment,
    titulo varchar(100),
    preco float,
    estoque int,
    idGenero int,
    primary key(idLivro),
    foreign key(idGenero) references tbGenero(idGenero)
);

create table tbEscreve(
    idLivro int,
    idAutor int,
    foreign key(idLivro) references tbLivro(idLivro),
    foreign key(idAutor) references tbAutor(idAutor)
);

create table tbVenda(
    idVenda int not null auto_increment,
    data date,
    total float,
    idCliente int,
    primary key(idVenda),
    foreign key(idCliente) references tbCliente(idCliente)
);

create table tbItens_da_venda(
    idVenda int,
    idLivro int,
    qtd int, 
    subtotal varchar(45),
    foreign key(idVenda) references tbVenda(idVenda),
    foreign key(idLivro) references tbLivro(idLivro)
);

desc tbGenero;
desc tbLivro;
desc tbEscreve;
desc tbAutor;
desc tbItens_da_venda;
desc tbVenda;
desc tbCliente;