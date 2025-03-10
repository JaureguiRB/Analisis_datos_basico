-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3300
-- Generation Time: Mar 10, 2025 at 02:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Table structure for table `autores`
--

CREATE TABLE `autores` (
  `ID_Autor` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `autores`
--

INSERT INTO `autores` (`ID_Autor`, `Nombre`, `Nacionalidad`, `Fecha_Nacimiento`) VALUES
(1, 'Gabriel García Márquez', 'Colombiana', '1927-03-06'),
(2, 'J.K. Rowling', 'Británica', '1965-07-31'),
(3, 'George Orwell', 'Británica', '1903-06-25');

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `ID_Categoria` int(11) NOT NULL,
  `Nombre_Categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`ID_Categoria`, `Nombre_Categoria`) VALUES
(1, 'Novelas'),
(2, 'Ciencia Ficción'),
(3, 'Fantasía'),
(4, 'Ensayo');

-- --------------------------------------------------------

--
-- Table structure for table `libros`
--

CREATE TABLE `libros` (
  `ID_Libro` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `ID_Autor` int(11) DEFAULT NULL,
  `ID_Categoria` int(11) DEFAULT NULL,
  `Año_Publicacion` int(11) DEFAULT NULL,
  `Disponible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `libros`
--

INSERT INTO `libros` (`ID_Libro`, `Titulo`, `ID_Autor`, `ID_Categoria`, `Año_Publicacion`, `Disponible`) VALUES
(1, 'Cien Años de Soledad', 1, 1, 1967, 1),
(2, 'Harry Potter y la Piedra Filosofal', 2, 3, 1997, 1),
(3, '1984', 3, 2, 1949, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prestamos`
--

CREATE TABLE `prestamos` (
  `ID_Prestamo` int(11) NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `ID_Libro` int(11) DEFAULT NULL,
  `Fecha_Prestamo` date DEFAULT NULL,
  `Fecha_Devolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prestamos`
--

INSERT INTO `prestamos` (`ID_Prestamo`, `ID_Usuario`, `ID_Libro`, `Fecha_Prestamo`, `Fecha_Devolucion`) VALUES
(1, 1, 1, '2024-08-01', '2024-08-15'),
(2, 2, 2, '2024-08-02', '2024-08-16');

-- --------------------------------------------------------

--
-- Table structure for table `prestamos_usuarios`
--

CREATE TABLE `prestamos_usuarios` (
  `ID_Relacion` int(11) NOT NULL,
  `ID_Prestamo` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuario`, `Nombre`, `Direccion`, `Telefono`) VALUES
(1, 'Carlos Martínez', 'Calle Luna, 123', '123456'),
(2, 'Lucía Fernández', 'Transversal 18D', '87654321');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`ID_Autor`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indexes for table `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID_Libro`),
  ADD KEY `ID_Autor` (`ID_Autor`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indexes for table `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_Prestamo`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Libro` (`ID_Libro`);

--
-- Indexes for table `prestamos_usuarios`
--
ALTER TABLE `prestamos_usuarios`
  ADD PRIMARY KEY (`ID_Relacion`),
  ADD KEY `ID_Prestamo` (`ID_Prestamo`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autores`
--
ALTER TABLE `autores`
  MODIFY `ID_Autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `libros`
--
ALTER TABLE `libros`
  MODIFY `ID_Libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `ID_Prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prestamos_usuarios`
--
ALTER TABLE `prestamos_usuarios`
  MODIFY `ID_Relacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`ID_Autor`) REFERENCES `autores` (`ID_Autor`),
  ADD CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`);

--
-- Constraints for table `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`ID_Libro`) REFERENCES `libros` (`ID_Libro`);

--
-- Constraints for table `prestamos_usuarios`
--
ALTER TABLE `prestamos_usuarios`
  ADD CONSTRAINT `prestamos_usuarios_ibfk_1` FOREIGN KEY (`ID_Prestamo`) REFERENCES `prestamos` (`ID_Prestamo`),
  ADD CONSTRAINT `prestamos_usuarios_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
