use haf;

-- 1-Instructores y su tipo de vinculación (Nombres, Apellidos, Tipo de vinculación)
select p_nombre as "primer nombre", s_nombre as "segundo nombre",
 p_apellido as "primer apelido", s_apellido as "segundo apellido",
 nombre_vinculacion as "tipo vinculacion"
 from usuario u 
 inner join instructor i
 on u.id_num_doc = i.fk_id_num_doc
 inner join vinculacion v 
 on i.fk_id_vinculacion = v.id_vinculacion order by nombre_vinculacion;
 
 -- 2-Instructores y su especialidad (Nombres, Apellidos, Tipo de especialidad)
select p_nombre as "primer nombre", s_nombre as "segundo nombre",
p_apellido as "primer apelido", s_apellido as "segundo apellido",
nom_especialidad as "tipo especialidad"
from usuario u 
inner join instructor i
on u.id_num_doc = i.fk_id_num_doc
inner join especialidad e
on i.fk_id_especialidad = e.id_especialidad order by p_nombre;
 
 -- 3-Fichas y aprendices asociados (Ficha, Grupo, Nombres, Apellidos)
 select num_ficha as "ficha", num_grupo "grupo", p_nombre as "primer nombre", s_nombre as "segundo nombre",
 p_apellido as "primer apelido", s_apellido as "segundo apellido" 
 from usuario u
 inner join aprendiz a 
 on u.id_num_doc = a.fk_id_num_doc
 inner join ficha f
 on a.fk_id_ficha = f.id_ficha 
 inner join grupo g
 on f.fk_id_grupo = g.id_grupo order by num_grupo;
 
 -- 4-Usuarios y rol (Nombres, Apellidos, Rol)
select p_nombre as "primer nombre", s_nombre as "segundo nombre",
p_apellido as "primer apelido", s_apellido as "segundo apellido", 
nombre_rol as "rol"
from usuario u
inner join rol r
on u.fk_id_rol = r.id_rol order by nombre_rol;
 
 -- 5-Tipo de documento, usuarios y rol (Tipo de documento, Número de identificación, Nombres, Apellidos, Rol)
select nom_doc as "tipo documento", id_num_doc as "numero de identificacion",  p_nombre as "primer nombre", s_nombre as "segundo nombre",
p_apellido as "primer apelido", s_apellido as "segundo apellido", nombre_rol as "rol"
from tipo_doc td
inner join usuario u
on td.id_tipo_doc = u.fk_id_tipo_doc
inner join rol r
on u.fk_id_rol = r.id_rol order by rol;

-- 6-Fichas, competencias, resultados de aprendizaje (Ficha, Competencias, Resultados de aprendizaje)
select num_ficha as "ficha", descripcion_comp as "competencia", descripcion as "resultado aprendizaje"
from ficha f 
inner join programa p
on f.fk_id_programa = p.id_programa
inner join competencia c 
on p.id_programa = c.fk_id_programa
inner join result_aprendizaje ra
on c.id_competencia = ra.fk_id_competencia  order by num_ficha;

-- 7-Elegir una ficha en específico y los aprendices asociados a esa ficha (Ficha, Grupo, Nombres, Apellidos)
select num_ficha as "ficha" , num_grupo as "grupo", p_nombre as "primer nombre", s_nombre as "segundo nombre",
p_apellido as "primer apelido", s_apellido as "segundo apellido"
from usuario u 
inner join aprendiz a 
on u.id_num_doc = a.fk_id_num_doc
inner join ficha f 
on a.fk_id_ficha = f.id_ficha 
inner join grupo g 
on f.fk_id_grupo = g.id_grupo  where num_ficha = "20004TPM" order by p_nombre; 

-- 8-Cantidad de usuarios inscritos (Número de usuarios)
select count(*) from usuario;

-- 9-Fichas y jornada (Ficha, Jornada)
select num_ficha as "ficha", tipo_jornada as "jornada"
from ficha f
inner join jornada j 
on f.fk_id_jornada = j.id_jornada order by num_ficha;

 -- 10-Fichas, trimestres, jornada (Ficha, Trimestres, Jornada)
 select num_ficha as "ficha", num_trimestre as "trimestre", tipo_jornada as "jornada"
 from trimestre t
 inner join ficha f
 on t.id_trimestre = f.fk_id_trimestre
 inner join  jornada j
 on f.fk_id_jornada = j.id_jornada order by num_trimestre; 
 
 -- 11-Aprendices con tipo de documento 'T.I.' (Tipo de documento, Nombres, Apellidos)
select nom_doc as "tipo de documento" , p_nombre as "primer nombre", s_nombre as "segundo nombre",
p_apellido as "primer apelido", s_apellido as "segundo apellido"
from tipo_doc td
inner join usuario u 
on td.id_tipo_doc = u.fk_id_tipo_doc where nom_doc = "tarjeta de identidad" order by p_nombre; 

-- 12-Fichas con jornada fines de semana (Ficha, Jornada, Siglas de jornada)
select num_ficha as "ficha", tipo_jornada as "jornada", siglas as "siglas"
from ficha f 
inner join jornada j 
on f.fk_id_jornada = j.id_jornada order by siglas; 

 