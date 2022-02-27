
CREATE SCHEMA `trabajo3`;
USE `trabajo3` ;

CREATE TABLE `trabajo3`.`cursos` (
  nombre_curso VARCHAR(100) PRIMARY KEY NOT NULL UNIQUE,
  curso_descripcion VARCHAR(200) NOT NULL,
  foto_profesor BLOB NOT NULL,
  profesor_descripcion VARCHAR(200) NOT NULL,
  precio FLOAT NOT NULL,
  horario TIME NOT NULL
  );


CREATE TABLE `trabajo3`.`alumnos` (
  alumno_nombre VARCHAR(100) PRIMARY KEY NOT NULL UNIQUE,
  celular CHAR(9) NOT NULL,
  DNI CHAR(8) NOT NULL,
  email VARCHAR(70) NOT NULL
  );

CREATE TABLE `trabajo3`.`profesor` (
  nombre_profesor VARCHAR(100) NOT NULL PRIMARY KEY UNIQUE,
  foto_profesor BLOB NOT NULL,
  profesor_descripcion VARCHAR(100) NOT NULL
  );




CREATE TABLE IF NOT EXISTS `trabajo3`.`cursos_has_alumnos` (
  cursos_nombre_curso2 VARCHAR(100) NOT NULL ,
  alumnos_alumno_nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (cursos_nombre_curso2, alumnos_alumno_nombre),
FOREIGN KEY (cursos_nombre_curso2) REFERENCES cursos(nombre_curso) ON DELETE CASCADE,
FOREIGN KEY (alumnos_alumno_nombre) REFERENCES alumnos(alumno_nombre) ON DELETE CASCADE
  

);

CREATE TABLE IF NOT EXISTS `trabajo3`.`cursos_has_profesor` (
  cursos_nombre_curso VARCHAR(100) NOT NULL ,
  alumnos_alumno_nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (cursos_nombre_curso, alumnos_alumno_nombre),
FOREIGN KEY (cursos_nombre_curso) REFERENCES cursos(nombre_curso) ON DELETE CASCADE,
FOREIGN KEY (alumnos_alumno_nombre) REFERENCES profesor(nombre_profesor) ON DELETE CASCADE
  

);

select * from cursos;

select * from profesor;
select* from alumnos;
select * from cursos_has_profesor;
select * from cursos_has_alumnos;

select alumnos_alumno_nombre from cursos_has_alumnos where cursos_nombre_curso2 = "Matemática";








-- no me salen las demás :( --


SELECT cursos_has_profesor.cursos_nombre_curso from cursos
INNER JOIN cursos_has_profesor
ON cursos.nombre_curso = cursos_has_profesor.cursos_nombre_curso
group by cursos_has_profesor.cursos_nombre_curso
having count(*)>1 ;
