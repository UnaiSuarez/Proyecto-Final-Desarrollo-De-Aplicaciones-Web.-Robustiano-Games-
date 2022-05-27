-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-02-2021 a las 11:58:33
-- Versión del servidor: 8.0.22-0ubuntu0.20.04.2
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `videojuegos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas_componentes`
--

CREATE TABLE `caracteristicas_componentes` (
  `componentes` int UNSIGNED NOT NULL,
  `ordenador` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID` int UNSIGNED NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `subcategoria` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID`, `nombre`, `subcategoria`) VALUES
(11, 'Accion', 19),
(12, 'Aventura', NULL),
(13, 'Mundo abierto', NULL),
(14, 'Carreras', NULL),
(15, 'Estrategia', NULL),
(16, 'FPS', NULL),
(17, 'Simulacion', NULL),
(18, 'Construccion', NULL),
(19, 'Online', NULL),
(20, 'Offline', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_videojuego`
--

CREATE TABLE `categoria_videojuego` (
  `videojuego` int UNSIGNED NOT NULL,
  `categoria` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria_videojuego`
--

INSERT INTO `categoria_videojuego` (`videojuego`, `categoria`) VALUES
(1, 11),
(13, 12),
(1, 13),
(2, 13),
(4, 13),
(5, 13),
(8, 13),
(12, 13),
(3, 15),
(2, 16),
(3, 16),
(9, 16),
(7, 17),
(5, 19),
(13, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes`
--

CREATE TABLE `componentes` (
  `ID` int UNSIGNED NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `caracteristicas` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `componentes`
--

INSERT INTO `componentes` (`ID`, `nombre`, `caracteristicas`) VALUES
(1, '16Ram', NULL),
(2, 'RTX2060', NULL),
(3, 'i5', NULL),
(4, 'SSD', NULL),
(5, '100gb', NULL),
(6, 'RTX3090', NULL),
(7, '64 RAM', NULL),
(8, 'Ryzen', NULL),
(9, 'Windows 10', NULL),
(10, '6Gb GPU', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desarrollador`
--

CREATE TABLE `desarrollador` (
  `nombre` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contraseña` varchar(30) DEFAULT NULL,
  `tipo` enum('indi','empresa') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `desarrollador`
--

INSERT INTO `desarrollador` (`nombre`, `email`, `contraseña`, `tipo`) VALUES
('activision', 'activision@gmail.com', 'activision', 'empresa'),
('bethesda', 'bethesda@gmail.com', 'bethesda', 'empresa'),
('capcom', 'capcon@gmail.com', 'capcom', 'empresa'),
('CD projekt', 'cdprojekt@gmail.com', 'cdprojekt', 'empresa'),
('EA', 'ea@gmail.com', 'ea', 'empresa'),
('hello games', 'hellogames@gmail.com', 'hellogames', 'indi'),
('nintendo', 'nintendo@gmail.com', 'nintendo', 'empresa'),
('Rockstar', 'rockstar@gmail.com', 'rockstar', 'empresa'),
('ubisoft', 'ubisoft@gmail.com', 'ubisoft', 'empresa'),
('valhala cats', 'valhalacats@gmail.com', 'valhalacats', 'indi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DLC`
--

CREATE TABLE `DLC` (
  `ID` int UNSIGNED NOT NULL,
  `precio` int UNSIGNED DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `descripcion` text,
  `videojuego` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emision`
--

CREATE TABLE `emision` (
  `videojuego` int UNSIGNED NOT NULL,
  `jugador` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `emision`
--

INSERT INTO `emision` (`videojuego`, `jugador`) VALUES
(9, 'bombi'),
(1, 'bychunai'),
(5, 'bychunai'),
(1, 'isa'),
(2, 'juan'),
(4, 'juan'),
(6, 'juan'),
(13, 'juan'),
(10, 'marcos'),
(5, 'raluca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `jugador` varchar(30) NOT NULL,
  `ordenador` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`jugador`, `ordenador`) VALUES
('isa', 1),
('bombi', 2),
('raluca', 3),
('pepe', 4),
('marcos', 5),
('nelly', 6),
('bychunai', 7),
('juan', 8),
('gorka', 9),
('bychunai', 10),
('coral', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `errores`
--

CREATE TABLE `errores` (
  `ID` int UNSIGNED NOT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego_pertence`
--

CREATE TABLE `juego_pertence` (
  `videojuego` int UNSIGNED NOT NULL,
  `jugador` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `juego_pertence`
--

INSERT INTO `juego_pertence` (`videojuego`, `jugador`) VALUES
(1, 'bychunai'),
(2, 'bychunai'),
(3, 'bychunai'),
(13, 'gorka'),
(13, 'isa'),
(9, 'juan'),
(10, 'juan'),
(4, 'marcos'),
(7, 'marcos'),
(8, 'marcos'),
(11, 'marcos'),
(12, 'marcos'),
(5, 'nelly'),
(10, 'nelly'),
(12, 'nelly'),
(3, 'pepe'),
(6, 'pepe'),
(7, 'pepe'),
(1, 'raluca'),
(9, 'raluca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `nombre` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contraseña` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`nombre`, `email`, `contraseña`) VALUES
('bombi', 'bombi@gmail.com', 'bombilla'),
('bychunai', 'unai64535@gmail.com', 'patata'),
('coral', 'coral@gmail.com', 'skate'),
('Felipe', 'felipe@gmail.com', 'felipe'),
('gorka', 'gorka@gmail.com', 'playa'),
('isa', 'isa@gmail.com', 'baile'),
('juan', 'juan@gmail.com', 'piscina'),
('marcos', 'marcos@gmail.com', 'onepiece'),
('nelly', 'nelly@gmail.com', 'ordenador'),
('pepe', 'pepe@gmail.com', 'conejo'),
('raluca', 'raluca@gmail.com', 'chuches');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multimedia`
--

CREATE TABLE `multimedia` (
  `ID` int UNSIGNED NOT NULL,
  `tipo` enum('video','imagen') DEFAULT NULL,
  `valor` varchar(30) DEFAULT NULL,
  `videojuego` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `multimedia`
--

INSERT INTO `multimedia` (`ID`, `tipo`, `valor`, `videojuego`) VALUES
(161, 'video', 'video1', 1),
(162, 'video', 'video2', 1),
(163, 'imagen', 'imagen1', 9),
(164, 'imagen', 'imagen1', 2),
(165, 'imagen', 'imagen1', 9),
(166, 'imagen', 'imagen1', 2),
(173, 'video', 'imagen1', 7),
(174, 'imagen', 'imagen2', 13),
(175, 'video', 'video4', 13),
(176, 'imagen', 'imagen6', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenador`
--

CREATE TABLE `ordenador` (
  `codigo_serie` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ordenador`
--

INSERT INTO `ordenador` (`codigo_serie`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisitos`
--

CREATE TABLE `requisitos` (
  `componentes` int UNSIGNED NOT NULL,
  `videojuego` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguidores`
--

CREATE TABLE `seguidores` (
  `jugador1` varchar(30) NOT NULL,
  `jugador2` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `seguidores`
--

INSERT INTO `seguidores` (`jugador1`, `jugador2`) VALUES
('gorka', 'bombi'),
('isa', 'bombi'),
('gorka', 'coral'),
('isa', 'juan'),
('pepe', 'nelly'),
('bychunai', 'raluca'),
('isa', 'raluca'),
('juan', 'raluca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_errores`
--

CREATE TABLE `tabla_errores` (
  `error` int UNSIGNED NOT NULL,
  `videojuego` int UNSIGNED NOT NULL,
  `jugador` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `version`
--

CREATE TABLE `version` (
  `version` int UNSIGNED NOT NULL,
  `claveVersion` varchar(5) DEFAULT NULL,
  `descripcionVersion` text,
  `rutaAcceso` text,
  `publicaVersion` tinyint(1) DEFAULT NULL,
  `videojuego` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `version`
--

INSERT INTO `version` (`version`, `claveVersion`, `descripcionVersion`, `rutaAcceso`, `publicaVersion`, `videojuego`) VALUES
(1, '1.1', '1', '1', 1, 1),
(2, '1.2', '1', '1', 0, 1),
(3, '2.4', '2', '2', 1, 2),
(4, '1.3', '2', '2', 0, 2),
(5, '1.4', '33', '3', 1, 5),
(6, '1.12', '1', '1', 1, 3),
(7, '1.32', 'dfss', 'dfs', 1, 6),
(8, '2.32', 'regeregrg', 'gerge', 1, 11),
(9, '1.0', 'reyh', 'rtw', 1, 7),
(10, '1.1', 'wrth', 'ewr', 0, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuegos`
--

CREATE TABLE `videojuegos` (
  `codigo` int UNSIGNED NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `precio` int UNSIGNED DEFAULT NULL,
  `descripcion` text,
  `rating` int UNSIGNED DEFAULT NULL,
  `desarrollador` varchar(30) DEFAULT NULL,
  `fullRemote` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `videojuegos`
--

INSERT INTO `videojuegos` (`codigo`, `nombre`, `precio`, `descripcion`, `rating`, `desarrollador`, `fullRemote`) VALUES
(1, 'Assassin´s creed valhala', 60, 'Ponte en la piel de Eivor y lidera a tu clan desde los gélidos páramos de Noruega hasta un nuevo hogar en los exuberantes campos de la Inglaterra del siglo IX. Funda tu asentamiento, conquista esa tierra hostil cueste lo que cueste y gánate un lugar en el Valhalla.\r\n\r\nLa Inglaterra de la era vikinga es una nación fracturada, plagada de ruines señores feudales y reinos en guerra, pero bajo ese caos yace una tierra rica e indómita que aguarda a que alguien la conquiste.', 4, 'ubisoft', 1),
(2, 'Cyberpunk 2077', 60, 'Cyberpunk 2077 es una historia de acción y aventura en mundo abierto ambientada en Night City, una megalópolis obsesionada con el poder, el glamur y la modificación corporal. Tu personaje es V, un mercenario que persigue un implante único que permite alcanzar la inmortalidad. Podrás personalizar las mejoras cibernéticas, las habilidades y el estilo de juego del personaje para dar forma a un mundo y a una historia que depende de tus decisiones.', 1, 'CD projekt', 1),
(3, 'ghost recon breakpoint', 40, 'Ghost Recon: Breakpoint es un shooter militar ambientado en un mundo abierto misterioso, hostil y diverso, que podrás disfrutar solo o en modo cooperativo con hasta cuatro jugadores.', 10, 'ubisoft', 0),
(4, 'Watch Dogs: Legion', 50, 'En un futuro cercano, Londres afronta su colapso: un estado de vigilancia total oprime al pueblo, fuerzas militares privadas controlan las calles y un sindicato criminal muy poderoso abusa de los más vulnerables.', 3, 'ubisoft', 1),
(5, 'Grand theft auto 5', 70, 'En un futuro cercano, Londres afronta su colapso: un estado de vigilancia total oprime al pueblo, fuerzas militares privadas controlan las calles y un sindicato criminal muy poderoso abusa de los más vulnerables.', 2, 'Rockstar', 1),
(6, 'Red Dead Redemption 2', 70, 'De los creadores de Grand Theft Auto V y Red Dead Redemption, Red Dead Redemption 2 es una historia épica sobre la vida en América en el umbral de una nueva era. Red Dead Redemption 2 es un videojuego de acción-aventura western, en un mundo abierto y en perspectiva de primera y tercera persona, con componentes para un jugador y multijugador.', 5, 'Rockstar', 1),
(7, 'No Mas\'s Sky', 30, 'No Man’s Sky para PC es un juego de supervivencia de acción y aventuras, en el que el jugador toma la forma de un humanoide alienígena que aterriza tras estrellarse en un accidente, al que se le suministran los elementos básicos que necesita para sobrevivir, e incluso prosperar.', 22, 'hello games', 0),
(8, 'The Elder Scrolls V: Skyrim', 50, 'The Elder Scrolls V: Skyrim es un ARPG del tipo mundo abierto desarrollado por Bethesda Game Studios y publicado por Bethesda Softworks.', 12, 'bethesda', 0),
(9, 'Call od Duty: Modern Warfare', 60, 'Call of Duty: Modern Warfare es un videojuego de disparos en primera persona desarrollado por Infinity Ward y publicado por Activision. Es el decimosexto juego de la saga Call of Duty y es un reboot de la serie Modern Warfare.​​​ Fue lanzado el 25 de octubre de 2019.', 8, 'activision', 0),
(10, ' The Purring Quest', 10, 'Salta, escóndete, ataca, sube por las paredes y mantente limpio en un título donde el jugador será un gato. The Purring Quest es una aventura de plataformas y sigilo con una \"historia conmovedora y llena de humor\".', 32, 'valhala cats', 0),
(11, 'Monster Hunter: World', 50, 'Monster Hunter: World es un videojuego perteneciente al género de rol y acción, desarrollado y publicado por la empresa Capcom, siendo el sexto título principal de la franquicia de videojuegos Monster Hunter. El juego fue anunciado en la conferencia de Sony en la E3 2017.', 11, 'capcom', 1),
(12, 'Super mario odyssey', 60, 'Super Mario Odyssey es un videojuego de plataformas de mundo abierto para Nintendo Switch que se lanzó en Japón y los Estados Unidos el 27 de octubre de 2017. Es el decimonoveno título de la serie Super Mario y el séptimo juego de plataformas en 3D de Mario.', 7, 'nintendo', 0),
(13, 'Star Wars Jedi: Fallen Order', 60, 'Star Wars Jedi: Fallen Order es un videojuego de acción y aventura para un solo jugador desarrollado por Respawn Entertainment y publicado por Electronic Arts, ambientado en el universo de Star Wars está ambientado entre el Episodio lll: La Venganza de los Sith y el Episodio lV: Una Nueva Esperanza.', 6, 'EA', 1),
(74, 'the witcher 3: wild hunt', 60, 'The Witcher 3: Wild Hunt es un videojuego de rol desarrollado y publicado por la compañía polaca CD Projekt RED. Esta compañía es la desarrolladora mientras que la distribución corre a cargo de la Warner Bros. Interactive, en el caso de Norteamérica y Bandai Namco para Europa', 16, 'CD projekt', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicas_componentes`
--
ALTER TABLE `caracteristicas_componentes`
  ADD PRIMARY KEY (`componentes`,`ordenador`),
  ADD KEY `ordenador` (`ordenador`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `subcategoria` (`subcategoria`);

--
-- Indices de la tabla `categoria_videojuego`
--
ALTER TABLE `categoria_videojuego`
  ADD PRIMARY KEY (`videojuego`,`categoria`),
  ADD KEY `categoria` (`categoria`);

--
-- Indices de la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `desarrollador`
--
ALTER TABLE `desarrollador`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `DLC`
--
ALTER TABLE `DLC`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `videojuego` (`videojuego`);

--
-- Indices de la tabla `emision`
--
ALTER TABLE `emision`
  ADD PRIMARY KEY (`videojuego`,`jugador`),
  ADD KEY `jugador` (`jugador`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`jugador`,`ordenador`),
  ADD KEY `ordenador` (`ordenador`);

--
-- Indices de la tabla `errores`
--
ALTER TABLE `errores`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `juego_pertence`
--
ALTER TABLE `juego_pertence`
  ADD PRIMARY KEY (`videojuego`,`jugador`),
  ADD KEY `jugador` (`jugador`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `multimedia`
--
ALTER TABLE `multimedia`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `videojuego` (`videojuego`);

--
-- Indices de la tabla `ordenador`
--
ALTER TABLE `ordenador`
  ADD PRIMARY KEY (`codigo_serie`);

--
-- Indices de la tabla `requisitos`
--
ALTER TABLE `requisitos`
  ADD PRIMARY KEY (`componentes`,`videojuego`),
  ADD KEY `videojuego` (`videojuego`);

--
-- Indices de la tabla `seguidores`
--
ALTER TABLE `seguidores`
  ADD PRIMARY KEY (`jugador1`,`jugador2`),
  ADD KEY `jugador2` (`jugador2`);

--
-- Indices de la tabla `tabla_errores`
--
ALTER TABLE `tabla_errores`
  ADD PRIMARY KEY (`error`,`videojuego`,`jugador`),
  ADD KEY `videojuego` (`videojuego`),
  ADD KEY `jugador` (`jugador`);

--
-- Indices de la tabla `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`version`),
  ADD KEY `videojuego` (`videojuego`);

--
-- Indices de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `desarrollador` (`desarrollador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `componentes`
--
ALTER TABLE `componentes`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `DLC`
--
ALTER TABLE `DLC`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `errores`
--
ALTER TABLE `errores`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `multimedia`
--
ALTER TABLE `multimedia`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT de la tabla `tabla_errores`
--
ALTER TABLE `tabla_errores`
  MODIFY `error` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `version`
--
ALTER TABLE `version`
  MODIFY `version` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  MODIFY `codigo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caracteristicas_componentes`
--
ALTER TABLE `caracteristicas_componentes`
  ADD CONSTRAINT `caracteristicas_componentes_ibfk_1` FOREIGN KEY (`componentes`) REFERENCES `componentes` (`ID`),
  ADD CONSTRAINT `caracteristicas_componentes_ibfk_2` FOREIGN KEY (`ordenador`) REFERENCES `ordenador` (`codigo_serie`);

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`subcategoria`) REFERENCES `categoria` (`ID`);

--
-- Filtros para la tabla `categoria_videojuego`
--
ALTER TABLE `categoria_videojuego`
  ADD CONSTRAINT `categoria_videojuego_ibfk_1` FOREIGN KEY (`videojuego`) REFERENCES `videojuegos` (`codigo`),
  ADD CONSTRAINT `categoria_videojuego_ibfk_2` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`ID`);

--
-- Filtros para la tabla `DLC`
--
ALTER TABLE `DLC`
  ADD CONSTRAINT `DLC_ibfk_1` FOREIGN KEY (`videojuego`) REFERENCES `videojuegos` (`codigo`);

--
-- Filtros para la tabla `emision`
--
ALTER TABLE `emision`
  ADD CONSTRAINT `emision_ibfk_1` FOREIGN KEY (`videojuego`) REFERENCES `videojuegos` (`codigo`),
  ADD CONSTRAINT `emision_ibfk_2` FOREIGN KEY (`jugador`) REFERENCES `jugadores` (`nombre`);

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`jugador`) REFERENCES `jugadores` (`nombre`),
  ADD CONSTRAINT `equipos_ibfk_2` FOREIGN KEY (`ordenador`) REFERENCES `ordenador` (`codigo_serie`);

--
-- Filtros para la tabla `juego_pertence`
--
ALTER TABLE `juego_pertence`
  ADD CONSTRAINT `juego_pertence_ibfk_1` FOREIGN KEY (`videojuego`) REFERENCES `videojuegos` (`codigo`),
  ADD CONSTRAINT `juego_pertence_ibfk_2` FOREIGN KEY (`jugador`) REFERENCES `jugadores` (`nombre`);

--
-- Filtros para la tabla `multimedia`
--
ALTER TABLE `multimedia`
  ADD CONSTRAINT `multimedia_ibfk_1` FOREIGN KEY (`videojuego`) REFERENCES `videojuegos` (`codigo`);

--
-- Filtros para la tabla `requisitos`
--
ALTER TABLE `requisitos`
  ADD CONSTRAINT `requisitos_ibfk_1` FOREIGN KEY (`componentes`) REFERENCES `componentes` (`ID`),
  ADD CONSTRAINT `requisitos_ibfk_2` FOREIGN KEY (`videojuego`) REFERENCES `videojuegos` (`codigo`);

--
-- Filtros para la tabla `seguidores`
--
ALTER TABLE `seguidores`
  ADD CONSTRAINT `seguidores_ibfk_1` FOREIGN KEY (`jugador1`) REFERENCES `jugadores` (`nombre`),
  ADD CONSTRAINT `seguidores_ibfk_2` FOREIGN KEY (`jugador2`) REFERENCES `jugadores` (`nombre`);

--
-- Filtros para la tabla `tabla_errores`
--
ALTER TABLE `tabla_errores`
  ADD CONSTRAINT `tabla_errores_ibfk_1` FOREIGN KEY (`videojuego`) REFERENCES `videojuegos` (`codigo`),
  ADD CONSTRAINT `tabla_errores_ibfk_2` FOREIGN KEY (`jugador`) REFERENCES `jugadores` (`nombre`),
  ADD CONSTRAINT `tabla_errores_ibfk_3` FOREIGN KEY (`error`) REFERENCES `errores` (`ID`);

--
-- Filtros para la tabla `version`
--
ALTER TABLE `version`
  ADD CONSTRAINT `version_ibfk_1` FOREIGN KEY (`videojuego`) REFERENCES `videojuegos` (`codigo`);

--
-- Filtros para la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD CONSTRAINT `videojuegos_ibfk_1` FOREIGN KEY (`desarrollador`) REFERENCES `desarrollador` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
