create database senai_03;

use senai_03;

create table produtos
(
	id_produtos integer primary key,
    nome varchar(100),
    preco numeric
    
);

select *from produtos;

insert into produtos (id_produtos, nome, preco) values
(1,"iphone 14", 5000),
(2,"iphone 13", 4500),
(3,"iphone 12", 3000),
(4,"iphone 11", 2500),
(5,"Galaxy S20", 2000),
(6,"Galaxy S23", 4200),
(7,"LGK10", 800),
(8,"Xiaomi Redmi Note 10", 1800),
(9,"Xiaomi POCO", 2300),
(10,"Iphone 14", 30);

create table pedidos
(
	id_pedidos integer primary key,
    id_produtos integer,
    quantidade integer,
    
    foreign key (id_produtos) references produtos (id_produtos)
);

insert into pedidos (id_pedidos, id_produtos, quantidade) values

(1,1,300),
(2,2,70),
(3,3,150),
(4,4,30),
(5,5,15),
(6,6,48),
(7,7,208),
(8,8,38),
(9,9,62),
(10,10,75);

update produtos set nome="Nokia TIJOLÃO" where id_produtos=10;

select *from produtos;

select *from pedidos;

select nome, preco from produtos inner join pedidos on pedidos.id_produtos=produtos.id_produtos where id_pedidos=7;

/*Faça uma consulta que retorne o id do produto, quantidade e o preço do Iphone 11*/

select  p.nome, p.preco, d.id_produtos, d.quantidade from produtos as p inner join pedidos as d on d.id_produtos=p.id_produtos where p.id_produtos=4;

select *from produtos;

