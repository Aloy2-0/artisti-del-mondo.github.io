-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.32-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database opere
CREATE DATABASE IF NOT EXISTS `opere` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `opere`;

-- Dump della struttura di tabella opere.artista
CREATE TABLE IF NOT EXISTS `artista` (
  `codA` varchar(20) NOT NULL,
  `cognomeA` varchar(20) NOT NULL,
  `nomeA` varchar(20) DEFAULT NULL,
  `nazione` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codA`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella opere.artista: ~20 rows (circa)
INSERT INTO `artista` (`codA`, `cognomeA`, `nomeA`, `nazione`) VALUES
	('1', 'Vecellio', 'Tiziano', 'Italia'),
	('10', 'Rubens', 'Peter Paul', 'Olanda'),
	('11', 'Cezanne', 'Paul', 'Francia'),
	('12', 'Vermeer', 'Johannes', 'Olanda'),
	('13', 'Botticelli', 'Sandro', 'Italia'),
	('14', 'El Greco', 'Domenikos', 'Spagna'),
	('15', 'Goya', 'Francisco', 'Spagna'),
	('16', 'Degas', 'Edgar', 'Francia'),
	('17', 'Turner', 'J.M.W.', 'Inghilterra'),
	('18', 'Manet', 'Edouard', 'Francia'),
	('19', 'Canaletto', 'Giovanni', 'Italia'),
	('2', 'Klimt', 'Gustav', 'Austria'),
	('20', 'Modigliani', 'Amedeo', 'Italia'),
	('3', 'Da Vinci', 'Leonardo', 'Italia'),
	('4', 'Monet', 'Claude', 'Francia'),
	('5', 'Van Gogh', 'Vincent', 'Olanda'),
	('6', 'Raffaello', 'Sanzio', 'Italia'),
	('7', 'Picasso', 'Pablo', 'Spagna'),
	('8', 'Rembrandt', 'Harmenszoon', 'Olanda'),
	('9', 'Caravaggio', 'Michelangelo', 'Italia');

-- Dump della struttura di tabella opere.museo
CREATE TABLE IF NOT EXISTS `museo` (
  `codM` varchar(20) NOT NULL,
  `nomeM` varchar(20) DEFAULT NULL,
  `citta` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella opere.museo: ~20 rows (circa)
INSERT INTO `museo` (`codM`, `nomeM`, `citta`) VALUES
	('1', 'National Gallery', 'Londra'),
	('10', 'Alte Pinakothek', 'Monaco'),
	('11', 'Getty Museum', 'Los Angeles'),
	('12', 'Museo Egizio', 'Torino'),
	('13', 'British Museum', 'Londra'),
	('14', 'Uffizi', 'Firenze'),
	('15', 'Belvedere', 'Vienna'),
	('16', 'National Gallery of ', 'Washington'),
	('17', 'Guggenheim', 'New York'),
	('18', 'Museum of Modern Art', 'New York'),
	('19', 'Art Institute of Chi', 'Chicago'),
	('2', 'Galleria Uffizi', 'Firenze'),
	('20', 'Museo Reina Sofia', 'Madrid'),
	('3', 'Museo del Prado', 'Madrid'),
	('4', 'Louvre', 'Parigi'),
	('5', 'Tate Modern', 'Londra'),
	('6', 'Metropolitan Museum', 'New York'),
	('7', 'Hermitage', 'San Pietroburgo'),
	('8', 'Rijksmuseum', 'Amsterdam'),
	('9', 'Museo d\'Orsay', 'Parigi');

-- Dump della struttura di tabella opere.opera
CREATE TABLE IF NOT EXISTS `opera` (
  `codO` varchar(20) NOT NULL,
  `titolo` varchar(50) DEFAULT NULL,
  `valore` float DEFAULT NULL,
  `CodA_FK` varchar(20) NOT NULL,
  `CodM_FK` varchar(20) NOT NULL,
  `immagine` varchar(50) DEFAULT NULL,
  `descrizione` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codO`) USING BTREE,
  KEY `FK1` (`CodA_FK`) USING BTREE,
  KEY `FK_opera_museo` (`CodM_FK`) USING BTREE,
  CONSTRAINT `FK_opera_artista` FOREIGN KEY (`CodA_FK`) REFERENCES `artista` (`codA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_opera_museo` FOREIGN KEY (`CodM_FK`) REFERENCES `museo` (`codM`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella opere.opera: ~30 rows (circa)
INSERT INTO `opera` (`codO`, `titolo`, `valore`, `CodA_FK`, `CodM_FK`, `immagine`, `descrizione`) VALUES
	('1', 'Venere di Urbino', 50000000, '1', '1', 'img/Venere di Urbino.png', 'La Venere di Urbino di Tiziano (1538) raffigura una giovane donna nuda distesa su un letto, simbolo di sensualità e fedeltà coniugale, ambientata in una scena domestica rinascimentale.'),
	('10', 'Giuditta I', 35000000, '2', '1', 'img/Giuditta I.png', 'Opera di Klimt che raffigura Giuditta nell’atto trionfante dopo aver decapitato Oloferne, tra sensualità e violenza.'),
	('11', 'Guernica', 90000000, '7', '3', 'img/Guernica.png', 'Capolavoro di Picasso che denuncia gli orrori della guerra civile spagnola con uno stile drammatico e cubista.'),
	('12', 'La Ronda di Notte', 75000000, '8', '8', 'img/La Ronda di Notte.png', 'Opera barocca di Rembrandt che ritrae una compagnia di milizia in movimento, celebre per la luce drammatica.'),
	('13', 'La Vocazione di San Matteo', 67000000, '9', '2', 'img/La Vocazione di San Matteo.png', 'Caravaggio mostra Cristo che chiama Matteo, con giochi di luce e realismo rivoluzionari per l’epoca.'),
	('14', 'La Fuga in Egitto', 56000000, '10', '2', 'img/La Fuga in Egitto.png', 'Rubens raffigura la Sacra Famiglia in viaggio, immersa in un paesaggio vibrante. Il dinamismo e i colori vivaci rendono intensa questa scena di protezione e speranza divina.'),
	('15', 'I Giocatori di Carte', 72000000, '11', '9', 'img/I Giocatori di Carte.png', 'Una delle più note serie di Cézanne, raffigura contadini intenti a giocare a carte in una scena sospesa e silenziosa.'),
	('16', 'La Lattaia', 43000000, '12', '8', 'img/La Lattaia.png', 'Opera di Vermeer che ritrae una domestica nell’atto di versare il latte, con luce e realismo magistrali.'),
	('17', 'La Nascita di Venere', 88000000, '13', '2', 'img/La Nascita di Venere.png', 'Capolavoro di Botticelli che raffigura la dea Venere emergere dal mare, simbolo di bellezza ideale.'),
	('18', 'La Resurrezione', 63000000, '14', '3', 'img/La Resurrezione.png', 'Opera drammatica e potente di El Greco sulla resurrezione di Cristo, con figure allungate e colori intensi.'),
	('19', 'Saturno che divora i suoi figli', 59000000, '15', '3', 'img/Saturno che divora i suoi figli.png', 'Pittura visionaria e cupa di Goya che mostra il mito di Saturno con tratti espressionisti e angoscianti.'),
	('2', 'Il Bacio', 70000000, '2', '3', 'img/Il Bacio.png', 'Celebre opera di Klimt, raffigura un bacio dorato tra due amanti, espressione intensa di amore e simbolismo.'),
	('20', 'La Classe di Danza', 51000000, '16', '9', 'img/La Classe di Danza.png', 'Degas raffigura giovani ballerine in una sala prove, cogliendo il movimento e l’atmosfera quotidiana.'),
	('21', 'Annunciazione', 48000000, '3', '1', 'img/Annunciazione.png', 'Dipinto religioso in cui l’angelo Gabriele annuncia a Maria la nascita di Gesù, con eleganza e solennità.'),
	('22', 'Il Concerto', 52000000, '1', '2', 'img/Il Concerto.png', 'Scena intima e misteriosa con tre musicisti. Un’opera enigmatica che fonde arte, musica e sguardi, celebre per l’atmosfera sospesa e i giochi di luce e colore tipici di Tiziano.'),
	('23', 'L\'Assunta', 67000000, '1', '2', 'img/L\'Assunta.png', 'Tiziano rappresenta l’Assunzione della Vergine in cielo, con dinamismo e intensità espressiva.'),
	('24', 'San Sebastiano', 69000000, '1', '1', 'img/San Sebastiano.png', 'Raffigurazione di San Sebastiano martire trafitto dalle frecce, spesso interpretata con forte pathos.'),
	('25', 'Bacco e Arianna', 72000000, '1', '5', 'img/Bacco e Arianna.png', 'Tiziano immortala il momento in cui Bacco salva Arianna abbandonata, con colori vivaci e gesti teatrali.'),
	('26', 'Le Tre Grazie', 54000000, '6', '4', 'img/Le Tre Grazie.png', 'Opera che raffigura le Tre Grazie, simboli di bellezza, armonia e femminilità.'),
	('27', 'Ritratto di Papa Leone X', 61000000, '6', '1', 'img/Ritratto di Papa Leone X.png', 'Ritratto formale di Raffaello che mostra Papa Leone X con due cardinali, simbolo di autorità e realismo.'),
	('28', 'San Giorgio e il Drago', 58000000, '6', '2', 'img/San Giorgio e il Drago.png', 'Raffaello rappresenta il santo che uccide il drago in un paesaggio classico, simbolo del trionfo del bene.'),
	('29', 'Adorazione dei Magi', 73000000, '13', '2', 'img/Adorazione dei Magi.png', 'Botticelli raffigura i Re Magi che omaggiano il Bambino, in una scena ricca di dettagli e personaggi.'),
	('3', 'La Gioconda', 85000000, '3', '4', 'img/La Gioconda.png', 'Il capolavoro di Leonardo da Vinci, famoso per il suo sorriso enigmatico e lo sguardo che segue lo spettatore.'),
	('30', 'Primavera', 86000000, '13', '1', 'img/Primavera.png', 'Capolavoro di Botticelli che celebra la rinascita e la mitologia in un’allegoria della natura e dell’amore.'),
	('4', 'Impressione sole nascente', 45000000, '4', '4', 'img/Impressione sole nascente.png', 'Dipinto di Monet che ha dato il nome al movimento impressionista, cattura la luce dell’alba sul porto di Le Havre.'),
	('5', 'I Girasoli', 30000000, '5', '5', 'img/I Girasoli.png', 'Una delle serie più note di Van Gogh, rappresenta la vitalità e la luce attraverso i colori intensi dei girasoli.'),
	('6', 'Madonna del Prato', 40000000, '6', '2', 'img/Madonna del Prato.png', 'Opera rinascimentale di Raffaello, mostra la Madonna con Gesù e Giovanni Battista in un paesaggio armonioso.'),
	('7', 'La Madonna Sistina', 55000000, '6', '1', 'img/La Madonna Sistina.png', 'Capolavoro di Raffaello noto per i celebri angioletti in basso, custodito a Dresda.'),
	('8', 'Diana e Atteone', 60000000, '1', '1', 'img/Diana e Atteone.png', 'Tiziano narra il mito di Atteone che sorprende Diana al bagno, punito per la sua indiscrezione.'),
	('9', 'Autoritratto', 20000000, '1', '2', 'img/Autoritratto.png', 'Autoritratto di Tiziano che si mostra anziano, simbolo di dignità e consapevolezza artistica.');

-- Dump della struttura di tabella opere.personaggio
CREATE TABLE IF NOT EXISTS `personaggio` (
  `codP` varchar(20) NOT NULL,
  `nomeP` varchar(15) DEFAULT NULL,
  `codO_FK` varchar(20) NOT NULL,
  PRIMARY KEY (`codP`) USING BTREE,
  KEY `FK_personaggio_opera` (`codO_FK`),
  CONSTRAINT `FK_personaggio_opera` FOREIGN KEY (`codO_FK`) REFERENCES `opera` (`codO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella opere.personaggio: ~30 rows (circa)
INSERT INTO `personaggio` (`codP`, `nomeP`, `codO_FK`) VALUES
	('1', 'Venere', '1'),
	('10', 'Lattaia', '16'),
	('11', 'Venere', '17'),
	('12', 'Cristo', '18'),
	('13', 'Saturno', '19'),
	('14', 'Ballerina', '20'),
	('15', 'Dio', '3'),
	('16', 'Ritratto di uom', '9'),
	('17', 'Mercurio', '8'),
	('18', 'Apollo', '5'),
	('19', 'Adamo', '4'),
	('2', 'Giuditta', '10'),
	('20', 'Eva', '2'),
	('21', 'San Giorgio', '28'),
	('22', 'Papa Leone X', '27'),
	('23', 'Bacco', '25'),
	('24', 'Arianna', '25'),
	('25', 'Sebastiano', '24'),
	('26', 'Tre Grazie', '26'),
	('27', 'Angelo', '22'),
	('28', 'Madonna', '23'),
	('29', 'Re Magi', '29'),
	('3', 'Madonna', '6'),
	('30', 'Primavera', '30'),
	('4', 'Madonna', '7'),
	('5', 'Minotauro', '11'),
	('6', 'Uomo con cappel', '12'),
	('7', 'San Matteo', '13'),
	('8', 'Maria', '14'),
	('9', 'Giocatore di ca', '15');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
