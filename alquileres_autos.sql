-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 23, 2021 at 01:48 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alquileres_autos`
--
CREATE DATABASE IF NOT EXISTS `alquileres_autos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `alquileres_autos`;

-- --------------------------------------------------------

--
-- Table structure for table `alquileres`
--
-- Creation: Jan 13, 2021 at 05:52 PM
--

DROP TABLE IF EXISTS `alquileres`;
CREATE TABLE `alquileres` (
  `idAlquiler` int(8) NOT NULL,
  `costoPorDaños` float NOT NULL,
  `costoDevolucionTardia` float NOT NULL,
  `costoPorTanqueSinLlenar` float NOT NULL,
  `importeAcordado` float NOT NULL,
  `precioDiario` float NOT NULL,
  `estadoAlquiler` varchar(15) NOT NULL,
  `fechaHoraRetiroPrevisto` date NOT NULL,
  `fechaHoraDevolucionPrevista` date NOT NULL,
  `fechaHoraRetiroReal` date DEFAULT NULL,
  `fechaHoraDevolucionReal` date DEFAULT NULL,
  `idModelo` int(8) NOT NULL,
  `idSucursal` int(8) NOT NULL,
  `cuil` varchar(20) NOT NULL,
  `idPlan` int(8) NOT NULL,
  `patente` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `alquileres`:
--   `patente`
--       `autos` -> `patente`
--   `idModelo`
--       `modelos` -> `idModelo`
--   `idPlan`
--       `planesDePago` -> `idPlan`
--   `idSucursal`
--       `sucursales` -> `idSucursal`
--   `cuil`
--       `usuarios` -> `cuil`
--

--
-- Dumping data for table `alquileres`
--

INSERT INTO `alquileres` (`idAlquiler`, `costoPorDaños`, `costoDevolucionTardia`, `costoPorTanqueSinLlenar`, `importeAcordado`, `precioDiario`, `estadoAlquiler`, `fechaHoraRetiroPrevisto`, `fechaHoraDevolucionPrevista`, `fechaHoraRetiroReal`, `fechaHoraDevolucionReal`, `idModelo`, `idSucursal`, `cuil`, `idPlan`, `patente`) VALUES
(2, 600, 120, 100, 2000, 150, 'cancelado', '2020-11-11', '2020-11-17', NULL, NULL, 3, 2, '25407896546', 2, 'aa123bb'),
(3, 500, 250, 1000, 2000, 150, 'reservado', '2020-11-27', '2020-11-29', NULL, NULL, 5, 1, '25407896546', 3, 'aa123cc'),
(12, 500, 250, 300, 300, 300, 'abierto', '2020-11-24', '2020-11-30', '2020-11-24', '2020-11-30', 4, 1, '25407896546', 2, 'aa123cc'),
(13, 500, 500, 500, 500, 500, 'inspeccion', '2020-11-01', '2020-11-09', '2020-11-01', '2020-11-09', 4, 1, '20378303355', 2, 'aa123cc'),
(14, 600, 600, 600, 600, 600, 'cerrado', '2020-11-01', '2020-11-08', '2020-11-01', '2020-11-08', 16, 1, '20378303355', 2, 'aa123dd');

-- --------------------------------------------------------

--
-- Table structure for table `autos`
--
-- Creation: Jan 04, 2021 at 09:30 PM
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
-- RELATIONSHIPS FOR TABLE `autos`:
--   `idModelo`
--       `modelos` -> `idModelo`
--   `idSucursal`
--       `sucursales` -> `idSucursal`
--

--
-- Dumping data for table `autos`
--

INSERT INTO `autos` (`patente`, `estado`, `capacidadTanque`, `kilometraje`, `fechaDeCompra`, `fechaUltimoServicio`, `idModelo`, `idSucursal`) VALUES
('aa123bb', 'disponible', 40, 335, '2020-12-01', '2020-12-01', 2, 1),
('aa123cc', 'disponible', 33, 22, '2020-11-08', NULL, 3, 1),
('aa123dd', 'disponible', 50, 500, '2020-12-04', NULL, 16, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cantidades`
--
-- Creation: Jan 04, 2021 at 09:30 PM
--

DROP TABLE IF EXISTS `cantidades`;
CREATE TABLE `cantidades` (
  `idCantidad` int(8) NOT NULL,
  `cantidad` int(8) NOT NULL,
  `idAlquiler` int(8) NOT NULL,
  `idExtra` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `cantidades`:
--   `idAlquiler`
--       `alquileres` -> `idAlquiler`
--   `idExtra`
--       `extras` -> `idExtra`
--

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--
-- Creation: Jan 04, 2021 at 09:30 PM
--

DROP TABLE IF EXISTS `extras`;
CREATE TABLE `extras` (
  `idExtra` int(8) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `extras`:
--

-- --------------------------------------------------------

--
-- Table structure for table `localidades`
--
-- Creation: Jan 04, 2021 at 09:30 PM
--

DROP TABLE IF EXISTS `localidades`;
CREATE TABLE `localidades` (
  `codigoPostal` int(8) NOT NULL,
  `denominacion` varchar(30) NOT NULL,
  `idProvincia` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `localidades`:
--   `idProvincia`
--       `provincias` -> `idProvincia`
--

--
-- Dumping data for table `localidades`
--

INSERT INTO `localidades` (`codigoPostal`, `denominacion`, `idProvincia`) VALUES
(1998, 'Campana', 3),
(2000, 'Rosario', 1),
(2154, 'Capitan Bermudez', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modelos`
--
-- Creation: Jan 13, 2021 at 09:59 PM
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
-- RELATIONSHIPS FOR TABLE `modelos`:
--   `idTipo`
--       `tiposAuto` -> `idTipo`
--

--
-- Dumping data for table `modelos`
--

INSERT INTO `modelos` (`idModelo`, `cantEquipajeGrande`, `cantEquipajeChico`, `precioPorDia`, `denominacion`, `transmision`, `aireAcondicionado`, `fotoModelo`, `cantPasajeros`, `idTipo`) VALUES
(2, 1, 1, 300, 'Ford Ka', 'manual', 'si', 'IMAGENES/Modelos/ford-ka.jpg', 6, 2),
(3, 2, 3, 1500, 'Renault Logan', 'automatica', 'si', 'IMAGENES/Modelos/chev_joy.jpg', 5, 3),
(4, 2, 3, 2500, 'chate re grande', 'automatica', 'si', 'IMAGENES/Modelos/chev_joy.jpg', 6, 4),
(5, 1, 1, 3000, 'chata', 'manual', 'si', 'IMAGENES/Modelos/chev_joy.jpg', 5, 2),
(16, 1, 2, 500, 'Chevrolet Celta', 'manual', 'si', 'IMAGENES/Modelos/ford-ka.jpg', 4, 2),
(21, 1, 1, 600, 'ford kk', 'manual', 'si', 'IMAGENES/Modelos/ford-ka.jpg', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `planesDePago`
--
-- Creation: Jan 04, 2021 at 09:30 PM
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
-- RELATIONSHIPS FOR TABLE `planesDePago`:
--

--
-- Dumping data for table `planesDePago`
--

INSERT INTO `planesDePago` (`idPlan`, `nombrePlan`, `entidadCrediticia`, `nombreTarjeta`, `cantCuotas`) VALUES
(1, 'ViajaYa', 'Banco Patagonia', 'MasterCard', 3),
(2, 'ViajaYa', 'Banco Patagonia', 'MasterCard', 6),
(3, 'ViajaYa', 'Banco Patagonia', 'MasterCard', 9);

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--
-- Creation: Jan 04, 2021 at 09:30 PM
--

DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `idProvincia` int(8) NOT NULL,
  `denominacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `provincias`:
--

--
-- Dumping data for table `provincias`
--

INSERT INTO `provincias` (`idProvincia`, `denominacion`) VALUES
(1, 'Santa Fe'),
(2, 'Cordoba'),
(3, 'Buenos Aires'),
(4, 'Entre Rios'),
(5, 'Tucuman'),
(6, 'Neuquen');

-- --------------------------------------------------------

--
-- Table structure for table `sucursales`
--
-- Creation: Jan 04, 2021 at 09:30 PM
--

DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE `sucursales` (
  `idSucursal` int(8) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `denominacion` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `horaApertura` time NOT NULL,
  `horaCierre` time NOT NULL,
  `costoEntregaFueraHora` float NOT NULL,
  `codigoPostal` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `sucursales`:
--   `codigoPostal`
--       `localidades` -> `codigoPostal`
--

--
-- Dumping data for table `sucursales`
--

INSERT INTO `sucursales` (`idSucursal`, `telefono`, `denominacion`, `direccion`, `horaApertura`, `horaCierre`, `costoEntregaFueraHora`, `codigoPostal`) VALUES
(1, '3416407899', 'AutoYA', 'Tucuman 308', '08:00:00', '18:00:00', 550, 2154),
(2, '341341134', 'TuAutoTuLugar', 'San Luis 2020', '07:30:00', '19:00:00', 1000, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `tiposAuto`
--
-- Creation: Jan 04, 2021 at 09:30 PM
--

DROP TABLE IF EXISTS `tiposAuto`;
CREATE TABLE `tiposAuto` (
  `idTipo` int(8) NOT NULL,
  `nombreTipo` varchar(30) NOT NULL,
  `fotoTipo` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `tiposAuto`:
--

--
-- Dumping data for table `tiposAuto`
--

INSERT INTO `tiposAuto` (`idTipo`, `nombreTipo`, `fotoTipo`) VALUES
(1, 'mini o pequeños', NULL),
(2, 'compactos', NULL),
(3, 'medianos', NULL),
(4, 'grande', NULL),
(5, 're-grande', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--
-- Creation: Jan 13, 2021 at 09:19 PM
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `cuil` varchar(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `calle` varchar(30) NOT NULL,
  `piso` int(4) DEFAULT NULL,
  `dpto` varchar(10) DEFAULT NULL,
  `codigoPostal` int(15) NOT NULL,
  `numUltTarjeta` varchar(30) DEFAULT NULL,
  `nombreUtlTarjeta` varchar(30) DEFAULT NULL,
  `vencUltTarjeta` date DEFAULT NULL,
  `rol` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `usuarios`:
--   `codigoPostal`
--       `localidades` -> `codigoPostal`
--

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`cuil`, `nombre`, `apellido`, `telefono`, `mail`, `calle`, `piso`, `dpto`, `codigoPostal`, `numUltTarjeta`, `nombreUtlTarjeta`, `vencUltTarjeta`, `rol`, `password`) VALUES
('20378303355', 'pablo', 'nardi', '3416497800', 'pnardi@gmail.com', 'tucuman 308', NULL, NULL, 2154, NULL, NULL, NULL, 'administrador', 'pablo1234'),
('25407896546', 'Juan', 'Perez', '654654654', 'jperez@hotmail.com', 'catamarca 239', NULL, NULL, 2000, NULL, NULL, NULL, 'usuario', 'juan0987'),
('986', 'jesus', 'monti', '987', 'asd@mail.com', 'ill', 0, '', 2154, NULL, NULL, NULL, 'administrador', 'monti');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alquileres`
--
ALTER TABLE `alquileres`
  ADD PRIMARY KEY (`idAlquiler`),
  ADD KEY `alquiler_fk_modelo` (`idModelo`),
  ADD KEY `alquiler_fk_plan_pago` (`idPlan`),
  ADD KEY `alquiler_fk_usuario` (`cuil`),
  ADD KEY `alquiler_fk_sucursal` (`idSucursal`),
  ADD KEY `alquiler_fk_auto` (`patente`);

--
-- Indexes for table `autos`
--
ALTER TABLE `autos`
  ADD PRIMARY KEY (`patente`),
  ADD KEY `auto_fk_modelo` (`idModelo`),
  ADD KEY `auto_fk_sucursal` (`idSucursal`);

--
-- Indexes for table `cantidades`
--
ALTER TABLE `cantidades`
  ADD PRIMARY KEY (`idCantidad`),
  ADD KEY `cantidad_fk_alquiler` (`idAlquiler`),
  ADD KEY `cantidad_fk_extra` (`idExtra`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`idExtra`);

--
-- Indexes for table `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`codigoPostal`),
  ADD KEY `localidad_fk_provincia` (`idProvincia`);

--
-- Indexes for table `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`idModelo`),
  ADD KEY `modelo_fk_tipo_auto` (`idTipo`);

--
-- Indexes for table `planesDePago`
--
ALTER TABLE `planesDePago`
  ADD PRIMARY KEY (`idPlan`);

--
-- Indexes for table `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idProvincia`);

--
-- Indexes for table `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`idSucursal`),
  ADD KEY `sucursal_fk_localidad` (`codigoPostal`);

--
-- Indexes for table `tiposAuto`
--
ALTER TABLE `tiposAuto`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cuil`),
  ADD KEY `usuario_fk_localidad` (`codigoPostal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alquileres`
--
ALTER TABLE `alquileres`
  MODIFY `idAlquiler` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cantidades`
--
ALTER TABLE `cantidades`
  MODIFY `idCantidad` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `idExtra` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modelos`
--
ALTER TABLE `modelos`
  MODIFY `idModelo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `planesDePago`
--
ALTER TABLE `planesDePago`
  MODIFY `idPlan` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idProvincia` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `idSucursal` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tiposAuto`
--
ALTER TABLE `tiposAuto`
  MODIFY `idTipo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alquileres`
--
ALTER TABLE `alquileres`
  ADD CONSTRAINT `alquiler_fk_auto` FOREIGN KEY (`patente`) REFERENCES `autos` (`patente`),
  ADD CONSTRAINT `alquiler_fk_modelo` FOREIGN KEY (`idModelo`) REFERENCES `modelos` (`idModelo`),
  ADD CONSTRAINT `alquiler_fk_plan_pago` FOREIGN KEY (`idPlan`) REFERENCES `planesDePago` (`idPlan`),
  ADD CONSTRAINT `alquiler_fk_sucursal` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`),
  ADD CONSTRAINT `alquiler_fk_usuario` FOREIGN KEY (`cuil`) REFERENCES `usuarios` (`cuil`);

