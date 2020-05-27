drop database haf;  
create database haf;


create table haf.tipo_doc(
    id_tipo_doc varchar(25),
    sigla_doc varchar(10),
    nom_doc varchar(25),
    primary key (id_tipo_doc)
);

create table haf.rol(	
    id_rol int,
    nombre_rol varchar(25),
    primary key (id_rol)
);

create table haf.usuario(
    id_num_doc int,
    p_nombre varchar (25),
    s_nombre varchar (25),
    p_apellido varchar (25),
    s_apellido varchar(25),
    email varchar (30),
    contraseña varchar (32),
    avatar blob,
    telefono varchar (30),
    fk_id_rol int,
    fk_id_tipo_doc varchar (25),
    primary key (id_num_doc,fk_id_tipo_doc)
);

alter table haf.usuario add constraint fk_id_rol foreign key (fk_id_rol) references haf.rol (id_rol) on update cascade;
alter table haf.usuario add constraint fk_id_tipo_doc foreign key (fk_id_tipo_doc) references haf.tipo_doc (id_tipo_doc) on update cascade;

create table haf.administrador(
    id_administrador int,
    fk_id_num_doc int,
    fk_id_tipo_doc varchar (25),
    primary key (id_administrador, fk_id_num_doc, fk_id_tipo_doc) 
);

create table haf.especialidad(
    id_especialidad int,
    nom_especialidad varchar(25),
    primary key (id_especialidad)
);

create table haf.vinculacion(
    id_vinculacion int,
    nombre_vinculacion varchar (25),
    primary key (id_vinculacion)
);

create table haf.programa(
    id_programa varchar (25),
    nombre_programa varchar (30),
    fk_id_especialidad int,
    primary key (id_programa)
);

alter table haf.programa add constraint fk_programa_id_especialidad foreign key (fk_id_especialidad) references haf.especialidad (id_especialidad) on update cascade;




create table haf.grupo(
    id_grupo varchar(10),
    num_aprendices int,
    primary key(id_grupo)
);


create table haf.trimestre(
    id_trimestre varchar (15),
    num_trimestre varchar (12),
    primary key (id_trimestre)
);


create table haf.jornada(
    id_jornada int,
    tipo_jornada varchar (12),
    primary key (id_jornada)
);

create table haf.ficha(
    id_ficha varchar (25),
    num_ficha varchar (15),
    fk_id_programa varchar (25),
    fk_id_jornada int,
    fk_id_grupo varchar (10),
    fk_id_trimestre varchar (15),
    primary key (id_ficha)   
);

alter table haf.ficha add constraint fk_ficha_id_programa foreign key (fk_id_programa) references haf.programa (id_programa) on update cascade;
alter table haf.ficha add constraint fk_ficha_id_jornada foreign key (fk_id_jornada) references haf.jornada (id_jornada) on update cascade;
alter table haf.ficha add constraint fk_ficha_id_grupo foreign key (fk_id_grupo) references haf.grupo (id_grupo) on update cascade;
alter table haf.ficha add constraint fk_ficha_id_trimestre foreign key (fk_id_trimestre) references haf.trimestre (id_trimestre) on update cascade;

alter table haf.administrador add constraint fk_administrador_id_num_doc_id_tipo_doc foreign key (fk_id_num_doc, fk_id_tipo_doc) references haf.usuario (id_num_doc, fk_id_tipo_doc) on update cascade;

create table haf.aprendiz(
    fk_id_num_doc int,
    fk_id_tipo_doc varchar (25),
    fk_id_ficha varchar(25),
    primary key (fk_id_num_doc,fk_id_tipo_doc, fk_id_ficha)
);

alter table haf.aprendiz add constraint fk_aprendiz_id_num_doc_id_tipo_doc foreign key (fk_id_num_doc,fk_id_tipo_doc) references haf.usuario (id_num_doc,fk_id_tipo_doc) on update cascade;
alter table haf.aprendiz add constraint fk_aprendiz_id_ficha foreign key (fk_id_ficha) references haf.ficha (id_ficha) on update cascade;

create table haf.instructor(
    fk_id_num_doc int,
    fk_id_tipo_doc varchar (25),
    fk_id_vinculacion int,
    fk_id_especialidad int,
    primary key (fk_id_num_doc, fk_id_tipo_doc)
);

alter table haf.instructor add constraint fk_instructor_id_num_doc_id_tipo_doc foreign key (fk_id_num_doc,fk_id_tipo_doc) references haf.usuario (id_num_doc,fk_id_tipo_doc) on update cascade;
alter table haf.instructor add constraint fk_instructor_id_vinculacion foreign key (fk_id_vinculacion) references haf.vinculacion (id_vinculacion) on update cascade; 
alter table haf.instructor add constraint fk_instructor_id_especialidad foreign key (fk_id_especialidad) references haf.especialidad (id_especialidad) on update cascade; 

create table haf.instructor_ficha(
    fk_id_num_doc int,
    fk_id_tipo_doc varchar(25),
    fk_id_ficha varchar (25),
    primary key (fk_id_num_doc,fk_id_tipo_doc,fk_id_ficha)
);

alter table haf.instructor_ficha add constraint fk_instructor_ficha_id_num_doc_id_tipo_doc foreign key (fk_id_num_doc,fk_id_tipo_doc) references haf.instructor(fk_id_num_doc,fk_id_tipo_doc) on update cascade;
alter table haf.instructor_ficha add constraint fk_instructor_ficha_id_ficha foreign key (fk_id_ficha) references haf.ficha (id_ficha) on update cascade;

create table haf.competencia(
    id_competencia int,
    descripcion varchar(25),
    fk_id_programa varchar (25),
    primary key (id_competencia)
);

alter table haf.competencia add constraint fk_competencia_id_programa foreign key (fk_id_programa) references haf.programa (id_programa) on update cascade;

create table haf.result_aprendizaje(
    id_result_aprendizaje int,
    descripcion varchar(25),
    fk_id_competencia int,
    primary key (id_result_aprendizaje)
);

alter table haf.result_aprendizaje add constraint fk_resul_aprendizaje_id_competencia foreign key (fk_id_competencia) references haf.competencia (id_competencia) on update cascade; 
