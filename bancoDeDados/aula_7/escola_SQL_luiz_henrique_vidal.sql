create database escola_SQL_luiz_henrique_vidal;

use escola_SQL_luiz_henrique_vidal;

create table alunos
(
	ALUNO_ID int primary key not null,
    NOME varchar(255),
    DATA_NASCIMENTO date,
    ENDERECO varchar(255),
    TELEFONE varchar(15)
);

INSERT INTO Alunos (aluno_id, nome, data_nascimento, endereco, telefone)
VALUES
 (1, 'João Silva', '1995-03-15', 'Rua A, 123', '(11) 1234-5678'),
 (2, 'Maria Santos', '1998-06-22', 'Av. B, 456', '(11) 9876-5432'),
 (3, 'Carlos Oliveira', '1997-01-10', 'Rua C, 789', '(11) 5678-1234'),
 (4, 'Ana Pereira', '1999-09-05', 'Av. D, 987', '(11) 4321-8765'),
 (5, 'Pedro Rodrigues', '1996-07-18', 'Rua E, 654', '(11) 3456-7890'),
 (6, 'Sara Costa', '2000-04-30', 'Av. F, 321', '(11) 8765-4321'),
 (7, 'Luiz Vidal', '2000-09-05', 'Av. B, 201', '(11) 98079-5951'),
 (8, 'Nicolau Copernico', '2000-10-14', 'Av. B, 204', '(11) 95222-6646');



create table professores
(
	PROFESSOR_ID int primary key not null,
    NOME varchar (255),
    DATA_CONTRATACAO date
);

INSERT INTO Professores (professor_id, nome, data_contratacao)
VALUES
 (1, 'Ana Lima', '2010-08-15'),
 (2, 'José Santos', '2005-04-20'),
 (3, 'Márcio Oliveira', '2012-11-10'),
 (4, 'Cláudia Pereira', '2014-03-25'),
 (5, 'Fernanda Rodrigues', '2018-09-08'),
 (6, 'Ricardo Costa', '2019-12-01');


create table disciplinas
(
	DISCIPLINA_ID int primary key not null,
    NOME_DISCIPLINA VARCHAR(255),
    CODIGO_DISCIPLINA VARCHAR(10),
    CARGA_HORARIA int
);

INSERT INTO Disciplinas (disciplina_id, nome_disciplina, codigo_disciplina, carga_horaria)
VALUES
 (1, 'Programação em C', 'PC101', 60),
 (2, 'Banco de Dados', 'BD201', 45),
 (3, 'Desenvolvimento Web', 'DW301', 75),
 (4, 'Algoritmos Avançados', 'AA401', 60),
 (5, 'Inteligência Artificial', 'IA501', 90),
 (6, 'Segurança da Informação', 'SI601', 45);


create table turmas
(
	TURMA_ID int primary key not null,
    ANO_ESCOLAR int,
    DISCIPLINA_ID int,
    PROFESSOR_ID int,
    
    foreign key (DISCIPLINA_ID) references disciplinas (DISCIPLINA_ID),
    foreign key (PROFESSOR_ID) references professores (PROFESSOR_ID)
);

INSERT INTO Turmas (turma_id, ano_escolar, disciplina_id, professor_id)
VALUES
 (101, 2023, 1, 1),
 (102, 2023, 2, 2),
 (103, 2023, 3, 3),
 (104, 2023, 4, 4),
 (105, 2023, 5, 5),
 (106, 2023, 6, 6);


create table notas
(
	NOTA_ID int primary key not null,
    ALUNO_ID int,
    DISCIPLINA_ID int,
    DATA_AVALIACAO date,
    NOTA float,
    
    foreign key (ALUNO_ID) references alunos (ALUNO_ID),
    foreign key (DISCIPLINA_ID) references disciplinas (DISCIPLINA_ID)
);

INSERT INTO Notas (nota_id, aluno_id, disciplina_id, data_avaliacao, nota)
VALUES
 (1, 1, 1, '2023-03-10', 85),
 (2, 2, 1, '2023-03-10', 78),
 (3, 3, 1, '2023-03-10', 92),
 (4, 4, 2, '2023-03-15', 88),
 (5, 5, 2, '2023-03-15', 95),
 (6, 6, 2, '2023-03-15', 75),
 (7, 7, 1, '2023-04-15', 75),
 (8, 8, 3, '2023-04-04', 89);
 
 INSERT INTO Notas (nota_id, aluno_id, disciplina_id, data_avaliacao, nota)
VALUES
 (9, 8, 5, '2023-05-15', 85);

create table presenca 
(
	PRESENCA_ID int primary key not null, 
    ALUNO_ID int,
    TURMA_ID int,
    DATA_AULA date,
    PRESENCA varchar(8),
    
    foreign key (ALUNO_ID) references alunos (ALUNO_ID),
    foreign key (TURMA_ID) references turmas (TURMA_ID)
);

INSERT INTO Presenca (presenca_id, aluno_id, turma_id, data_aula, presenca)
VALUES
 (1, 1, 101, '2023-03-10', 'presente'),
 (2, 2, 101, '2023-03-10', 'presente'),
 (3, 3, 101, '2023-03-10', 'presente'),
 (4, 4, 102, '2023-03-15', 'ausente'),
 (5, 5, 102, '2023-03-15', 'presente'),
 (6, 6, 102, '2023-03-15', 'presente'),
 (7, 7, 101, '2023-04-15', 'ausente');

select alunos.NOME, turmas.DISCIPLINA_ID