--
-- Constraints for table `autos`
--
ALTER TABLE `autos`
  ADD CONSTRAINT `auto_fk_modelo` FOREIGN KEY (`idModelo`) REFERENCES `modelos` (`idModelo`),
  ADD CONSTRAINT `auto_fk_sucursal` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`);

--
-- Constraints for table `cantidades`
--
ALTER TABLE `cantidades`
  ADD CONSTRAINT `cantidad_fk_alquiler` FOREIGN KEY (`idAlquiler`) REFERENCES `alquileres` (`idAlquiler`),
  ADD CONSTRAINT `cantidad_fk_extra` FOREIGN KEY (`idExtra`) REFERENCES `extras` (`idExtra`);

--
-- Constraints for table `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `localidad_fk_provincia` FOREIGN KEY (`idProvincia`) REFERENCES `provincias` (`idProvincia`);

--
-- Constraints for table `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `modelo_fk_tipo_auto` FOREIGN KEY (`idTipo`) REFERENCES `tiposAuto` (`idTipo`);

--
-- Constraints for table `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `sucursal_fk_localidad` FOREIGN KEY (`codigoPostal`) REFERENCES `localidades` (`codigoPostal`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuario_fk_localidad` FOREIGN KEY (`codigoPostal`) REFERENCES `localidades` (`codigoPostal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
