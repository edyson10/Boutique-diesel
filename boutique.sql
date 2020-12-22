-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-05-2019 a las 21:04:24
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `boutique`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `documento` varchar(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasenia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `nombres`, `apellidos`, `documento`, `correo`, `contrasenia`) VALUES
(1, 'Alexander', 'Peñaloza', '1090494143', 'luisalexanderpr@ufps.edu.co', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `productotalla` int(11) NOT NULL,
  `cantidadllevar` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'camisetas'),
(2, 'camisas'),
(3, 'polos'),
(4, 'busos'),
(5, 'shorts'),
(6, 'pantalones'),
(7, 'deportivo'),
(8, 'tops'),
(9, 'bikini'),
(10, 'vestidos'),
(11, 'faldas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `documento` varchar(10) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `contrasenia` varchar(100) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombres`, `apellidos`, `documento`, `correo`, `fechanacimiento`, `contrasenia`, `foto`, `direccion`) VALUES
(1, 'Alexander', 'Peñaloza', '1090494143', 'alexanderpenaloza3@gmail.com', '1994-02-06', 'VGVXZFBtaWw2VUhOOUVSY1BmWC9jdz09', 'vista/presentacion/assets/fotos_usuarios/9bf6f964b539c040793545c47862a026c70fcd7e.jpg', 'Cúcuta, Norte de Santander');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id`, `nombre`) VALUES
(1, 'Amarillo'),
(2, 'Azul'),
(3, 'Rojo'),
(4, 'Verde'),
(5, 'Morado'),
(6, 'Negro'),
(7, 'Blanco'),
(8, 'Gris'),
(9, 'Rosado'),
(10, 'Marrón'),
(11, 'Rayas'),
(12, 'Naranja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `productotalla` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `productotalla`, `cantidad`, `factura`) VALUES
(1, 2, 1, 1),
(2, 16, 1, 1),
(3, 5, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `estado`, `descripcion`) VALUES
(1, 'PENDIENTE', 'La compra se encuentra en espera de ser atendida.'),
(2, 'ATENDIDA', 'La compra esta lista y se esta dirigiendo al lugar de entrega.'),
(3, 'ENTREGADA', 'La compra ha sido entregada al cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `idtransaccion` varchar(100) NOT NULL,
  `tipopago` varchar(100) NOT NULL,
  `empresapago` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `total` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `cliente`, `idtransaccion`, `tipopago`, `empresapago`, `fecha`, `total`, `estado`) VALUES
(1, 1, '845575073', 'CREDIT_CARD', 'MASTERCARD', '2019-04-28', 102000, 1),
(2, 1, '845575170', 'CREDIT_CARD', 'MASTERCARD', '2019-04-27', 56000, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE `fotos` (
  `id` int(11) NOT NULL,
  `ruta` varchar(200) NOT NULL,
  `producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `fotos`
--

INSERT INTO `fotos` (`id`, `ruta`, `producto`) VALUES
(1, 'vista/presentacion/assets/img_productos/hombres/75d1a1d6584685a5a6a2bd2918e301dbcac9f9ad8731.jpg', 1),
(2, 'vista/presentacion/assets/img_productos/hombres/77b30e613e039dc890b3bd1d1d454b6496eb99d85642.jpg', 1),
(3, 'vista/presentacion/assets/img_productos/hombres/2e0ff1b974f41ab82e52fe443e0baedfefd6c9fc5843.jpg', 1),
(8, 'vista/presentacion/assets/img_productos/chicos/ceccf3b0c1327a215d6a36292c2f37306a07166e6601.jpg', 3),
(9, 'vista/presentacion/assets/img_productos/chicos/d6e9f532b24a9dfdeff8da73eac77e4fc375e6eb8852.jpg', 3),
(10, 'vista/presentacion/assets/img_productos/chicos/cf573c96b6d5a0960738495e2fab0eabc50aa4756613.jpg', 3),
(11, 'vista/presentacion/assets/img_productos/chicos/1b0328b03853f6d2ea46323ce6781bb5793bef925134.jpg', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre`) VALUES
(1, 'hombres'),
(2, 'mujeres'),
(3, 'niño'),
(4, 'niña');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `asunto` varchar(100) NOT NULL,
  `mensaje` text NOT NULL,
  `fechacreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `numero` varchar(100) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `fechacreacion` date DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `categoria` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `genero` int(11) NOT NULL,
  `tela` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `numero`, `nombre`, `descripcion`, `foto`, `precio`, `marca`, `fechacreacion`, `likes`, `categoria`, `color`, `genero`, `tela`) VALUES
(1, '354c528777ccf99438385ea650775ffd74186702', 'TIQUIS MIQUIS', 'Hecha 100% en tela suave, con un diseño urbano e interesante.', 'vista/presentacion/assets/img_perfil_Productos/hombres/fb3fecf868cd917afc57d5ac9598c78744e9c070.jpg', 56000, 'Adidas', '2019-03-25', 1, 1, 7, 1, 1),
(2, '76b6eec118430e639f92eb65d3652911c3b41430', 'Camisa Rayada', 'Camisa en tela de Jean con rayas blancas y azul claro.', 'vista/presentacion/assets/img_perfil_Productos/mujeres/e05be403d1efb786509326e3eeba9a6cef3d3060.jpg', 56000, 'Adidas', '2019-03-25', 0, 2, 11, 2, 1),
(3, 'c6baef1300b6e23bd62b1b48d9addd4e78fd0ae8', 'Vestido con Rosa', 'Vestido muy elegante para usar en fechas importantes.', 'vista/presentacion/assets/img_perfil_Productos/chicos/bc2d73033a0b5c931f150cdc7a6ffd3085fd7f46.jpg', 74000, 'IYEAL', '2019-03-25', 0, 10, 2, 4, 1),
(4, '3808c5b20b4b8b1596adceee94b9754e14a3633b', 'Elegant', 'Camisa elegante de vestir con cuello redondo y botones.', 'vista/presentacion/assets/img_perfil_Productos/chicos/065cf63280cd23027dae0f9e10a8ac5189855678.jpg', 45000, 'Adidas', '2019-03-25', 0, 2, 7, 3, 1),
(5, 'bf942d630f706c19e77935c12576d34ee6a2caee', 'Pantalón Callejero', 'Tiene rotos en las rodillas, juvenil, entubado  y sin bolsillos', 'vista/presentacion/assets/img_perfil_Productos/hombres/bc138c1b25f768570c54c1b050bcf0cbf7101ae4.jpg', 46000, 'STORM', '2019-04-03', 0, 6, 6, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productofavorito`
--

CREATE TABLE `productofavorito` (
  `id` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productofavorito`
--

INSERT INTO `productofavorito` (`id`, `cliente`, `producto`) VALUES
(6, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productotalla`
--

CREATE TABLE `productotalla` (
  `id` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `talla` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productotalla`
--

INSERT INTO `productotalla` (`id`, `producto`, `talla`, `cantidad`) VALUES
(1, 1, 25, 8),
(2, 1, 26, 12),
(3, 1, 27, 7),
(4, 1, 28, 12),
(5, 2, 2, 11),
(6, 2, 3, 5),
(7, 2, 4, 2),
(8, 3, 39, 0),
(9, 3, 40, 1),
(10, 3, 41, 1),
(11, 4, 48, 15),
(12, 4, 49, 6),
(13, 5, 30, 1),
(14, 5, 31, 1),
(15, 5, 32, 1),
(16, 5, 33, 0),
(17, 2, 1, 5),
(18, 2, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `id` int(11) NOT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `pecho` int(11) DEFAULT NULL,
  `cintura` int(11) DEFAULT NULL,
  `cadera` int(11) DEFAULT NULL,
  `genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `talla`
--

INSERT INTO `talla` (`id`, `numero`, `pecho`, `cintura`, `cadera`, `genero`) VALUES
(1, 'XS', 76, 58, 88, 2),
(2, 'S', 81, 63, 93, 2),
(3, 'M', 86, 68, 98, 2),
(4, 'L', 91, 73, 103, 2),
(5, 'XL', 96, 78, 108, 2),
(6, '4', NULL, 78, 88, 2),
(7, '5', NULL, 81, 91, 2),
(13, '6', NULL, 83, 93, 2),
(14, '7', NULL, 86, 96, 2),
(15, '8', NULL, 88, 98, 2),
(16, '9', NULL, 91, 101, 2),
(17, '10', NULL, 93, 103, 2),
(18, '12', NULL, 98, 108, 2),
(24, 'XS', 93, 77, 86, 1),
(25, 'S', 97, 82, 99, 1),
(26, 'M', 101, 87, 104, 1),
(27, 'L', 105, 92, 109, 1),
(28, 'XL', 109, 97, 114, 1),
(29, 'XXL', 113, 102, 118, 1),
(30, '28', NULL, 77, 94, 1),
(31, '30', NULL, 82, 99, 1),
(32, '31', NULL, 85, 102, 1),
(33, '32', NULL, 87, 104, 1),
(34, '33', NULL, 90, 107, 1),
(35, '34', NULL, 92, 109, 1),
(36, '36', NULL, 97, 114, 1),
(37, '4', 58, 55, 64, 4),
(38, '6', 62, 58, 67, 4),
(39, '8', 66, 60, 70, 4),
(40, '10', 69, 63, 73, 4),
(41, '12', 71, 65, 76, 4),
(42, '14', 74, 68, 79, 4),
(43, '16', 76, 70, 82, 4),
(44, '4', 55, 54, 59, 3),
(45, '6', 60, 58, 64, 3),
(46, '8', 65, 62, 69, 3),
(47, '10', 70, 66, 74, 3),
(48, '12', 73, 70, 78, 3),
(49, '14', 76, 74, 82, 3),
(50, '16', 79, 78, 85, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tela`
--

CREATE TABLE `tela` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `recomendaciones` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tela`
--

INSERT INTO `tela` (`id`, `nombre`, `recomendaciones`) VALUES
(1, 'Algodón', 'No usar cloro, No usar secadora, Lavar en lavadora a 30°C, No secar al sol'),
(2, 'Jean', 'No usar cloro, No usar secadora, Lavar en lavadora a 30°C, No secar al sol');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente` (`cliente`),
  ADD KEY `productotalla` (`productotalla`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factura` (`factura`),
  ADD KEY `productotalla` (`productotalla`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente` (`cliente`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id`,`producto`),
  ADD KEY `fk_fotos_producto_idx` (`producto`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`,`categoria`,`color`,`genero`,`tela`),
  ADD KEY `fk_producto_categoria1_idx` (`categoria`),
  ADD KEY `fk_producto_color1_idx` (`color`),
  ADD KEY `fk_producto_genero1_idx` (`genero`),
  ADD KEY `fk_producto_tela1_idx` (`tela`);

--
-- Indices de la tabla `productofavorito`
--
ALTER TABLE `productofavorito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto` (`producto`),
  ADD KEY `cliente` (`cliente`);

--
-- Indices de la tabla `productotalla`
--
ALTER TABLE `productotalla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `talla` (`talla`),
  ADD KEY `producto` (`producto`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`id`,`genero`),
  ADD KEY `fk_talla_genero1_idx` (`genero`);

--
-- Indices de la tabla `tela`
--
ALTER TABLE `tela`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productofavorito`
--
ALTER TABLE `productofavorito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productotalla`
--
ALTER TABLE `productotalla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `talla`
--
ALTER TABLE `talla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `tela`
--
ALTER TABLE `tela`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`productotalla`) REFERENCES `productotalla` (`id`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`factura`) REFERENCES `factura` (`id`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`productotalla`) REFERENCES `productotalla` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fk_fotos_producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_color1` FOREIGN KEY (`color`) REFERENCES `color` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_genero1` FOREIGN KEY (`genero`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`tela`) REFERENCES `tela` (`id`);

--
-- Filtros para la tabla `productofavorito`
--
ALTER TABLE `productofavorito`
  ADD CONSTRAINT `productofavorito_ibfk_1` FOREIGN KEY (`producto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `productofavorito_ibfk_2` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `productotalla`
--
ALTER TABLE `productotalla`
  ADD CONSTRAINT `productotalla_ibfk_1` FOREIGN KEY (`producto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `productotalla_ibfk_2` FOREIGN KEY (`talla`) REFERENCES `talla` (`id`);

--
-- Filtros para la tabla `talla`
--
ALTER TABLE `talla`
  ADD CONSTRAINT `fk_talla_genero1` FOREIGN KEY (`genero`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
