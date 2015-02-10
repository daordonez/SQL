# ************************************************************
# Sequel Pro SQL dump
# Versión 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 10.0.10.10 (MySQL 5.5.39-MariaDB)
# Base de datos: ciclistas
# Tiempo de Generación: 2015-02-10 23:19:03 +0000
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

LOCK TABLES `ciclistas` WRITE;
/*!40000 ALTER TABLE `ciclistas` DISABLE KEYS */;

INSERT INTO `ciclistas` (`dorsal`, `nombre`, `edad`, `equipo`)
VALUES
	(1,'Valerio Conti',22,'Lampere-ISD'),
	(2,'Winder Anacona Gomez',27,'Lampere-ISD'),
	(3,'Damiano Cunego',34,'Lampere-ISD'),
	(4,'Elia Favili',30,'Lampere-ISD'),
	(5,'Roberto Ferrari',28,'Lampere-ISD'),
	(6,'Przemyslav Niemiec',25,'Lampere-ISD'),
	(7,'Filippo Pozzato',25,'Lampere-ISD'),
	(8,'A.Maximiliano Richez',31,'Lampere-ISD'),
	(9,'J.Rodolfo Serpa',24,'Lampere-ISD'),
	(11,'Huber Dupont',34,'Agr2 Mondiale'),
	(12,'Carlos Alberto Betan',25,'Agr2 Mondiale'),
	(13,'Maxime Bouet',28,'Agr2 Mondiale'),
	(14,'Damien Gaudin',28,'Agr2 Mondiale'),
	(15,'Patrick Getsch',27,'Agr2 Mondiale'),
	(16,'Yauheni Hutarovich',32,'Agr2 Mondiale'),
	(17,'Lloyd Mondory',32,'Agr2 Mondiale'),
	(18,'Rinaldo Nocentini',37,'Agr2 Mondiale'),
	(19,'Sebastien Turgot',30,'Agr2 Mondiale'),
	(21,'Fabio Aruba',25,'Team Astana'),
	(22,'Daniil Fominykh',24,'Team Astana'),
	(23,'Andrea Guardini',26,'Team Astana'),
	(24,'Jacopo Guarmieri',28,'Team Astana'),
	(25,'Tanel Kengert',28,'Team Astana'),
	(26,'Mikel Landa',26,'Team Astana'),
	(27,'Alexei Lutsenko',22,'Team Astana'),
	(28,'Paolo Tiralongo',25,'Team Astana'),
	(29,'Andrey Zeits',28,'Team Astana'),
	(31,'Wilko Kelderman',24,'RaboBank'),
	(32,'Stef Clement',25,'RaboBank'),
	(33,'Laurens Ten Damm',34,'RaboBank'),
	(34,'Robert Gesink',33,'RaboBank'),
	(35,'Moren Hofland',24,'RaboBank'),
	(36,'Paul Martens',31,'RaboBank'),
	(37,'Martjin Keizer',27,'RaboBank'),
	(38,'Maarten Tjallingii',38,'RaboBank'),
	(39,'Robert Wagner',31,'RaboBank'),
	(41,'Samuel Sanchez Gonza',36,'BMC Racing'),
	(42,'Rohan Dennis',25,'BMC Racing'),
	(43,'Cadel Evans',38,'BMC Racing'),
	(44,'Philippe Gilbert',33,'BMC Racing'),
	(45,'Steve Morabito',32,'BMC Racing'),
	(46,'Dominik Nerz',26,'BMC Racing'),
	(47,'Manuel Quinzquiato',36,'BMC Racing'),
	(48,'Larry Warbasse',25,'BMC Racing'),
	(49,'Danilo Wyss',29,'BMC Racing'),
	(51,'Luis Sanchez Gil',31,'Caja Rural'),
	(52,'Fco. Javier Aramendi',28,'Caja Rural'),
	(53,'David Arroyo',35,'Caja Rural'),
	(54,'Peio Bilbao',25,'Caja Rural'),
	(55,'Karol Andrzej',26,'Caja Rural'),
	(56,'Francesco Lasca',27,'Caja Rural'),
	(57,'LLuis Mas Bonet',26,'Caja Rural'),
	(58,'Antonio Piedra',29,'Caja Rural'),
	(59,'Amets Txurruka',33,'Caja Rural'),
	(61,'Peter Sagan',25,'Liquigas'),
	(62,'George Bennett',25,'Liquigas'),
	(63,'Maciej Bodnar',30,'Liquigas'),
	(64,'Guillaume Boivin',30,'Liquigas'),
	(65,'Damiano Caruso',28,'Liquigas'),
	(66,'Alessandro de Marchi',28,'Liquigas'),
	(67,'Óscar Gato',25,'Liquigas'),
	(68,'Matthias Krizek',27,'Liquigas'),
	(69,'Paolo Longo Borghini',35,'Liquigas'),
	(71,'Daniel Navarro G',28,'Cofidis'),
	(72,'Jerôme Coppel',28,'Cofidis'),
	(73,'Romain Hardy',26,'Cofidis'),
	(74,'Gert Joeaar',27,'Cofidis'),
	(75,'Christophe le Mevel',25,'Cofidis'),
	(76,'Guillaume Levarlet',30,'Cofidis'),
	(77,'Luis Angle Mate',31,'Cofidis'),
	(78,'Yoann Bagot',29,'Cofidis'),
	(79,'Romain Zingle',29,'Cofidis'),
	(91,'Nacer Bouhanni',25,'FDJ'),
	(92,'Kenyy Elissonde',24,'FDJ'),
	(93,'Murilo Antoniobil Fi',24,'FDJ'),
	(94,'Johan Le Bon',25,'FDJ'),
	(95,'Laurent Mangel',34,'FDJ'),
	(96,'Cedric Pineau',30,'FDJ'),
	(97,'Thibaut Pinot',25,'FDJ'),
	(98,'Anthony Roux',28,'FDJ'),
	(99,'Gregory Soupe',27,'FDJ'),
	(101,'Ryder Hesjedal',35,'Garmin-Cervelo'),
	(102,'Daniel Martin',29,'Garmin-Cervelo'),
	(103,'Koldo Fernández',34,'Garmin-Cervelo'),
	(104,'Nathan Haas',26,'Garmin-Cervelo'),
	(105,'Nathan Brown',24,'Garmin-Cervelo'),
	(106,'André Fernando',31,'Garmin-Cervelo'),
	(107,'David Millar',30,'Garmin-Cervelo'),
	(108,'Andrew Talansky',28,'Garmin-Cervelo'),
	(109,'Johan Van Summeren',34,'Garmin-Cervelo'),
	(131,'Joaquin Rodríguez Ol',30,'Katusha Team'),
	(132,'Giampaolo Caruso',28,'Katusha Team'),
	(133,'Sergei Chemetski',25,'Katusha Team'),
	(134,'Alexander Kolobnev',34,'Katusha Team'),
	(135,'Dimitry Kozontchuk',32,'Katusha Team'),
	(136,'Alberto Losada Algua',26,'Katusha Team'),
	(137,'Daniel Fernandez Mor',27,'Katusha Team'),
	(138,'Yuriy Trofimov',30,'Katusha Team'),
	(139,'Eduard Vorganov',30,'Katusha Team'),
	(141,'Jurgen Van den Broec',32,'Omega Pharma'),
	(142,'Sander Armee',30,'Omega Pharma'),
	(143,'Vegard Breen',25,'Omega Pharma'),
	(144,'Bart De Clercq',29,'Omega Pharma'),
	(145,'Jens Debusschere',26,'Omega Pharma'),
	(146,'Adam Hansen',34,'Omega Pharma'),
	(147,'Gregory Henserson',39,'Omega Pharma'),
	(148,'Pim Ligthart',27,'Omega Pharma'),
	(149,'Maxime Monfort',32,'Omega Pharma'),
	(151,'Alejandro Valverde',35,'Movistar Team'),
	(152,'Andrey Amador',28,'Movistar Team'),
	(153,'Jonathan Castroviejo',30,'Movistar Team'),
	(154,'Imanol Erviti',31,'Movistar Team'),
	(155,'Joser Herrada',29,'Movistar Team'),
	(156,'Gorka Izaguirre',27,'Movistar Team'),
	(157,'Adriano Malori',26,'Movistar Team'),
	(158,'Javier Moreno',30,'Movistar Team'),
	(159,'Nairo A. Quintana',25,'Movistar Team'),
	(161,'Sergio Pardilla Bell',25,'Mtn Qhubeka'),
	(162,'Gerald Ciolek',26,'Mtn Qhubeka'),
	(163,'Merhawi K. Ghebremed',29,'Mtn Qhubeka'),
	(164,'Louis Meintjes',22,'Mtn Qhubeka'),
	(165,'Kristian Sbaragli',25,'Mtn Qhubeka'),
	(166,'Daniel Tekledaymanot',20,'Mtn Qhubeka'),
	(167,'J.Robert Thomson',27,'Mtn Qhubeka'),
	(168,'J.Janse Van Rensburg',28,'Mtn Qhubeka'),
	(169,'Jaco Venter',28,'Mtn Qhubeka'),
	(181,'Sam Bewley',28,'Greenedege'),
	(182,'Jhoan Esteban Chaves',25,'Greenedege'),
	(183,'Simon Clarke',29,'Greenedege'),
	(184,'Mitchell Docker',29,'Greenedege'),
	(185,'Brett Daniel Lancast',30,'Greenedege'),
	(186,'Michael Matthews',25,'Greenedege'),
	(187,'Cameron Meyer',23,'Greenedege'),
	(188,'Ivan Santoramita',31,'Greenedege'),
	(189,'Adam Yates',23,'Greenedege'),
	(201,'Alberto Contador',28,'SaxoBank'),
	(202,'Michael Valgren',23,'SaxoBank'),
	(203,'Daniele Bennatti',34,'SaxoBank'),
	(204,'Jesus Hernández',30,'SaxoBank'),
	(205,'Sergio Paulinho',34,'SaxoBank'),
	(206,'Ivan Rovny',37,'SaxoBank'),
	(207,'Chris Anker Sorensse',30,'SaxoBank'),
	(208,'Matteo Tossato',29,'SaxoBank'),
	(209,'Oliver Zaugg',28,'SaxoBank'),
	(211,'Fabian Cancellara',34,'Leopard Trek'),
	(212,'J.David Arredondo',27,'Leopard Trek'),
	(213,'Fabio Felline',25,'Leopard Trek'),
	(214,'Bob Jungels',23,'Leopard Trek'),
	(215,'Yaroslav Popovych',22,'Leopard Trek'),
	(216,'Jesse Sergent',24,'Leopard Trek'),
	(217,'Kristof Vendewalle',23,'Leopard Trek'),
	(218,'Jasper Stuyven',30,'Leopard Trek'),
	(219,'Haimar Zubeldia',38,'Leopard Trek');

