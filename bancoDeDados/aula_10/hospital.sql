create database hospital;

use hospital;

create table hospital(
	idHospital int primary key not null,
    nome varchar(200),
    cnpj numeric(14)
);

create table alas(
	idAlas int primary key not null,
    idHospital int,
    nome varchar(100),
    corredor varchar(50),
    
    foreign key (idHospital) references hospital(idHospital)
);

/*create table enfermeira(
	idEnfermeira int primary key not null,
    nome varchar(200),
    cre int,
    chefe varchar(200)
);*/

create table endereco(
	idEndereco int primary key not null,
    idHospital int,
    logradouro varchar(200),
    cep numeric(9),
    cidade varchar(100),
    estado varchar(100),
    complemento varchar(100),
    rua varchar(100),
    
    foreign key (idHospital) references hospital(idHospital)
);

create table planoSaude (
	idPlanoSaude int primary key not null,
    idHospital int,
    idMedico int,
    nome varchar(200),
    telefone numeric(14),
    
    foreign key (idHospital) references hospital(idHospital),
    foreign key (idMedico) references medico(idMedico)
);

create table medico(
	idMedico int primary key not null,
    nome varchar(200),
    especialidade varchar(200),
    crm int
);

create table atendimento(
	idAtendimento int primary key not null,
    idMedico int,
    idPaciente int,
    data_atendimento date,
    hora_atendimento time,
    
    foreign key (idMedico) references medico(idMedico),
    foreign key (idPaciente) references paciente(idPaciente)
);

create table paciente(
	idPaciente int primary key not null auto_increment,
    nome varchar(200),
    sexo varchar(10)
);
