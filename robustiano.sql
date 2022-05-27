-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-05-2022 a las 10:33:54
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `robustiano`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbls_dlc`
--

DROP TABLE IF EXISTS `tbls_dlc`;
CREATE TABLE IF NOT EXISTS `tbls_dlc` (
  `codigo` int UNSIGNED NOT NULL,
  `videojuego` int UNSIGNED NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `precio` int DEFAULT '0',
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_amigos`
--

DROP TABLE IF EXISTS `tbl_amigos`;
CREATE TABLE IF NOT EXISTS `tbl_amigos` (
  `usuario` varchar(20) NOT NULL,
  `amigo` varchar(20) NOT NULL,
  PRIMARY KEY (`usuario`,`amigo`),
  KEY `amigo` (`amigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categorias`
--

DROP TABLE IF EXISTS `tbl_categorias`;
CREATE TABLE IF NOT EXISTS `tbl_categorias` (
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria_videojuego`
--

DROP TABLE IF EXISTS `tbl_categoria_videojuego`;
CREATE TABLE IF NOT EXISTS `tbl_categoria_videojuego` (
  `categoria` varchar(50) NOT NULL,
  `videojuego` int UNSIGNED NOT NULL,
  PRIMARY KEY (`categoria`,`videojuego`),
  KEY `videojuego` (`videojuego`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_comentarios`
--

DROP TABLE IF EXISTS `tbl_comentarios`;
CREATE TABLE IF NOT EXISTS `tbl_comentarios` (
  `codigo` int UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `videojuego` int UNSIGNED NOT NULL,
  `comentario` text,
  PRIMARY KEY (`codigo`,`fecha`,`usuario`,`videojuego`),
  KEY `videojuego` (`videojuego`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_desarrolladores`
--

DROP TABLE IF EXISTS `tbl_desarrolladores`;
CREATE TABLE IF NOT EXISTS `tbl_desarrolladores` (
  `nombre` varchar(20) NOT NULL,
  `tipo` enum('indie','empresa','','') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contacto` varchar(200) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tbl_desarrolladores`
--

INSERT INTO `tbl_desarrolladores` (`nombre`, `tipo`, `contacto`) VALUES
('bychunai', 'indie', 'zzzz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_juegos_usuario`
--

DROP TABLE IF EXISTS `tbl_juegos_usuario`;
CREATE TABLE IF NOT EXISTS `tbl_juegos_usuario` (
  `usuario` varchar(20) NOT NULL,
  `videojuego` int UNSIGNED NOT NULL,
  `fechaCompra` date DEFAULT NULL,
  PRIMARY KEY (`usuario`,`videojuego`),
  KEY `videojuego` (`videojuego`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tbl_juegos_usuario`
--

INSERT INTO `tbl_juegos_usuario` (`usuario`, `videojuego`, `fechaCompra`) VALUES
('unai', 1, '2022-05-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mensajes`
--

DROP TABLE IF EXISTS `tbl_mensajes`;
CREATE TABLE IF NOT EXISTS `tbl_mensajes` (
  `codigo` int UNSIGNED NOT NULL,
  `visto` tinyint(1) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `emisor` varchar(20) NOT NULL,
  `receptor` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo`,`emisor`,`receptor`),
  KEY `emisor` (`emisor`),
  KEY `receptor` (`receptor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tbl_mensajes`
--

INSERT INTO `tbl_mensajes` (`codigo`, `visto`, `fecha`, `emisor`, `receptor`) VALUES
(0, 1, '2022-05-25', 'bychunai', 'unai');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_multimedia`
--

DROP TABLE IF EXISTS `tbl_multimedia`;
CREATE TABLE IF NOT EXISTS `tbl_multimedia` (
  `codigo` int UNSIGNED NOT NULL,
  `videojuego` int UNSIGNED DEFAULT NULL,
  `tipo` enum('videos','imagenes') DEFAULT NULL,
  `ruta` text,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

DROP TABLE IF EXISTS `tbl_usuarios`;
CREATE TABLE IF NOT EXISTS `tbl_usuarios` (
  `nombre` varchar(20) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `saldo` int DEFAULT '0',
  `fecha_inicio` date DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`nombre`, `contraseña`, `email`, `saldo`, `fecha_inicio`) VALUES
('bychunai', 'unai', 'ggg', 0, '2022-05-25'),
('unai', 'unai', 'ggg', 0, '2022-05-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_valoracion`
--

DROP TABLE IF EXISTS `tbl_valoracion`;
CREATE TABLE IF NOT EXISTS `tbl_valoracion` (
  `codigo` int UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `videojuego` int UNSIGNED NOT NULL,
  `valoracion` int DEFAULT '0',
  PRIMARY KEY (`codigo`,`fecha`,`usuario`,`videojuego`),
  KEY `videojuego` (`videojuego`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_videojuegos`
--

DROP TABLE IF EXISTS `tbl_videojuegos`;
CREATE TABLE IF NOT EXISTS `tbl_videojuegos` (
  `codigo` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` int NOT NULL,
  `desarrollador` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `desarrollador` (`desarrollador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tbl_videojuegos`
--

INSERT INTO `tbl_videojuegos` (`codigo`, `rating`, `nombre`, `descripcion`, `precio`, `desarrollador`) VALUES
(1, 3, 'assassins', 'asasas', 0, 'bychunai');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbls_dlc`
--
ALTER TABLE `tbls_dlc`
  ADD CONSTRAINT `tbls_dlc_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `tbl_videojuegos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_amigos`
--
ALTER TABLE `tbl_amigos`
  ADD CONSTRAINT `tbl_amigos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `tbl_usuarios` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_amigos_ibfk_2` FOREIGN KEY (`amigo`) REFERENCES `tbl_usuarios` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  ADD CONSTRAINT `tbl_categorias_ibfk_1` FOREIGN KEY (`nombre`) REFERENCES `tbl_categoria_videojuego` (`categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_categoria_videojuego`
--
ALTER TABLE `tbl_categoria_videojuego`
  ADD CONSTRAINT `tbl_categoria_videojuego_ibfk_1` FOREIGN KEY (`videojuego`) REFERENCES `tbl_videojuegos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_comentarios`
--
ALTER TABLE `tbl_comentarios`
  ADD CONSTRAINT `tbl_comentarios_ibfk_1` FOREIGN KEY (`videojuego`) REFERENCES `tbl_videojuegos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_comentarios_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `tbl_usuarios` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_desarrolladores`
--
ALTER TABLE `tbl_desarrolladores`
  ADD CONSTRAINT `tbl_desarrolladores_ibfk_1` FOREIGN KEY (`nombre`) REFERENCES `tbl_usuarios` (`nombre`);

--
-- Filtros para la tabla `tbl_juegos_usuario`
--
ALTER TABLE `tbl_juegos_usuario`
  ADD CONSTRAINT `tbl_juegos_usuario_ibfk_1` FOREIGN KEY (`videojuego`) REFERENCES `tbl_videojuegos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_juegos_usuario_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `tbl_usuarios` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_mensajes`
--
ALTER TABLE `tbl_mensajes`
  ADD CONSTRAINT `tbl_mensajes_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `tbl_usuarios` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_mensajes_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `tbl_usuarios` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_multimedia`
--
ALTER TABLE `tbl_multimedia`
  ADD CONSTRAINT `tbl_multimedia_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `tbl_videojuegos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_valoracion`
--
ALTER TABLE `tbl_valoracion`
  ADD CONSTRAINT `tbl_valoracion_ibfk_1` FOREIGN KEY (`videojuego`) REFERENCES `tbl_videojuegos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_valoracion_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `tbl_usuarios` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_videojuegos`
--
ALTER TABLE `tbl_videojuegos`
  ADD CONSTRAINT `tbl_videojuegos_ibfk_1` FOREIGN KEY (`desarrollador`) REFERENCES `tbl_desarrolladores` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
