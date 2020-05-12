use ex01;

create table empregado(
pnome varchar(50) not null,
minicial char(1) not null,
unome varchar(30) not null,
ssn varchar(11) not null primary key,
dob date not null,
endereco varchar(150) not null,
sexo char(1 )not null,
salario decimal(12,2) not null,
superssn varchar(11) not null,
dno char(4) not null
);

create table dependente(
essn varchar(11) not null,
nome_dependente varchar(50) not null,
sexo char(1) not null,
dob date not null,
parentesco varchar(20) not null,
primary key pkessn_nome (essn, nome_dependente),
foreign key fkdep_emp (essn) references empregado (ssn)
);

create table trabalha_em(
essn varchar(11) not null,
pno int not null,
horas int not null,
primary key pkessn_pno (essn, pno)
/*foreign key fktrab_emp (essn) references empregado (ssn),
foreign key fktrab_proj (pno) references projeto (pnumero)*/
);

create table departamento(
dnome varchar(30) not null,
dnumero int not null primary key,
gerssn varchar(11) not null,
gerdatainicio date not null
);

create table depto_localizacoes(
dnumero int not null,
dlocalizacao varchar(40) not null,
primary key pkdnum_dloc (dnumero, dlocalizacao)
);

create table projeto(
pjnome varchar(40) not null,
pnumero int not null primary key,
plocalizacao varchar(40) not null,
dnum int not null
);


alter table departamento add constraint fkdepto_emp foreign key (gerssn) references empregado (ssn);

alter table depto_localizacoes add constraint fkloc_depto foreign key (dnumero) references departamento (dnumero);

alter table projeto add constraint fkproj_depto foreign key (dnum) references departamento (dnumero);

alter table trabalha_em add constraint fktrab_emp foreign key (essn) references empregado (ssn);

alter table trabalha_em add constraint fktrab_proj foreign key (pno) references projeto (pnumero)



