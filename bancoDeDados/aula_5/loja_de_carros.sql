create database loja_de_carros;

use loja_de_carros;

create table Carros 
(
	ID integer primary key NOT NULL,
	Nome varchar(150) NOT NULL,
    Descricao varchar(200),
    Preco float(15) NOT NULL,
    Categoria varchar (150) NOT NULL,
    Quantidade_em_Estoque int NOT NULL
);

insert into Carros (ID, Nome, Descricao, Preco, Categoria, Quantidade_em_Estoque) values
(1, "Prisma LT", "Carro Seminovo. Único dono.", 48000, "Sedan", 47),
(2, "Uno Ways", "Carro Seminovo. Único dono.", 35000, "Hatch", 50),
(3, "Onix Plus", "Carro Usado. Único dono.", 40000, "Sedan", 84),
(4, "Corolla", "Carro Seminovo. Segundo dono.", 65000, "Sedan", 59),
(5, "HB20", "Carro 0 quilômetro.", 58000, "Sedan", 60);

insert into Carros (ID, Nome, Descricao, Preco, Categoria, Quantidade_em_Estoque) values
(6, "ECHO Esport", "Carro com 10 quilômetro rodados.", 28000, "Hatch", 60);

insert into carros (ID, Nome, Descricao, Preco, Categoria, Quantidade_em_Estoque) values
(7, "Celta", "Carro com 17 quilômetro rodados.", 8000, "Hatch", 37),
(8, "Honda Fit", "Carro com 20 quilômetro rodados.", 48000, "Sedan", 52);


create table Clientes
(
	ID integer primary key NOT NULL,
    Nome varchar(150) NOT NULL,
    CPF varchar(14) NOT NULL,
    Endereco varchar(200) NOT NULL,
    Telefone varchar(15) NOT NULL,
    Email varchar (200) NOT NULL
);

/*alter table Clientes change CPF CPF varchar(14);
alter table Clientes change Telefone Telefone varchar(15);
alter table Clientes change Endereço Endereco varchar(200);*/

insert into Clientes (ID, Nome, CPF, Endereco, Telefone, Email) values
(1, "Rogério da Silva Alcantara", "165.546.357-68", "Alameda Victorino Ribeiro 48,  São Paulo, São Paulo", "(11)95142-4516", "rogerioalcantara@gmail.com"),
(2, "Marcel Neves Teixeira", "398.135.464-05", "Avenida Brasil 56, São Paulo, São Paulo", "(11)94134-3513", "marceltexeira@gmail.com"),
(3, "Vitor Santana de Jesus", "178.818.345-93", "Alameda Rogério Ceni 15,  São Paulo, São Paulo", "(11)93543-3153", "vitodejesus@gmail.com"),
(4, "Fernando Leonid Careaga Camelo", "387.864.964-84", "Avenida Paulista 46,  São Paulo, São Paulo", "(11)93798-4165", "fernadoLeonid@gmail.com"),
(5, "Bruno Gomes da Silva", "256.876.138-43", "Rua José Ribeiro 22,  São Paulo, São Paulo", "(11)96251-3843", "brunosilva@gmail.com"),
(6, "Celso Marcos Furtado", "135.783.527-84", "Rua Gustavo Tomaz Junior,  São Paulo, São Paulo", "(11)96546-3843", "celso@celso.dev.br");

insert into Clientes (ID, Nome, CPF, Endereco, Telefone, Email) values
(7, "Nicolas Petri", "465.684.841-23", "Rua Rui Barbosa,  São Paulo, São Paulo", "(11)96546-3843", "nvpetri@gmail.com"),
(8, "Marcos Araujo", "321.395.536-75", "Rua Marechal Deodoro,  São Paulo, São Paulo", "(11)96168-4841", "marcos80lh@gmail.com"),
(9, "André Ribeiro", "437.835.184-36", "Avenida Rui Barbosa, São Paulo, Carapicuíba", "(11)95616-5862", "andre.ribeiro@uol.com");

create table Compras 
(
	ID integer primary key NOT NULL,
    Cliente_ID integer NOT NULL,
    Data_da_Compra varchar(10) NOT NULL,
    Total_da_Compra numeric(20) NOT NULL,
    
    foreign key (Cliente_ID) references Clientes (ID)
);

insert into Compras(ID, Cliente_ID, Data_da_Compra, Total_da_Compra) values
(1,1,"25/04/2012",48000),
(2,2,"05/09/2021",35000),
(3,3,"4/04/2024",40000),
(4,4,"31/06/2012",65000),
(5,5,"09/10/2012",58000),
(6,6,"22/11/2012",28000);