/*Formulário de Banco de Dados

Qual é o nome do professor que ministra a disciplina com código "BD201"?
Resposta:
select professores.nome, disciplinas.CODIGO_DISCIPLINA from disciplinas 
	inner join turmas on turmas.DISCIPLINA_ID = disciplinas.DISCIPLINA_ID
		inner join professores on turmas.PROFESSOR_ID = professores.PROFESSOR_ID
			where disciplinas.CODIGO_DISCIPLINA = "BD201";

Para a disciplina com código "PC101", obtenha a lista de alunos que obtiveram notas maiores que 80.
Resposta:
select disciplinas.NOME_DISCIPLINA, disciplinas.DISCIPLINA_ID, alunos.NOME, notas.NOTA
	from disciplinas inner join notas on notas.DISCIPLINA_ID = disciplinas.DISCIPLINA_ID
		inner join alunos on notas.ALUNO_ID = alunos.ALUNO_ID
        WHERE disciplinas.CODIGO_DISCIPLINA = "PC101" and notas.nota >= 80;

Quais alunos estiveram presentes na aula da turma com ID 101 na data '2023-03-10'?
Resposta:


Calcule a média das notas dos alunos na disciplina com código "IA501".


Liste todos os alunos e as disciplinas que eles estão matriculados. Inclua os alunos que não estão matriculados em nenhuma disciplina.


Liste todos os alunos que não têm notas registradas.


Quais disciplinas têm menos de 40 horas de carga horária ou mais de 100 horas de carga horária?


Encontre o nome dos professores que não estão ministrando a disciplina "IA501".


Quais turmas não têm professores atribuídos?


Liste as disciplinas e seus códigos onde pelo menos um aluno obteve uma nota menor que 60.


Qual é a média das notas dos alunos na disciplina com código "DW301" entre '2023-03-01' e '2023-03-31'?


Liste todos os alunos que estão matriculados em mais de uma disciplina.


Quais são os anos escolares distintos das turmas onde pelo menos um aluno faltou?


Mostre o nome dos professores que estão ministrando a disciplina "PC101" ou "BD201".


Qual é o nome do aluno que faltou em todas as aulas?


Liste as disciplinas e seus códigos onde todos os alunos obtiveram uma nota maior ou igual a 70.
Resposta:
select disciplinas.NOME_DISCIPLINA, disciplinas.DISCIPLINA_ID, alunos.NOME, notas.NOTA
	from disciplinas inner join notas on notas.DISCIPLINA_ID = disciplinas.DISCIPLINA_ID
		inner join alunos on notas.ALUNO_ID = alunos.ALUNO_ID
        WHERE NOT notas.nota <= 70;

Quais alunos obtiveram notas entre 80 e 90 na disciplina "IA501" ou "DW301"?
Resposta:
select alunos.aluno_id, alunos.nome, notas.nota, disciplinas.nome_disciplina, disciplinas.codigo_disciplina
	from disciplinas inner join notas on disciplinas.disciplina_id = notas.disciplina_id
		inner join alunos on notas.aluno_id = alunos.aluno_id where notas.nota between '80' and '90' 
			having disciplinas.codigo_disciplina = "IA501" or disciplinas.codigo_disciplina = "DW301";

Encontre o nome dos professores que não estão ministrando nenhuma disciplina com carga horária superior a 60 horas.
Resposta:
select professores.professor_id, professores.nome, disciplinas.disciplina_id, disciplinas.nome_disciplina, disciplinas.CARGA_HORARIA
	from professores inner join turmas on professores.professor_id = turmas.professor_id
		inner join disciplinas on turmas.disciplina_id = disciplinas.disciplina_id
			where disciplinas.CARGA_HORARIA < 60;

Quais são as datas de aulas para a disciplina com código "AA401" entre '2023-04-01' e '2023-04-30' onde pelo menos um aluno faltou?
Resposta:
select presenca.data_aula, disciplinas.NOME_DISCIPLINA, alunos.aluno_id, alunos.nome, presenca.presenca
	from presenca inner join turmas on presenca.turma_id = turmas.turma_id
		inner join disciplinas on turmas.disciplina_id = disciplinas.disciplina_id
			inner join alunos on alunos.aluno_id = presenca.aluno_id 
				where presenca.presenca='ausente' having presenca.data_aula between '2023-04-01' and '2023-04-30';

Liste os nomes dos alunos que não faltaram em nenhuma aula.
Resposta:
select alunos.nome, presenca.presenca from presenca inner join alunos 
	on alunos.aluno_id = presenca.aluno_id where presenca.presenca='presente';
    
*/

/* Nomenclaturas


alunos.ALUNO_ID
alunos.NOME
alunos.DATA_NASCIMENTO
alunos.TELEFONE
alunos.ENDERECO 

professores.PROFESSOR_ID
professores.NOME
professores.DATA_CONTRATACAO

disciplinas.DISCIPLINA_ID
disciplinas.NOME_DISCIPLINA
disciplinas.CODIGO_DISCIPLINA
disciplinas.CARGA_HORARIA

turmas.TURMA_ID
turmas.ANO_ESCOLAR
turmas.DISCIPLINA_ID
turmas.PROFESSOR_ID

notas.NOTA_ID
notas.ALUNO_ID
notas.DISCIPLINA_ID
notas.DATA_AVALIACAO
notas.NOTA

presenca.PRESENCA_ID
presenca.ALUNO_ID
presenca.TURMA_ID
presenca.DATA_AULA
presenca.PRESENCA
*/