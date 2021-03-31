-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 31-03-2021 a las 22:06:39
-- Versión del servidor: 10.5.8-MariaDB
-- Versión de PHP: 7.4.14

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
(13, 500, 500, 500, 'abierto', '2020-11-01', '2020-11-09', '2021-03-20', '2020-11-09', 2, 1, '20378303355', 2, 'aa123bb'),
(14, 600, 600, 600, 'reservado', '2020-11-01', '2020-11-08', '2020-11-01', '2020-11-08', 2, 1, '20378303355', 12, 'generico'),
(15, 330, 360, 300, 'abierto', '2021-03-02', '2021-03-04', '2021-03-13', NULL, 2, 1, '10', 9, 'aa123bb'),
(16, 330, 360, 300, 'reservado', '2021-03-01', '2021-03-15', NULL, NULL, 2, 2, '100', 10, 'generico'),
(17, 330, 360, 300, 'reservado', '2021-03-17', '2021-03-27', NULL, NULL, 2, 2, '12', 1, 'generico'),
(18, 330, 360, 300, 'abierto', '2021-03-04', '2021-03-24', '2021-03-13', NULL, 2, 2, '14', 14, 'aa123bb'),
(19, 1650, 1800, 1500, 'abierto', '2021-03-19', '2021-03-25', '2021-03-13', NULL, 3, 1, '10', 1, 'aa123cc'),
(20, 330, 360, 300, 'abierto', '2021-03-19', '2021-03-31', '2021-03-30', NULL, 2, 2, '10', 5, 'aa123bb'),
(21, 330, 360, 300, 'reservado', '2021-03-27', '2021-04-02', NULL, NULL, 2, 2, '3333', 1, 'generico'),
(22, 330, 360, 300, 'abierto', '2021-03-13', '2021-03-31', '2021-03-13', NULL, 2, 2, '33333', 10, 'aa123bb'),
(23, 330, 360, 300, 'reservado', '2021-03-26', '2021-03-30', NULL, NULL, 2, 2, '10', 1, 'generico'),
(24, 330, 360, 300, 'reservado', '2021-03-28', '2021-03-31', NULL, NULL, 2, 2, '333333', 1, 'generico'),
(25, 330, 360, 300, 'reservado', '2021-03-19', '2021-03-24', NULL, NULL, 2, 2, '777', 1, 'generico'),
(26, 330, 360, 300, 'abierto', '2021-03-12', '2021-03-23', '2021-03-13', NULL, 2, 2, '10', 1, 'aa123bb'),
(27, 330, 360, 300, 'abierto', '2021-03-12', '2021-03-24', NULL, NULL, 2, 11, '321321456', 1, 'aa123bb'),
(28, 330, 360, 300, 'abierto', '2021-03-15', '2021-03-25', '2021-03-14', NULL, 2, 2, '111222333', 1, 'aa123bb'),
(29, 330, 360, 300, 'reservado', '2021-03-19', '2021-03-24', NULL, NULL, 2, 13, '10', 1, 'generico'),
(30, 330, 360, 300, 'abierto', '2021-03-29', '2021-03-31', '2021-03-28', NULL, 2, 2, '3737830', 13, 'aa123bb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler_conductor`
--

DROP TABLE IF EXISTS `alquiler_conductor`;
CREATE TABLE `alquiler_conductor` (
  `id` int(11) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `id_alquiler` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alquiler_conductor`
--

INSERT INTO `alquiler_conductor` (`id`, `dni`, `id_alquiler`) VALUES
(4, '37830335', 2),
(5, '111', 20),
(6, '55555', 26),
(7, '123', 15),
(9, '777', 27),
(10, '777', 22),
(11, '1414', 18),
(12, '777', 26),
(13, '777', 15),
(14, '777', 19),
(15, '777', 28),
(16, '37830335', 13),
(17, '777', 30),
(18, '77777776', 20);

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
('aa123cc', 'disponible', 33, 22, '2020-11-08', '2021-01-27', 3, 2),
('aa123dd', 'disponible', 50, 500, '2021-01-12', '2021-01-13', 16, 2),
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

--
-- Volcado de datos para la tabla `cantidades`
--

INSERT INTO `cantidades` (`idCantidad`, `cantidad`, `idAlquiler`, `idExtra`) VALUES
(1, 5, 2, 1),
(2, 10, 2, 4),
(3, 5, 2, 1),
(4, 3, 2, 2),
(5, 33, 2, 4),
(6, 3, 15, 1),
(7, 5, 2, 2),
(8, 5, 2, 2),
(9, 5, 27, 2),
(10, 2, 22, 1),
(11, 10, 22, 2),
(12, 1, 18, 1),
(13, 1, 18, 1),
(14, 10, 18, 1),
(15, 25, 28, 2),
(16, 25, 28, 4),
(17, 25, 28, 1),
(18, 1, 13, 1),
(19, 1, 13, 2),
(20, 1, 30, 2),
(21, 2, 20, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductores`
--

DROP TABLE IF EXISTS `conductores`;
CREATE TABLE `conductores` (
  `dni` varchar(15) NOT NULL,
  `nombreApellido` varchar(45) NOT NULL,
  `fecNac` date NOT NULL,
  `numLicencia` varchar(25) NOT NULL,
  `fecLicencia` date NOT NULL,
  `celular` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `conductores`
--

INSERT INTO `conductores` (`dni`, `nombreApellido`, `fecNac`, `numLicencia`, `fecLicencia`, `celular`, `mail`) VALUES
('111', 'beltrajp', '2021-03-04', '111', '2021-03-26', '111', 'asd@mail.com'),
('123', 'prueba', '2000-03-02', '123', '2021-03-03', '123', 'asd@mail.com'),
('1414', 'catorce', '1914-12-14', '1414', '1914-12-14', '1414', 'asd@mail.com'),
('321', 'beltrajp', '2021-03-11', '321', '2021-03-18', '321', 'asd@mail.com'),
('3210', 'beltrajp', '2021-03-11', '321', '2021-03-18', '321', 'asd@mail.com'),
('354', 'beltrajp', '2021-03-03', '456', '2021-03-19', '654', 'asd@mail.com'),
('37830335', 'pablo nardi', '1994-10-31', '44556677', '2018-06-15', '3416497888', 'asd@mail.com'),
('55555', 'beltrajp', '1995-03-17', '55555', '2018-03-20', '55555', 'asd@mail.com'),
('777', 'juan perez', '1995-12-25', '777', '2005-12-25', '777', 'asd@mail.com'),
('77777776', 'juan perez', '1998-12-10', '777', '2018-12-12', '777', 'asd@mail.com');

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
(8000, 'La Rioja', 15);

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
(2, 2, 1, 300, 'Ford Ka', 'manual', 'si', 'IMAGENES/Modelos/ford-ka.jpg', 6, 2),
(3, 2, 3, 1500, 'Renault Logan', 'automatica', 'si', 'IMAGENES/Modelos/otra-ferrari.jpg', 5, 3),
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
(5, 'alquila seguro', 'Banco Patagonia', 'visa', 3),
(7, 'alquila seguro', 'Banco Patagonia', 'visa', 6),
(8, 'alquila seguro', 'Banco Patagonia', 'visa', 9),
(9, 'Plan Nacional', 'Banco Santa fe', 'MasterCard', 3),
(10, 'Plan Nacional', 'Banco Santa fe', 'MasterCard', 6),
(11, 'Plan Nacional', 'Banco Santa fe', 'MasterCard', 9),
(12, 'Plan Nacional', 'Banco Santa fe', 'visa', 3),
(13, 'Plan Nacional', 'Banco Santa fe', 'visa', 6),
(14, 'Plan Nacional', 'Banco Santa fe', 'visa', 9);

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
(15, 'La Rioja');

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
(6, '123123123', 'Lamejor', 'Suipacha 222', '07:30', '16:30', 4001),
(9, '011564895', 'AutoYa', 'zarate 123', '08:00', '18:00', 3001),
(10, '354333879', 'AutoYa', 'Kempes 112', '09:30', '19:30', 5000),
(11, '65498754', 'RentaFacil', 'San carlo 3000', '07:30', '20:30', 6000),
(12, '6549877654', 'RentaFacil', 'San Juan 300', '06:30', '20:30', 6001),
(13, '654987456', 'Lamejor', 'Santo tome 288', '08:00', '20:00', 7000);

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
(8, 'Lujoso', NULL);

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
('10', 'prueba', 'prueba', '10', 'asd@mail.com', 'prueba ', 0, '', 'prueba', '10', '232345456767', 'Pablo Nardi', '2024-4', 'cliente', NULL),
('100', 'prueba', 'prueba', '10', 'asd@mail.com', 'prueba 123', 0, '', 'prueba', '10', '000', 'hola', '2029-4', 'cliente', NULL),
('111222333', 'prueba', 'prueba', '10', 'asd@mail.com', 'prueba 123', 0, '', 'prueba', '10', '654654', 'pablo', '2023-3', 'cliente', NULL),
('12', 'prueba', 'prueba', '10', 'asd@mail.com', 'prueba 123', 0, '', 'prueba', '10', '123', 'asd', '2021-1', 'cliente', NULL),
('123', 'pru6', 'pru6', '234234', 'asd@mail.com', 'ccsd', 0, '', 'Cap bermudez', '2154', NULL, NULL, NULL, 'cliente', 'holachau'),
('14', 'prueba', 'prueba', '10', 'asd@mail.com', 'prueba 12', 0, '', 'prueba', '10', '654', 'lll', '2021-1', 'cliente', NULL),
('20378303355', 'pablo', 'nardi', '3416497800', 'pnardi@gmail.com', 'tucuman 308', NULL, NULL, '', '2154', NULL, NULL, NULL, 'administrador', 'pablo1234'),
('234', 'prueba 3_', 'prueba 3_', '654654', 'asd@mail.com', 'ciu', 0, '', 'ciu', '654', NULL, NULL, NULL, 'usuario', 'pablonardi'),
('234234234', 'dani', 'debito', '234', 'asd@mail.com', 'calle', 80, '', 'Cap bermudez', '2154', NULL, NULL, NULL, 'usuario', 'danidani'),
('25407896546', 'Juan', 'Perez', '654654654', 'jperez@hotmail.com', 'catamarca 239', 0, 'null', '', '5000', NULL, NULL, NULL, 'usuario', 'juan0987'),
('321321456', 'prueba', 'prueba', '10', 'asd@mail.com', 'prueba 333', 0, '', 'prueba', '10', '000000000000000', 'pepe', '2024-4', 'cliente', NULL),
('3333', 'prueba', 'prueba', '10', 'asd@mail.com', 'prueba 234', 0, '', 'prueba', '10', '55555555', 'pepe pipi', '2024-6', 'cliente', NULL),
('33333', 'prueba', 'prueba', '10', 'asd@mail.com', 'prueba 12', 0, '', 'prueba', '10', '222222222', 'aaaaaaa', '2025-5', 'cliente', NULL),
('333333', 'prueba', 'prueba', '10', 'asd@mail.com', 'prueba 333333', 0, '', 'prueba', '10', '333333', 'eeeeee', '2024-4', 'cliente', NULL),
('3737830', 'jela', 'stick', '292929292', 'asd@mail.com', 'tucuman 300', 0, '', 'Cap bermudez', '2154', '22222222222', 'Pablo', '2022-2', 'cliente', NULL),
('46456', 'prueba 2', 'prueba 2', '234', 'asd@mail.com', 'casc', 0, '', 'Cap bermudez', '2154', NULL, NULL, NULL, 'administrador', 'pablo'),
('654654645', 'pru6', 'prupru', '123123', 'asd@mail.com', 'ameguino', 0, '', 'Baigorria', '2010', NULL, NULL, NULL, 'cliente', 'holachau'),
('777', 'prueba', 'prueba', '10', 'asd@mail.com', 'prueba 132', 0, '', 'prueba', '10', '777', 'siete', '2027-7', 'cliente', NULL),
('999', 'pru5', 'pru5', '234234', 'asd@mail.com', 'sdfsdf', 0, '', 'papa', '64', NULL, NULL, NULL, 'usuario', NULL);

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
-- Indices de la tabla `alquiler_conductor`
--
ALTER TABLE `alquiler_conductor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alqCon_fk_alquileres` (`id_alquiler`),
  ADD KEY `alqCon_fk_conductores` (`dni`);

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
-- Indices de la tabla `conductores`
--
ALTER TABLE `conductores`
  ADD PRIMARY KEY (`dni`);

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
  MODIFY `idAlquiler` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `alquiler_conductor`
--
ALTER TABLE `alquiler_conductor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `cantidades`
--
ALTER TABLE `cantidades`
  MODIFY `idCantidad` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `extras`
--
ALTER TABLE `extras`
  MODIFY `idExtra` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `idModelo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `planesDePago`
--
ALTER TABLE `planesDePago`
  MODIFY `idPlan` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idProvincia` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `idSucursal` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tiposAuto`
--
ALTER TABLE `tiposAuto`
  MODIFY `idTipo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- Filtros para la tabla `alquiler_conductor`
--
ALTER TABLE `alquiler_conductor`
  ADD CONSTRAINT `alqCon_fk_alquileres` FOREIGN KEY (`id_alquiler`) REFERENCES `alquileres` (`idAlquiler`),
  ADD CONSTRAINT `alqCon_fk_conductores` FOREIGN KEY (`dni`) REFERENCES `conductores` (`dni`);

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
