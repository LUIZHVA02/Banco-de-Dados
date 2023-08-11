CREATE SCHEMA escola;

use escola;

create table cursos
(

id int primary key not null auto_increment,
nome varchar(50) not null,
matricula int not null,
descricao varchar(200) not null,
data_inicio varchar(10) not null

);

insert into cursos(nome, matricula, descricao, data_inicio) values 
("Desenvolvimento de Sistemas", 12345, "É um ótimo curso", "20-10-2023"),
("Logística", 12254, "É um curso chato", "18-10-2023"),
("Banco de Dados", 11122, "É um ótimo curso, melhor ainda com SESI", "05-11-2023"),
("Power BI", 55555, "É um curso bom de melhorar", "10-10-2023"),
("Excel", 22244, "É um curso que já foi bom", "09-12-2023");

select *from cursos;

select nome,data_inicio from cursos where nome="Power BI";

select nome, descricao from cursos where nome="Desenvolvimento de Sistemas";

select nome, matricula from cursos where id=4;

update cursos set nome="Informética Básica" where id=3;

select *from cursos;

/*Com o nome não funciona, use o ID*/
/*
update cursos set matricula=12121 where nome="Excel";
update cursos set matricula=33333 where nome="Power BI";
*/

select *from cursos;

update cursos set matricula=12121 where id=5;
update cursos set matricula=33333 where id=4;

select *from cursos;

alter table cursos drop column data_inicio;