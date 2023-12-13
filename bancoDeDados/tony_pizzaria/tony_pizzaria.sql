drop database tony_pizzaria;

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
    preco numeric(5),
    link_img_produtos varchar(150),
    
    foreign key (idCategoria) references categorias(idCategoria)
);

create table pedidos(
	idPedidos int primary key not null auto_increment,
    idProduto int,
    idUsuario int,
    data_hora_pedido datetime,
    data_hora_entrega datetime,
    valorTotal numeric(5),
    
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
(0, 3, 06325000, "Carapicuíba", "Conjunto Habitacional Presidente Castelo Branco", "Avenida Brasil", ""),
(0, 4, 04325000, "São Paulo", "Vila do Encontro", "Avenida Engenheiro Armando de Arruda Pereira", ""),
(0, 5, 03325000,"São Paulo", "Vila Santo Estevão", "Rua Aguapeí", "");

insert into categorias(idCategoria, nome, qntd_produtos, subCategorias)values
(0, "Pizzas", 2, ""),
(0, "Pizzas", 2, ""),
(0, "Pizzas", 2, ""),
(0, "Refrigerantes"),
(0, "Refrigerantes");

insert into produtos(idProduto, idCategoria, nome, descricao, preco, link_img_produtos)values
(),
(),
(),
(),
();

insert into pedidos(idPedidos, idProduto, idUsuario, data_hora_pedido, data_hora_entrega, valorTotal)values
(),
(),
(),
(),
();

insert into comentarios(idComentario, idUsuario, idProduto, texto, data_hora_publicacao, avaliacao)values
(),
(),
(),
(),
();