
drop database IF EXISTS faculdade;
create database IF NOT exists faculdade;
use faculdade;


CREATE TABLE tbl_professores (
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    cpf varchar(18) not null,
    rg varchar(15) not null,
    data_nascimento DATE not null,
    unique index(id)
);

create table tbl_cursos (
id int not null primary key auto_increment,
duracao date not null,
nome_curso varchar(80) not null,

id_professores int not null,
constraint FK_Professores_Cursos
foreign key (id_professores)
references tbl_professores (id),

unique index(id)
);

CREATE TABLE tbl_alunos (
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    cpf varchar(18) not null,
    rg varchar(15) not null,
    data_nascimento DATE not null,
   
   id_cursos int not null,
	constraint FK_Cursos_Alunos
	foreign key (id_cursos)
	references tbl_cursos (id),
   
	unique index(id)
    
);

create table tbl_enderecos (
id int not null primary key auto_increment,
logradouro varchar(40) not null,
bairro varchar(40) not null,
cep varchar(40) not null,
cidade varchar(40) not null,
estado varchar(40) not null,
pais varchar(40) not null,

id_alunos int not null,
constraint FK_Alunos_Enderecos
foreign key (id_alunos)
references tbl_alunos (id),

id_professores int not null,
constraint FK_Professores_Enderecos
foreign key (id_professores)
references tbl_professores (id),

unique index(id)
);

create table tbl_email (
id int not null primary key auto_increment,
email varchar(100) not null,

id_alunos int not null,
constraint FK_Alunos_Email
foreign key (id_alunos)
references tbl_alunos (id),

id_professores int not null,
constraint FK_Professores_Email
foreign key (id_professores)
references tbl_professores (id),


unique index(id)
);

create table tbl_materias (
id int not null primary key auto_increment,
carga_horaria time not null,
nome_materia varchar(45) not null,

id_cursos int not null,
constraint FK_Cursos_Materias
foreign key (id_cursos)
references tbl_cursos (id),

id_professores int not null,
constraint FK_Professores_Materias
foreign key (id_professores)
references tbl_professores (id),

unique index(id)
);

create table tbl_turmas (
id int not null primary key auto_increment,
nome_turma varchar(45),
inicio date,
termino date,
periodo varchar(45),

id_cursos int not null,
constraint FK_Cursos_Turmas
foreign key (id_cursos)
references tbl_cursos (id),

id_professores int not null,
constraint FK_Professores_Turmas
foreign key (id_professores)
references tbl_professores (id),

unique index(id)


);


create table tbl_notas(
id int not null primary key auto_increment,
nota DECIMAL(5,2),

id_alunos int not null,
constraint FK_Alunos_Notas
foreign key (id_alunos)
references tbl_alunos (id),

id_professores int not null,
constraint FK_Professores_Notas
foreign key (id_professores)
references tbl_professores (id),



unique index(id)

);
create table tbl_alunos_turmas(
id int not null primary key auto_increment,

id_alunos int not null,
constraint FK_Alunos_Alunos_Turmas
foreign key (id_alunos)
references tbl_alunos (id),

id_turmas int not null,
constraint FK_Turmas_Alunos_Turmas
foreign key (id_turmas)
references tbl_turmas (id),

unique index(id)
);

drop tables tbl_notas;

show databases;
show tables;
SELECT * FROM tbl_alunos;
SELECT * FROM tbl_professores;
SELECT * FROM tbl_notas;
describe tbl_cursos;
describe tbl_professores;
describe tbl_turmas;
show create table tbl_cursos;

INSERT into tbl_professores (nome,cpf,rg,data_nascimento) values ('João da Silva', "123-456-789-02","9990932-9","1978-12-17");      
INSERT into tbl_cursos (duracao, nome_curso,id_professores) values ('2','Dev',1);
INSERT into tbl_alunos (nome,cpf,rg,data_nascimento,id_cursos) values ('Lucas dos Santos', "568-427-569-98","6578752-x","1996-08-25",1);
          


alter table tbl_cursos
drop foreign key FK_Alunos_Cursos;

alter table tbl_cursos
drop id_alunos;

ALTER TABLE tbl_alunos
add id_cursos int not null;

alter table tbl_alunos
add constraint FK_Cursos_Alunos
foreign key (id_cursos)
references tbl_cursos (id);

delete from tbl_alunos
where id = 1;