/*!40000 ALTER TABLE `ciclistas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipos
# ------------------------------------------------------------

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;

INSERT INTO `equipos` (`nombre`, `director`)
VALUES
	('Agr2 Mondiale','Vincent Lavenu'),
	('BMC Racing','James Ochowiz'),
	('Caja Rural','Jose Manuel Hernande'),
	('Cofidis','Yvon Sanquer'),
	('FDJ','Marc Madiot'),
	('Garmin-Cervelo','Jonathan Vaughters'),
	('Greenedege','Shayne Bannan'),
	('Katusha Team','Viacheslav Ekimov'),
	('Lampere-ISD','Giuseppe Saronni'),
	('Leopard Trek','Luca Guercilena'),
	('Liquigas','Roberto Amadio'),
	('Movistar Team','Eusebio Unzué'),
	('Mtn Qhubeka','Tiann Kannemeyer'),
	('Omega Pharma','Patrick Lefevere'),
	('RaboBank','Richard Plugge'),
	('SaxoBank','Bjarme Riis'),
	('Sky Pro cycling','Dave Brailsfor'),
	('Team Astana','Aleksandr Vinokurov'),
	('Team Europcar','Jean-René Bernaudeau'),
	('Team Giant-Alpecin','Iwan Spekenbrink'),
	('Team Radioshack','Bill Stapleton');

/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla etapas
# ------------------------------------------------------------



# Volcado de tabla llevar_m
# ------------------------------------------------------------



# Volcado de tabla maillot
# ------------------------------------------------------------

LOCK TABLES `maillot` WRITE;
/*!40000 ALTER TABLE `maillot` DISABLE KEYS */;

INSERT INTO `maillot` (`codigo`, `tipo`, `color`, `premio`)
VALUES
	(1,'Lider','Rojo',8000),
	(2,'G_Montaña','Naranja',4000),
	(3,'Combinado','Blanco',3000),
	(4,'Ex_Puntos','Azul',2000),
	(5,'Campeon','Amarillo',350000);

/*!40000 ALTER TABLE `maillot` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla puertos
# ------------------------------------------------------------




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
