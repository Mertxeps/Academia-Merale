-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-07-2023 a las 01:27:22
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `academia_merale`
--
DROP DATABASE IF EXISTS `academia_merale`;
CREATE DATABASE IF NOT EXISTS `academia_merale` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `academia_merale`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumno` int(11) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `finalizado` enum('Si','No') NOT NULL,
  `aprobado` enum('Si','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `DNI`, `finalizado`, `aprobado`) VALUES
(1, '23456789S', 'Si', 'Si'),
(2, '12345678Z', 'Si', 'Si'),
(3, '25847136J', 'Si', 'Si'),
(4, '98765432D', 'No', ''),
(5, '45678932F', 'No', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_cursos`
--

CREATE TABLE `alumnos_cursos` (
  `id_curso` int(11) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `fecha_inscripcion` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumnos_cursos`
--

INSERT INTO `alumnos_cursos` (`id_curso`, `DNI`, `fecha_inscripcion`) VALUES
(1, '12345678Z', '2022-12-05'),
(2, '23456789S', '2022-12-01'),
(3, '25847136J', '2022-12-07'),
(4, '98765432D', '2023-01-11'),
(5, '45678932F', '2023-01-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `denominacion` varchar(20) NOT NULL,
  `nivel` enum('A1','A2','B1','B2','C1') NOT NULL,
  `modalidad` enum('Online','Presencial','Semipresencial') NOT NULL,
  `dirigido_a` enum('Trabajadores','Desempleados') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_curso`, `denominacion`, `nivel`, `modalidad`, `dirigido_a`) VALUES
