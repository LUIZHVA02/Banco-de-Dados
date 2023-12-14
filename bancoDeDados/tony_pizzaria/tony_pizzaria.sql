create database tony_pizzaria;

use tony_pizzaria;

create table tonyPizzaria(
	idPizzaria int primary key not null,
    nome varchar(100),
    cnpj numeric(14),
    email varchar(100),
    telefone numeric(14)    
);

create table usuarios(
	idUsuario int primary key not null auto_increment,
    idPizzaria int,
    nome varchar(200),
    telefone numeric(14),
    cpf numeric(11),
    senha varchar(100),
    email varchar(100),
    link_img_perfil varchar(1000),
    
    foreign key (idPizzaria) references tonyPizzaria(idPizzaria)
);

create table enderecos(
	idEndereco int primary key not null auto_increment,
    idUsuario int,
    cep numeric(9),
    cidade varchar(150),
    bairro varchar(150),
    rua varchar(150),
    complemento varchar(150),
    
    foreign key (idUsuario) references usuarios(IdUsuario)
);

create table categorias(
	idCategoria int primary key not null auto_increment,
    nome varchar(100),
    qntd_produtos int,
    subCategoria varchar(100)
);

create table produtos(
	idProduto int primary key not null auto_increment,
    idCategoria int,
    nome varchar(150),
    descricao varchar(200),
    preco double,
    link_img_produtos varchar(150),
    
    foreign key (idCategoria) references categorias(idCategoria)
);

create table pedidos(
	idPedido int primary key not null,
    idProduto int,
    idUsuario int,
    data_hora_pedido datetime,
    data_hora_entrega datetime,
    valorTotal double,
    
    foreign key (idProduto) references produtos(idProduto),
    foreign key (idUsuario) references usuarios(idUsuario) 
);

create table comentarios(
	idComentario int primary key not null auto_increment,
    idUsuario int,
    idProduto int,
    texto varchar(200),
    data_hora_publicacao datetime,
    avaliacao int,
    
    foreign key (idProduto) references produtos(idProduto),
    foreign key (idUsuario) references usuarios(idUsuario) 
);

create table pagamentos(
	idPagamento int primary key not null,
    idPedido int,
    forma_pagamento1 varchar(200),
    forma_pagamento2 varchar(200),
    forma_pagamento3 varchar(200),
    
	foreign key (idPedido) references pedidos(idPedido)
);

insert into tonyPizzaria (idPizzaria, nome, cnpj, email, telefone)values
(1,'Tony Pizzaria - Novo Hamburgo', 46854138485546, 'tonypizzaria@gmail.com', 55011915348532);

insert into usuarios(idUsuario, idPizzaria, nome, telefone, cpf, senha, email, link_img_perfil)values
(0, 1, "Luiz Henrique Vidal Araujo", 5511961659165, 57681653133, "dez_13/12", "luizhva@gmail.com", ""),
(0, 1, "Nicolas Vasconcelos Petri", 5511965161647, 42682188952, "dez_03/12", "nvpetir@gmail.com", ""),
(0, 1, "Estela da Silva Menezes", 5511956168165, 65168165681, "out_09/10", "estrelinha@gmail.com", ""),
(0, 1, "Carolina Neponucena", 5511916541541, 41961651614, "nov_06/11", "carolcomcerteza@gmail.com", ""),
(0, 1, "Jessica Pereira dos Santos", 5511966116489, 55336952895, "mar_26/03", "annaeelza@gmail.com", "");

insert into enderecos(idEndereco, idUsuario, cep, cidade, bairro, rua, complemento)values
(0, 1, 06325000, "Carapicuíba", "Conjunto Habitacional Presidente Castelo Branco", "Avenida Brasil", "204B bloco B"),
(0, 2, 05325000, "São Paulo", "Parque Continental", "Rua Alfredo Pinheiro", ""),
(0, 3, 06325000, "Carapicuíba", "Conjunto Habitacional Presidente Castelo Branco", "Avenida Brasil", "204B bloco B"),
(0, 4, 04325000, "São Paulo", "Vila do Encontro", "Avenida Engenheiro Armando de Arruda Pereira", ""),
(0, 5, 03325000,"São Paulo", "Vila Santo Estevão", "Rua Aguapeí", "");

insert into categorias(idCategoria, nome, qntd_produtos, subCategoria)values
(0, "Pizzas", 2, "Salgadas"),
(0, "Pizzas", 2, "Doces"),
(0, "Pizzas Brotinho", 2, "Salgadas"),
(0, "Pizzas Brotinho", 2, "Doces"),
(0, "Sobremesas", 5, "Maiores"),
(0, "Sobremesas", 5, "Menores"),
(0, "Bebidas", 9, "3 Litros"),
(0, "Bebidas", 9, "2 Litros"),
(0, "Bebidas", 8, "1 Litro"),
(0, "Bebidas", 9, "600 Mililitros");

insert into produtos(idProduto, idCategoria, nome, descricao, preco, link_img_produtos)values
(0, 1, "Pizza de Calabreza com Queijo", "", 16.99, ""),
(0, 2, "Pizza de Chocolate com Morango","", 19.99, ""),
(0, 3, "Pizza Brotinho de Calabreza com Queijo", "", 14.99, ""),
(0, 4, "Pizza Brotinho de Prestígio", "", 15.99, ""),
(0, 5, "Balde de Sorvete", "Balde de 3 Litros de Sorvete do sabor de sua escolha", 27.90, ""),
(0, 6, "Milkshake", "Milkshake de 500 gramas com o sabor de sua escolha", 13.80, ""),
(0, 7, "Refrigerante Coca Cola","", 10.99, ""),
(0, 8, "Refrigerante Dolly Guaraná", "", 10.99, ""),
(0, 9, "Refrigerante Pepsi Cola", "", 8.99, ""),
(0, 10, "Cerveja Heineken", "", 18.99, "");

insert into pedidos(idPedido, idProduto, idUsuario, data_hora_pedido, data_hora_entrega, valorTotal)values
(0, ),
(0, ),
(0, ),
(0, ),
(0, );

insert into comentarios(idComentario, idUsuario, idProduto, texto, data_hora_publicacao, avaliacao)values
(),
(),
(),
(),
();

insert into pagamentos(idPagamento, idPedido, forma_pagamento1, forma_pagamento2, forma_pagamento3)values
(),
(),
(),
(),
();