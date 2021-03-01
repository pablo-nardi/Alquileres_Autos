-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-03-2021 a las 02:09:52
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alquileres_autos`
--
CREATE DATABASE IF NOT EXISTS `alquileres_autos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `alquileres_autos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquileres`
--

DROP TABLE IF EXISTS `alquileres`;
CREATE TABLE `alquileres` (
  `idAlquiler` int(8) NOT NULL,
  `costoDesperfecto` double NOT NULL,
  `costoDevolucionTardia` double NOT NULL,
  `precioDiario` double NOT NULL,
  `estado` varchar(15) NOT NULL,
  `fecRetiroPrevista` date NOT NULL,
  `fecDevPrevista` date NOT NULL,
  `fecRetiroReal` date DEFAULT NULL,
  `fecDevReal` date DEFAULT NULL,
  `idModelo` int(8) NOT NULL,
  `idSucursal` int(8) NOT NULL,
  `cuil` varchar(20) NOT NULL,
  `idPlan` int(8) NOT NULL,
  `patente` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alquileres`
--

INSERT INTO `alquileres` (`idAlquiler`, `costoDesperfecto`, `costoDevolucionTardia`, `precioDiario`, `estado`, `fecRetiroPrevista`, `fecDevPrevista`, `fecRetiroReal`, `fecDevReal`, `idModelo`, `idSucursal`, `cuil`, `idPlan`, `patente`) VALUES
(2, 600, 120, 150, 'cancelado', '2020-11-11', '2020-11-17', NULL, NULL, 3, 2, '25407896546', 2, 'aa123bb'),
(3, 500, 250, 150, 'reservado', '2020-11-27', '2020-11-29', NULL, NULL, 5, 1, '25407896546', 3, 'aa123cc'),
(12, 500, 250, 300, 'abierto', '2020-11-24', '2020-11-30', '2020-11-24', '2020-11-30', 4, 1, '25407896546', 2, 'aa123cc'),
(13, 500, 500, 500, 'inspeccion', '2020-11-01', '2020-11-09', '2020-11-01', '2020-11-09', 4, 1, '20378303355', 2, 'aa123cc'),
(14, 600, 600, 600, 'cerrado', '2020-11-01', '2020-11-08', '2020-11-01', '2020-11-08', 16, 1, '20378303355', 2, 'aa123dd'),
(15, 330, 360, 300, 'reservado', '2021-03-02', '2021-03-04', NULL, NULL, 2, 1, '10', 1, 'generico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autos`
--

DROP TABLE IF EXISTS `autos`;
CREATE TABLE `autos` (
  `patente` varchar(8) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `capacidadTanque` float NOT NULL,
  `kilometraje` float NOT NULL,
  `fechaDeCompra` date NOT NULL,
  `fechaUltimoServicio` date DEFAULT NULL,
  `idModelo` int(8) NOT NULL,
  `idSucursal` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autos`
--

INSERT INTO `autos` (`patente`, `estado`, `capacidadTanque`, `kilometraje`, `fechaDeCompra`, `fechaUltimoServicio`, `idModelo`, `idSucursal`) VALUES
('aa123bb', 'disponible', 40, 335, '2020-12-01', '2020-12-01', 2, 2),
('aa123cc', 'disponible', 33, 22, '2020-11-08', '2021-01-27', 3, 1),
('aa123dd', 'disponible', 50, 500, '2021-01-12', '2021-01-13', 16, 1),
('aaa123ff', 'inhabilitado', 44, 200, '2021-01-05', NULL, 21, 1),
('generico', 'disponible', 0, 0, '2021-01-01', '2021-02-02', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cantidades`
--

DROP TABLE IF EXISTS `cantidades`;
CREATE TABLE `cantidades` (
  `idCantidad` int(8) NOT NULL,
  `cantidad` int(8) NOT NULL,
  `idAlquiler` int(8) NOT NULL,
  `idExtra` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extras`
--

DROP TABLE IF EXISTS `extras`;
CREATE TABLE `extras` (
  `idExtra` int(8) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `extras`
--

INSERT INTO `extras` (`idExtra`, `descripcion`, `precio`) VALUES
(1, 'choche bebe', 500),
(2, 'gps', 750),
(4, 'porta equipaje', 850.4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

DROP TABLE IF EXISTS `localidades`;
CREATE TABLE `localidades` (
  `codigoPostal` int(8) NOT NULL,
  `denominacion` varchar(30) NOT NULL,
  `idProvincia` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`codigoPostal`, `denominacion`, `idProvincia`) VALUES
(2000, 'Rosario', 1),
(2154, 'Capitan Bermudez', 1),
(3000, 'Campana', 3),
(3001, 'Zarate', 3),
(4000, 'Carlos Paz', 2),
(4001, 'Cordoba', 2),
(5000, 'Parana', 4),
(6000, 'Bariloche', 11),
(6001, 'El Bolson', 11),
(7000, 'San Juan', 13),
(8000, 'La Rioja', 15),
(9000, 'Tucumana', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

DROP TABLE IF EXISTS `modelos`;
CREATE TABLE `modelos` (
  `idModelo` int(8) NOT NULL,
  `cantEquipajeGrande` int(8) NOT NULL,
  `cantEquipajeChico` int(8) NOT NULL,
  `precioPorDia` float NOT NULL,
  `denominacion` varchar(30) NOT NULL,
  `transmision` varchar(30) NOT NULL,
  `aireAcondicionado` varchar(30) NOT NULL,
  `fotoModelo` varchar(50) DEFAULT NULL,
  `cantPasajeros` int(8) NOT NULL,
  `idTipo` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`idModelo`, `cantEquipajeGrande`, `cantEquipajeChico`, `precioPorDia`, `denominacion`, `transmision`, `aireAcondicionado`, `fotoModelo`, `cantPasajeros`, `idTipo`) VALUES
(2, 1, 1, 300, 'Ford Ka', 'manual', 'si', 'IMAGENES/Modelos/ford-ka.jpg', 6, 2),
(3, 2, 3, 1500, 'Renault Logan', 'automatica', 'si', 'IMAGENES/Modelos/renault-logan.jpg', 5, 3),
(4, 1, 2, 2500, 'chevrolet joy', 'automatica', 'si', 'IMAGENES/Modelos/chev_joy.jpg', 6, 2),
(5, 1, 1, 3000, 'chata', 'manual', 'si', 'IMAGENES/Modelos/toyota-hilux.jpg', 5, 2),
(16, 1, 2, 500, 'Chevrolet Celta', 'manual', 'si', 'IMAGENES/Modelos/ford-ka.jpg', 4, 2),
(21, 2, 3, 1200, 'ford mondeo', 'automatica', 'si', 'IMAGENES/Modelos/renault-logan.jpg', 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planesDePago`
--

DROP TABLE IF EXISTS `planesDePago`;
CREATE TABLE `planesDePago` (
  `idPlan` int(8) NOT NULL,
  `nombrePlan` varchar(30) NOT NULL,
  `entidadCrediticia` varchar(30) NOT NULL,
  `nombreTarjeta` varchar(30) NOT NULL,
  `cantCuotas` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `planesDePago`
--

INSERT INTO `planesDePago` (`idPlan`, `nombrePlan`, `entidadCrediticia`, `nombreTarjeta`, `cantCuotas`) VALUES
(1, 'ViajaYa', 'Banco Patagonia', 'MasterCard', 3),
(2, 'ViajaYa', 'Banco Patagonia', 'MasterCard', 6),
(3, 'ViajaYa', 'Banco Patagonia', 'MasterCard', 9),
(5, 'alquila seguro', 'banco santa fe', 'visa', 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `idProvincia` int(8) NOT NULL,
  `denominacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`idProvincia`, `denominacion`) VALUES
(1, 'Santa Fe'),
(2, 'Cordoba'),
(3, 'Buenos Aires'),
(4, 'Entre Rios'),
(11, 'Neuquen'),
(13, 'San Juan'),
(15, 'La Rioja'),
(17, 'Tucuman');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE `sucursales` (
  `idSucursal` int(8) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `denominacion` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `horaApertura` varchar(20) NOT NULL,
  `horaCierre` varchar(20) NOT NULL,
  `codigoPostal` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`idSucursal`, `telefono`, `denominacion`, `direccion`, `horaApertura`, `horaCierre`, `codigoPostal`) VALUES
(1, '3416407899', 'AutoYA', 'Tucuman 308', '08:00', '18:00:00', 2154),
(2, '341341134', 'TuAutoTuLugar', 'San Luis 2020', '07:00', '19:00:00', 2000),
(3, '0114948', 'RentaFacil', 'Campanita 308', '06:00', '18:00', 3000),
(5, '044123123', 'RentaCordoba', 'Junin 800', '07:30', '20:00', 4000),
(6, '123123123', 'Lamejor', 'Suipacha 222', '07:30', '16:30', 2000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposAuto`
--

DROP TABLE IF EXISTS `tiposAuto`;
CREATE TABLE `tiposAuto` (
  `idTipo` int(8) NOT NULL,
  `nombreTipo` varchar(30) NOT NULL,
  `fotoTipo` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tiposAuto`
--

INSERT INTO `tiposAuto` (`idTipo`, `nombreTipo`, `fotoTipo`) VALUES
(1, 'mini o pequeños', NULL),
(2, 'compactos', NULL),
(3, 'medianos', NULL),
(4, 'grande', NULL),
(8, 'Lujos', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `cuil` varchar(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `calle` varchar(30) NOT NULL,
  `piso` int(4) DEFAULT NULL,
  `dpto` varchar(10) DEFAULT NULL,
  `ciudad` varchar(45) NOT NULL,
  `codigoPostal` varchar(15) NOT NULL,
  `numUltTarjeta` varchar(30) DEFAULT NULL,
  `nomUltTarjeta` varchar(30) DEFAULT NULL,
  `vencUltTarjeta` varchar(10) DEFAULT NULL,
  `rol` varchar(15) NOT NULL,
  `password` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cuil`, `nombre`, `apellido`, `telefono`, `mail`, `calle`, `piso`, `dpto`, `ciudad`, `codigoPostal`, `numUltTarjeta`, `nomUltTarjeta`, `vencUltTarjeta`, `rol`, `password`) VALUES
('10', 'prueba', 'prueba', '10', 'asd@mail.com', 'prueba ', 0, '', 'prueba', '10', '123', 'asd', '2021-1', 'cliente', NULL),
('123', 'pru6', 'pru6', '234234', 'asd@mail.com', 'ccsd', 0, '', 'Cap bermudez', '2154', NULL, NULL, NULL, 'cliente', 'holahola'),
('20378303355', 'pablo', 'nardi', '3416497800', 'pnardi@gmail.com', 'tucuman 308', NULL, NULL, '', '2154', NULL, NULL, NULL, 'administrador', 'pablo1234'),
('234', 'prueba 3_', 'prueba 3_', '654654', 'asd@mail.com', 'ciu', 0, '', 'ciu', '654', NULL, NULL, NULL, 'usuario', 'pablonardi'),
('234234234', 'dani', 'debito', '234', 'asd@mail.com', 'calle', 80, '', 'Cap bermudez', '2154', NULL, NULL, NULL, 'usuario', 'danidani'),
('25407896546', 'Juan', 'Perez', '654654654', 'jperez@hotmail.com', 'catamarca 239', 0, 'null', '', '5000', NULL, NULL, NULL, 'usuario', 'juan0987'),
('46456', 'prueba 2', 'prueba 2', '234', 'asd@mail.com', 'casc', 0, '', 'Cap bermudez', '2154', NULL, NULL, NULL, 'administrador', 'pablo'),
('654654645', 'pru6', 'prupru', '123123', 'asd@mail.com', 'ameguino', 0, '', 'Baigorria', '2010', NULL, NULL, NULL, 'cliente', 'holahola'),
('999', 'pru5', 'pru5', '234234', 'asd@mail.com', 'sdf', 0, '', 'papa', '64', NULL, NULL, NULL, 'usuario', 'pablonardi');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquileres`
--
ALTER TABLE `alquileres`
  ADD PRIMARY KEY (`idAlquiler`),
  ADD KEY `alquiler_fk_modelo` (`idModelo`),
  ADD KEY `alquiler_fk_plan_pago` (`idPlan`),
  ADD KEY `alquiler_fk_usuario` (`cuil`),
  ADD KEY `alquiler_fk_sucursal` (`idSucursal`),
  ADD KEY `alquiler_fk_auto` (`patente`);

--
-- Indices de la tabla `autos`
--
ALTER TABLE `autos`
  ADD PRIMARY KEY (`patente`),
  ADD KEY `auto_fk_modelo` (`idModelo`),
  ADD KEY `auto_fk_sucursal` (`idSucursal`);

--
-- Indices de la tabla `cantidades`
--
ALTER TABLE `cantidades`
  ADD PRIMARY KEY (`idCantidad`),
  ADD KEY `cantidad_fk_alquiler` (`idAlquiler`),
  ADD KEY `cantidad_fk_extra` (`idExtra`);

--
-- Indices de la tabla `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`idExtra`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`codigoPostal`),
  ADD KEY `localidad_fk_provincia` (`idProvincia`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`idModelo`),
  ADD KEY `modelo_fk_tipo_auto` (`idTipo`);

--
-- Indices de la tabla `planesDePago`
--
ALTER TABLE `planesDePago`
  ADD PRIMARY KEY (`idPlan`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idProvincia`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`idSucursal`),
  ADD KEY `sucursal_fk_localidad` (`codigoPostal`);

--
-- Indices de la tabla `tiposAuto`
--
ALTER TABLE `tiposAuto`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cuil`),
  ADD KEY `usuario_fk_localidad` (`codigoPostal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquileres`
--
ALTER TABLE `alquileres`
  MODIFY `idAlquiler` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `cantidades`
--
ALTER TABLE `cantidades`
  MODIFY `idCantidad` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `extras`
--
ALTER TABLE `extras`
  MODIFY `idExtra` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `idModelo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `planesDePago`
--
ALTER TABLE `planesDePago`
  MODIFY `idPlan` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idProvincia` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `idSucursal` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tiposAuto`
--
ALTER TABLE `tiposAuto`
  MODIFY `idTipo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquileres`
--
ALTER TABLE `alquileres`
  ADD CONSTRAINT `alquiler_fk_auto` FOREIGN KEY (`patente`) REFERENCES `autos` (`patente`),
  ADD CONSTRAINT `alquiler_fk_modelo` FOREIGN KEY (`idModelo`) REFERENCES `modelos` (`idModelo`),
  ADD CONSTRAINT `alquiler_fk_plan_pago` FOREIGN KEY (`idPlan`) REFERENCES `planesDePago` (`idPlan`),
  ADD CONSTRAINT `alquiler_fk_sucursal` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`),
  ADD CONSTRAINT `alquiler_fk_usuario` FOREIGN KEY (`cuil`) REFERENCES `usuarios` (`cuil`);

--
-- Filtros para la tabla `autos`
--
ALTER TABLE `autos`
  ADD CONSTRAINT `auto_fk_modelo` FOREIGN KEY (`idModelo`) REFERENCES `modelos` (`idModelo`),
  ADD CONSTRAINT `auto_fk_sucursal` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`);

--
-- Filtros para la tabla `cantidades`
--
ALTER TABLE `cantidades`
  ADD CONSTRAINT `cantidad_fk_alquiler` FOREIGN KEY (`idAlquiler`) REFERENCES `alquileres` (`idAlquiler`),
  ADD CONSTRAINT `cantidad_fk_extra` FOREIGN KEY (`idExtra`) REFERENCES `extras` (`idExtra`);

--
-- Filtros para la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `localidad_fk_provincia` FOREIGN KEY (`idProvincia`) REFERENCES `provincias` (`idProvincia`);

--
-- Filtros para la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `modelo_fk_tipo_auto` FOREIGN KEY (`idTipo`) REFERENCES `tiposAuto` (`idTipo`);

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `sucursal_fk_localidad` FOREIGN KEY (`codigoPostal`) REFERENCES `localidades` (`codigoPostal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