(1, 'Inglés', 'A1', 'Online', 'Desempleados'),
(2, 'Inglés', 'A2', 'Online', 'Desempleados'),
(3, 'Inglés', 'B1', 'Online', 'Desempleados'),
(4, 'Inglés', 'B2', 'Presencial', 'Desempleados'),
(5, 'Inglés', 'C1', 'Presencial', 'Desempleados'),
(6, 'Francés', 'A1', 'Online', 'Desempleados'),
(7, 'Francés', 'A2', 'Online', 'Desempleados'),
(8, 'Francés', 'B1', 'Online', 'Desempleados'),
(9, 'Francés', 'B2', 'Presencial', 'Desempleados'),
(10, 'Francés', 'C1', 'Presencial', 'Desempleados'),
(11, 'Alemán', 'A1', 'Online', 'Desempleados'),
(12, 'Alemán', 'A2', 'Online', 'Desempleados'),
(13, 'Alemán', 'B1', 'Online', 'Desempleados'),
(14, 'Alemán', 'B2', 'Presencial', 'Desempleados'),
(15, 'Alemán', 'C1', 'Presencial', 'Desempleados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id_inscripcion` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `curso` enum('Inglés','Francés','Alemán') NOT NULL,
  `fecha_Inscripcion` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id_inscripcion`, `id_curso`, `nombre`, `apellidos`, `telefono`, `email`, `curso`, `fecha_Inscripcion`) VALUES
(1, 12, 'Ricardo', 'Picaflor Ruíz', '666 589 743', 'ricardopicaru', 'Alemán', '2023-06-28'),
(2, 1, 'Alberto', 'Garcia Moyano', '627 859 463', 'albertogarmo@gmail.com', 'Inglés', '2023-06-29'),
(3, 1, 'Javier', 'Sánchez Lorca', '627 549 832', 'javiersanlor@gmail.com', 'Inglés', '2023-06-29'),
(4, 12, 'Alfredo', 'Casco Duro', '657 948 327', 'alfredcasdu@gmail.com', 'Alemán', '2023-06-29'),
(5, 12, 'Javier', 'Santillana Garcia', '937 967 834', 'Javisantigarcia@gmail.com', 'Alemán', '2023-06-30'),
(6, 6, 'Ainhoa', 'Garrido Suarez', '687 439 182', 'ainhoagarrisu@gmail.com', 'Francés', '2023-06-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `mail` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `DNI`, `nombre`, `apellidos`, `direccion`, `telefono`, `mail`) VALUES
(1, '12345678Z', 'Yo', 'Misma Soy', 'Cl. La mia 8', '555 555 555', 'yomismasoy@gmail.com'),
(2, '87654321B', 'Pepito', 'Grillo Grilloso', 'Cl. Pez 25', '915 565 323', 'pepitogrillo@gmail.com'),
(3, '23456789S', 'Ami', 'Nifu Nifa', 'Cl. Alabastro 95', '999 999 999', 'aminifunifa@gmail.com'),
(4, '98765432D', 'Alberto', 'Garcia López', 'Cl. La Suya 34', '222 222 222', 'albertogarcialopez@gmail.com'),
(5, '45678932F', 'Pedro', 'Ruíz Garcia', 'Cl. Alberto Alcocer 3', '851 236 987', 'perugar@gmail.com'),
(6, '65498723G', 'Alexander', 'Müller Schneider', 'Cl. La mia 8', '615 348 426', 'asmulschenaider@gmail.com'),
(7, '85246971H', 'John', 'Smith Castle', 'Cl. Islas Filipinas 5', '525 365 917', 'smithcasjohn@gmail.com'),
(8, '25847136J', 'Bernard', 'Martin Durang', 'Cl. Valencia 9', '627 923 481', 'bermardurang@gmail.com'),
(9, '95764831L', 'Peter', 'Fischer Schneider', 'Cl. Embajadores 35', '625 527 831', 'peterfischerschenaider@gmail.com'),
(10, '74896248B', 'George', 'Smith williams', 'Cl. Arenal 17', '617 958 364', 'georgewillsmith@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profesor` int(11) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `fecha_contrato` date NOT NULL DEFAULT current_timestamp(),
  `salario` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id_profesor`, `DNI`, `fecha_contrato`, `salario`) VALUES
(1, '25847136J', '2023-03-01', 1200),
(2, '95764831L', '2023-02-05', 1300),
(3, '85246971H', '2023-02-12', 1250),
(4, '65498723G', '2023-01-02', 1300),
(5, '74896248B', '2023-02-01', 1250);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores_cursos`
--

CREATE TABLE `profesores_cursos` (
  `id_curso` int(11) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `fecha_inicio` date NOT NULL DEFAULT current_timestamp(),
  `fecha_fin` date NOT NULL DEFAULT current_timestamp(),
  `horas` tinyint(4) UNSIGNED NOT NULL COMMENT 'Entre 120 y 240 horas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesores_cursos`
--

INSERT INTO `profesores_cursos` (`id_curso`, `DNI`, `fecha_inicio`, `fecha_fin`, `horas`) VALUES
(4, '74896248B', '2023-02-05', '2023-03-16', 120),
(5, '85246971H', '2023-07-02', '2023-09-21', 120),
(10, '25847136J', '2023-03-05', '2023-04-20', 120),
(13, '65498723G', '2023-01-15', '2023-03-05', 120),
(15, '95764831L', '2023-06-04', '2023-08-04', 120);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `autorizacion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `password`, `nombre`, `autorizacion`) VALUES
(1, 'yo@yo.com', '1234', 'Mertxe', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`),
  ADD KEY `dni` (`DNI`);

--
-- Indices de la tabla `alumnos_cursos`
--
ALTER TABLE `alumnos_cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `DNI` (`DNI`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `Inscrpcion` (`id_curso`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `DNI` (`DNI`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profesor`),
  ADD KEY `DNI` (`DNI`);

--
-- Indices de la tabla `profesores_cursos`
--
ALTER TABLE `profesores_cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `DNI` (`DNI`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `Usuario` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `alumnos_cursos`
--
ALTER TABLE `alumnos_cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id_profesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `profesores_cursos`
--
ALTER TABLE `profesores_cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `personas` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `alumnos_cursos`
--
ALTER TABLE `alumnos_cursos`
  ADD CONSTRAINT `alumnos_cursos_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `alumnos` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumnos_cursos_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `personas` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesores_cursos`
--
ALTER TABLE `profesores_cursos`
  ADD CONSTRAINT `profesores_cursos_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `profesores` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `profesores_cursos_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
