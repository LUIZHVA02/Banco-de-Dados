create table loja_de_roupas
(
    id integer primary key, 
    name text, 
    preco numeric, 
    quantidade integer,
    porc_vendas integer
);

insert into loja_de_roupas(id, name, preco, quantidade, porc_vendas)values

(1, "Camiseta Lacoste", 80.99, 100, 13),
(4, "Camiseta Nike", 80.99, 100, 40),
(7, "Camiseta Adidas", 80.99, 100, 27),
(10, "Camiseta Gap", 80.99, 100, 7),
(13, "Camiseta Oakley", 80.99, 100, 13),

(2, "Calça Lacoste", 80.99, 100, 00),
(5, "Calça Nike", 80.99, 100, 00),
(8, "Calça Adidas", 80.99, 100, 00),
(11, "Calça Gap", 80.99, 100, 00),
(14, "Calça Oakley", 80.99, 100, 00),

(3, "Boné Lacoste", 80.99, 100, 20),
(6, "Boné Nike", 80.99, 100, 6),
(9, "Boné Adidas", 80.99, 100, 20),
(12, "Boné Gap", 80.99, 100, 8),
(15, "Boné Oakley", 80.99, 100, 46);

