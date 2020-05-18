drop database haf;
create database haf;
use haf;

create table rol(
    id_rol int,
    nom_rol varchar(20),
    primary key (id_rol)
);

create table tipo_doc(
    id_tipo_doc int,
    nom_doc varchar (15),
    primary key (id_tipo_doc)
);

create table usuario(
    id_num_doc_usuario int,
    nombre1_usuario varchar(25),
    nombre2_usuario varchar(25),
    apell1_usuario varchar(25),
    apell2_usuario varchar(25),
    contraseña varchar(32),
    fk_id_tipo_doc int, 
    fk_id_rol int,
    primary key (id_num_doc_usuario,fk_id_tipo_doc)
);

alter table usuario add constraint  fk_usuario_id_tipo_doc foreign key (fk_id_tipo_doc) references tipo_doc (id_tipo_doc) on update cascade;
alter table usuario add constraint fk_usuario_id_rol foreign key (fk_id_rol) references rol (id_rol) on update cascade;


create table contacto(
    id_correo varchar (30),
    dir_usuario varchar (25),
    tel_usuario varchar (15),
    fk_id_num_doc_usuario int,
    fk_id_tipo_doc int,
    primary key (id_correo,fk_id_num_doc_usuario,fk_id_tipo_doc)
);

alter table contacto add constraint fk_contacto_id_num_doc_usuario foreign key (fk_id_tipo_doc,fk_id_num_doc_usuario) references usuario (id_num_doc_usuario, fk_id_tipo_doc) on update cascade;

create table sede(
    id_sede int,
    nom_sede varchar (20),
    direc_sede varchar (30),
    tel_sede varchar (15),
    num_ambientes tinyint,
    primary key(id_sede)
);


create table programa(
    id_programa int,
    nom_programa varchar(20),
    fk_id_sede int,
    primary key(id_programa)
);

alter table programa add constraint fk_programa_id_sede foreign key (fk_id_sede) references sede (id_sede) on update cascade;

create table ficha(
    id_ficha int,
    fk_id_programa int,
    primary key (id_ficha)
);

alter table ficha add constraint fk_ficha_id_programa foreign key (fk_id_programa) references programa (id_programa) on update cascade;

create table ambiente(
    id_ambiente varchar(5),
    capacidad int,
    fk_id_sede int,
    primary key(id_ambiente)
);

alter table ambiente add constraint fk_ambiente_id_sede foreign key (fk_id_sede) references sede (id_sede) on update cascade;

create table jornada(
    id_jornada int,
    tipo_jornada varchar (30),
    fk_id_ficha int,
    primary key (id_jornada)
);

alter table jornada add constraint fk_jornada_id_ficha foreign key (fk_id_ficha) references ficha (id_ficha) on update cascade;

create table competencia(
    id_competencia int,
    nom_competencia varchar(20),
    fk_id_ficha int,
    fk_id_num_doc_usuario int,
    fk_id_tipo_doc int,
    primary key (id_competencia,fk_id_num_doc_usuario,fk_id_tipo_doc)   
);

alter table competencia add constraint fk_competencia_id_ficha foreign key (fk_id_ficha) references ficha (id_ficha) on update cascade;
alter table competencia add constraint fk_competencia_id_num_doc_usuario foreign key (fk_id_tipo_doc,fk_id_num_doc_usuario) references usuario (fk_id_tipo_doc, id_num_doc_usuario) on update cascade;

create table horario(
    id_horario int,
    hora time,
    fk_id_competencia int,
    fk_id_ambiente varchar(5)
);

alter table horario add constraint fk_horario_id_competencia foreign key (fk_id_competencia) references competencia (id_competencia) on update cascade;
alter table horario add constraint fk_horario_id_ambiente foreign key (fk_id_ambiente) references ambiente (id_ambiente) on update cascade;












