# ************************************************************
# Sequel Pro SQL dump
# Versión 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 10.0.10.10 (MySQL 5.5.39-MariaDB)
# Base de datos: ciclistas
# Tiempo de Generación: 2015-02-04 01:32:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla ciclistas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ciclistas`;

CREATE TABLE `ciclistas` (
  `dorsal` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `equipo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`dorsal`),
  KEY `equipo` (`equipo`),
  CONSTRAINT `ciclistas_ibfk_1` FOREIGN KEY (`equipo`) REFERENCES `equipos` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla equipos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipos`;

CREATE TABLE `equipos` (
  `nombre` varchar(20) NOT NULL,
  `director` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla etapas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `etapas`;

CREATE TABLE `etapas` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `kms` int(11) NOT NULL,
  `c_salida` varchar(20) DEFAULT NULL,
  `c_llegada` varchar(20) DEFAULT NULL,
  `d_ciclista` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `d_ciclista` (`d_ciclista`),
  CONSTRAINT `etapas_ibfk_1` FOREIGN KEY (`d_ciclista`) REFERENCES `ciclistas` (`dorsal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla llevar_m
# ------------------------------------------------------------

DROP TABLE IF EXISTS `llevar_m`;

CREATE TABLE `llevar_m` (
  `etapas` int(11) NOT NULL,
  `mallot` int(11) NOT NULL,
  `ciclista` int(11) NOT NULL,
  PRIMARY KEY (`etapas`,`mallot`),
  KEY `mallot` (`mallot`),
  KEY `ciclista` (`ciclista`),
  CONSTRAINT `llevar_m_ibfk_1` FOREIGN KEY (`etapas`) REFERENCES `etapas` (`numero`),
  CONSTRAINT `llevar_m_ibfk_2` FOREIGN KEY (`mallot`) REFERENCES `maillot` (`codigo`),
  CONSTRAINT `llevar_m_ibfk_3` FOREIGN KEY (`ciclista`) REFERENCES `ciclistas` (`dorsal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla maillot
# ------------------------------------------------------------

DROP TABLE IF EXISTS `maillot`;

CREATE TABLE `maillot` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  `premio` float DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla puertos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `puertos`;

CREATE TABLE `puertos` (
  `nombre` varchar(20) NOT NULL,
  `categoria` int(11) DEFAULT NULL,
  `etapa` int(11) DEFAULT NULL,
  `d_ciclista` int(11) DEFAULT NULL,
  `altura` int(11) DEFAULT NULL,
  PRIMARY KEY (`nombre`),
  KEY `etapa` (`etapa`),
  KEY `d_ciclista` (`d_ciclista`),
  CONSTRAINT `puertos_ibfk_1` FOREIGN KEY (`etapa`) REFERENCES `etapas` (`numero`),
  CONSTRAINT `puertos_ibfk_2` FOREIGN KEY (`d_ciclista`) REFERENCES `ciclistas` (`dorsal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