insert into compras (ID, Cliente_ID, Data_da_Compra, Total_da_Compra) values
(7,7,"25/04/2011",28000),
(8,8,"04/04/2008",28000);

create table carros_Compra
(
	ID integer primary key NOT NULL,
    Compra_ID integer NOT NULL,
    Carro_ID integer NOT NULL,
    Quantidade int NOT NULL,
    Subtotal numeric (20) NOT NULL,
    
    foreign key (Compra_ID) references Compras (ID),
    foreign key (Carro_ID) references Carros (ID)
);

insert into carros_Compra (ID, Compra_ID, Carro_ID, Quantidade, Subtotal) values
(1, 1, 1, 8, 48000),
(2, 2, 2, 1, 35000),
(3, 3, 3, 3, 40000),
(4, 4, 4, 6, 65000),
(5, 5, 5, 6, 58000);

insert into carros_compra (ID, Compra_ID, Carro_ID, Quantidade, Subtotal) values
(6, 6, 6, 3, 28000);

insert into carros_compra (ID, Compra_ID, Carro_ID, Quantidade, Subtotal) values
(7,7,6,6,28000),
(8,8,6,5,28000);

create table Estoque
(
	ID integer primary key NOT NULL,
    Carro_ID integer NOT NULL,
    Quantidade_em_Estoque int NOT NULL,
    
    foreign key (Carro_ID) references Carros (ID)
);

insert into Estoque (ID, Carro_ID, Quantidade_em_Estoque) values
(1, 1, 47),
(2, 2, 50),
(3, 3, 84),
(4, 4, 59),
(5, 5, 60),
(6, 6, 60);

insert into Estoque (ID, Carro_ID, Quantidade_em_Estoque) values
(7, 7, 37),
(8, 8, 52);

select compras.total_da_compra, carros.nome, clientes.nome from compras
	inner join carros_compra on compras.id=carros_compra.compra_id
		inner join carros on carros.id=carros_compra.carro_id
			inner join clientes on clientes.id=compras.cliente_id
				where compras.cliente_id=6;


select clintes.id, clientes.nome, compras.id, compras.total_da_compra from compras
	inner join clientes on clientes.id = compras.cliente_id
		where compras.total_da_compra
		order by compras.total_da_compra;
/*Desafio
	
*/

/* 1.  Escreva uma consulta para listar todos os carros disponíveis na loja.
Resposta 1
	"select ID, Nome from carros;"

2.  Recupere os detalhes de um carro específico usando seu ID.
	"select nome from carros where ID=1;"

3.  Mostre o nome, o CPF e o e-mail de todos os clientes cadastrados.
	"select nome,CPF,Email from Clientes;"

4.  Recupere os detalhes de uma compra específica, incluindo o nome do cliente, a data da compra e o total.
	"select clientes.nome, compras.Total_da_Compra, compras.Data_da_Compra from clientes
		inner join compras on clientes.id=compras.cliente_ID 
			where compras.cliente_ID = 3;"

5.  Liste os carros que estão em estoque, juntamente com a quantidade disponível.
	"select Nome,Quantidade_em_Estoque from carros where Quantidade_em_Estoque > 0;"

6.  Crie uma consulta para mostrar os clientes que compraram um determinado carro (usando o ID do carro).
	"select clientes.id, clientes.nome, carros.nome from clientes 
		inner join compras on clientes.id = compras.cliente_ID 
			inner join carros_compra on compras.id = carros_compra.compra_ID
				inner join carros on carros.id = carros_compra.carro_id 
					where carros_compra.carro_id = 6;"
                    
	"select clientes.id, clientes.nome from clientes 
		inner join compras on clientes.id = compras.cliente_ID 
			inner join carros_compra on compras.id = carros_compra.compra_ID 
				where carros_compra. carro_id = 6;"

7.  Exiba o total de cada compra, juntamente com os nomes dos carros comprados, para um cliente específico.
	

8.  Mostre os carros que foram comprados em uma determinada data.
	

9.  Recupere o total de vendas de cada cliente (nome e total) em ordem decrescente.
	

10.  Exiba o nome do cliente que fez a compra mais cara até o momento.
	 

11.  Crie uma consulta para calcular a quantidade total de carros em estoque.
	 

12.  Liste as compras feitas por um cliente específico, incluindo a data da compra e o total.
	 

13.  Mostre os carros que nunca foram comprados.
	 

14.  Mostre os clientes que ainda não fizeram nenhuma compra.
	 
*/

