-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 09. Mai 2023 um 22:53
-- Server-Version: 10.4.25-MariaDB
-- PHP-Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `buchhaus`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellungen`
--

CREATE TABLE `bestellungen` (
  `b_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `pr_id` int(11) NOT NULL,
  `b_anzahl` int(11) NOT NULL,
  `b_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gutscheine`
--

CREATE TABLE `gutscheine` (
  `g_id` int(11) NOT NULL,
  `g_werte` double NOT NULL,
  `g_code` varchar(50) NOT NULL,
  `g_ablaufdatum` date NOT NULL,
  `g_aktive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `gutscheine`
--

INSERT INTO `gutscheine` (`g_id`, `g_werte`, `g_code`, `g_ablaufdatum`, `g_aktive`) VALUES
(1, 20, 'SALE20', '2023-07-20', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorien`
--

CREATE TABLE `kategorien` (
  `k_id` int(11) NOT NULL,
  `k_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kategorien`
--

INSERT INTO `kategorien` (`k_id`, `k_name`) VALUES
(2, 'Fachliteratur'),
(5, 'Fantasy & Science Fiction'),
(4, 'Fremdsprachig'),
(7, 'Krimis & Thriller'),
(6, 'Manga'),
(3, 'Romane');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `personen`
--

CREATE TABLE `personen` (
  `p_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `p_vorname` varchar(50) NOT NULL,
  `p_nachname` varchar(50) NOT NULL,
  `p_anrede` enum('Frau','Herr','Divers') NOT NULL,
  `p_adresse` varchar(255) NOT NULL,
  `p_plz` int(11) NOT NULL,
  `p_ort` varchar(50) NOT NULL,
  `p_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `produkte`
--

CREATE TABLE `produkte` (
  `pr_id` int(11) NOT NULL,
  `k_id` int(11) NOT NULL,
  `pr_title` varchar(255) NOT NULL,
  `pr_bild` varchar(255) NOT NULL,
  `pr_preis` double NOT NULL,
  `pr_beschreibung` varchar(1000) NOT NULL,
  `pr_autor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `produkte`
--

INSERT INTO `produkte` (`pr_id`, `k_id`, `pr_title`, `pr_bild`, `pr_preis`, `pr_beschreibung`, `pr_autor`) VALUES
(1, 2, 'Krisenintervention und Notfallpsychologie', 'krisenintervention.jpg', 34.8, 'Krisenintervention und Notfallpsychologie. Ein Handbuch für KriseninterventionsmitarbeiterInnen und psychosoziale Fachkraefte. Das Interventionsmodell der beduerfnis- und ressourcen-orientierten psychosozialen Unterstuetzung von Betroffenen in der  Akutphase nach traumatischen Ereignissen, wie dem ploetzlichen Tod oder der schweren Verletzung von Angehoerigen, wird Schritt fuer Schritt dargelegt und anhand vieler Fallbeispiele erlaeutert.\r\nDas Interventionsmodell baut auf den Erfahrungen aus mehr als 10 Jahren Krisenintervention des fachlichen Hintergrunddienstes (KI/SvE) des OERK Tirol und den Forschungsarbeiten der Arbeitsgruppe Notfallpsychologie der Universitaet Innsbruck auf.;Barbara Juen und Dietmar Kratzer', 'Barbara Juen und Dietmar Kratzer'),
(5, 2, 'KODEX Studienausgabe Steuergesetze 2023', 'kodex.jpg', 15, 'KODEX Studienausgabe Steuergesetze 2023: 9. Auflage, Stand 1.2.2023 Mit der App zum Gesetz! KODEX Steuerrecht – Die Ausgabe für Ihr Studium! Die ”Studienausgabe Steuerrecht“ verfügt über die Qualitaet der seit vielen Jahren erfolgreichen KODEX-Reihe, von Experten ihres Faches bearbeitet, mit den entsprechenden Novellenausweisen und umfangreichen Stichwortverzeichnissen, wie es im Studium und bei Pruefungen wichtig ist. Auch die Studienausgabe enthaelt alle wichtigen einschlaegigen Gesetze; nicht aufgenommen sind Gesetze, die im Studium keine oder nur geringe Bedeutung haben. Die fuer den KODEX typische Griffleiste ermoeglicht einen raschen UEberblick ueber den gesamten Inhalt des Bandes; zudem findet sich mit Hilfe der Griffleiste tatsaechlich jedes Gesetz auf einen Griff. Mit den Schwerpunkten: Einkommensteuer, Koerperschaftsteuer, Umsatzsteuer, Grunderwerbsteuer, Doppelbesteuerung, Verfahrensrecht und Finanzstrafrecht.', 'Walter Doralt'),
(6, 2, 'Java ist auch eine Insel', 'java.jpg', 51.3, 'Die „Insel“ ist die erste Wahl, wenn es um aktuelles und praktisches Java-Wissen geht. Java-Einsteiger, Studierende und Umsteigerinnen profitieren von diesem Lehrwerk. Neben der Behandlung der Sprachgrundlagen von Java gibt es kompakte Einführungen in Spezialthemen. So erfahren Sie einiges ueber Threads, Algorithmen, GUIs, Dateien und Datenstroeme. Dieses Buch ist das Standardwerk für die Java-Programmierung. Es liegt aktuell in der 16. Auflage vor.\r\nAus dem Inhalt: Imperative Sprachkonzepte, Klassen und Objekte, Ausnahmebehandlung, Generics, Lambda-Ausdruecke und funktionale Programmierung, Die Klassenbibliothek, Nebenlaeufige Programmierung, Einfuehrung in Datenstrukturen, GUI-Entwicklung, Dateien usw.', 'Christian Ullenboom'),
(7, 3, 'Queen Charlotte - Bevor es die Bridgertons gab', 'QueenCharlotte.jpg', 13, 'Das Buch zur neuen Netflix-Serie An einem sonnigen Septembertag im Jahr 1761 begegnen sie sich zum ersten Mal. Innerhalb weniger Stunden heiraten sie, und sie werden Geschichte schreiben. Die als deutsche Prinzessin geborene Charlotte von Mecklenburg-Strelitz ist schoen, eigensinnig und aeußerst intelligent – nicht gerade das, was der britische Hof fuer den jungen Koenig gesucht hat. Ihr wird es nicht leicht gemacht, sich in der komplizierten Politik des Hofs zurechtzufinden. Und sie muss ihr Herz hueten, denn sie verliebt sich in George, auch wenn er sie wegstoeßt und erschuetternde Geheimnisse verbirgt. Sie aber hat die Macht, die Gesellschaft neu zu gestalten. Deshalb darf ihre Ehe nicht scheitern. Charlotte muss kaempfen – fuer sich, fuer ihren Mann und fuer all ihre neuen Untertanen. Denn sie wird nie wieder nur Charlotte sein. Stattdessen muss sie ihr Schicksal erfuellen – als Koenigin.', 'Harper Collins'),
(8, 3, 'Mein Leben in deinem', 'meinLeben.jpg', 26.5, 'Einmal in das Leben einer anderen schluepfen, davon traeumt Sam, wenn ihr der Alltag mal wieder ueber den Kopf waechst. Als sie im Sportstudio versehentlich die falsche Tasche mitnimmt, kann sie nicht widerstehen. Der Inhalt ist so anders als ihre schlichten Klamotten. Eine wunderschoene Chanel-Jacke und ein Paar glamouroese High Heels. Als Sam die Kleidungsstuecke anzieht, fuehlt sie sich fuer einen Moment wie eine andere Frau. Eine Frau ohne Geldsorgen, ohne Ehemann, der nur noch auf dem Sofa sitzt - sie fuehlt sich unbeschwert, selbstbewusst, frei. Nisha ist diese Frau. Von außen scheint ihr Leben perfekt. Ein erfolgreicher, wohlhabender Mann, ein Kleiderschrank voller Designerstuecke. Doch Nisha war nicht immer die Frau, die sie heute ist. Und ihr sorgsam aufgebautes Leben droht gerade wie ein Kartenhaus einzustuerzen. Bis ihr Sam begegnet. Denn manchmal kann ein einziger Moment alles veraendern. ', 'Jojo Moyes'),
(9, 3, 'Wie ein Leuchten in tiefer Nacht', 'Leuchten.jpg', 12.95, '1937: Hals uueber Kopf folgt die Englaenderin Alice ihrem Verlobten Bennett nach Amerika. Doch anstatt im Land der unbegrenzten Moeglichkeiten findet sie sich in Baileyville wieder, einem Nest in den Bergen Kentuckys. Maechtigster Mann ist der tyrannische  Minenbesitzer Geoffrey Van Cleve, ihr Schwiegervater, unter dessen Dach sie leben muss. Neuen Lebensmut schoepft Alice erst, als sie sich den Frauen der Packhorse Library anschließt, einer der Bibliotheken auf dem Lande, die auf Initiative von Eleanor Roosevelt gegruendet wurden. Wer zu krank oder zu alt ist, dem bringen die Frauen die Buecher nach Hause. Tag fuer Tag reiten sie auf schwer bepackten Pferden in die Berge. Alice liebt ihre Aufgabe, die wilde Natur und deren Bewohner. Und sie fasst den Mut, ihren eigenen Weg zu gehen. Gegen alle Widerstaende. Eine Feier des Lesens und der Freundschaft. Eine große Liebesgeschichte. Ein Buch, das Mut macht.', 'Jojo Moyes'),
(10, 4, 'Fourth Wing', 'fourth.jpg', 23.99, ' Dragons, war and Hunger Games-esque trials. Fourth Wing is a high-stakes, enemies-to-lovers fantasy romance perfect for fans of Leigh Bardugo, Sarah J Maas and dark academia.', 'Rebecca Yarros'),
(11, 4, 'Love, Theoretically', 'loveTheor.jpg', 26.99, ' Rival physicists collide in a vortex of academic feuds and fake dating shenanigans in this delightfully STEMinist romcom from the New York Times bestselling author of The Love Hypothesis and Love on the Brain. The many lives of theoretical physicist Elsie Hannaway have finally caught up with her. By day, she’s an adjunct professor, toiling away at grading labs and teaching thermodynamics in the hopes of landing tenure. By other day, Elsie makes up for her non-existent paycheck by offering her services as a fake girlfriend, tapping into her expertly honed people-pleasing skills to embody whichever version of herself the client needs. Honestly, it’s a pretty sweet gig—until her carefully constructed Elsie-verse comes crashing down. Because Jack Smith, the annoyingly attractive and arrogant older brother of her favorite client, turns out to be the cold-hearted experimental physicist who ruined her mentor’s career and undermined the reputation of theorists everywhere. And he’s the same Ja', 'Ali Hazelwood'),
(12, 4, 'Trust', 'trust.jpg\r\n', 9.99, 'An unparalleled novel about money, power, intimacy, and perception. Even through the roar and effervescence of the 1920s, everyone in New York has heard of Benjamin and Helen Rask. He is a legendary Wall Street tycoon; she is the daughter of eccentric aristocrats. Together, they have risen to the very top of a world of seemingly endless wealth—all as a decade of excess and speculation draws to an end. But at what cost have they acquired their immense fortune? This is the mystery at the center of\r\nBonds, a successful 1937 novel that all of New York seems to have read. Yet there are other versions of this tale of privilege and deceit.', 'Hernan Diaz'),
(13, 5, 'Dracula', 'dracula.jpg', 20, 'Ein mysterioeser Auftraggeber verpflichtet den jungen Anwaltsgehilfen Jonathan Harker, für ihn Unterlagen zu pruefen, und laesst ihn dafuer zu sich ins ferne Transsilvanien reisen. Tief verwurzelt in alten Legenden, entdeckt Harker die Geheimnisse, die hinter den alten Burgmauern begraben liegen und das seltsame Verhalten seines Gastgebers in ein bedrohliches Licht ruecken. Waehrend Harker beginnt, an seinem Verstand zu zweifeln, erreicht den renommierten Wissenschaftler Abraham van Helsing eine beunruhigende Nachricht, die ihn unverzueglich nach England aufbrechen laesst. Zwischen Albtraum und Wirklichkeit beginnt eine atemlose Verfolgungsjagd auf Leben und Tod.', 'Bram Stoker'),
(14, 5, 'Chain of Thorns', 'ChainofThorns.jpg', 23.5, 'Die Schattenjaegerin Cordelia Carstairs ist aus dem edwardianischen London nach Paris geflohen. Zu sehr schmerzt sie die unglueckliche Scheinehe mit ihrer großen Liebe James Herondale. Nun sucht sie Vergessen – ausgerechnet mit James bestem Freund an ihrer Seite. Doch unheilvolle Nachrichten treiben die beiden zurueck: Waehrend alte Feinde sich zusammentun und ein maechtiger Hoellendaemon nach der Macht greift, hat sich Cordelias Freundeskreis durch Intrigen und Geheimnisse entzweit. Dabei werden sie die Welt der Schattenjaeger nur gemeinsam gegen das Boese verteidigen koennen – oder in einem letzten großen Kampf alles verlieren ...', 'Cassandra Clare'),
(15, 5, 'City of Lost Souls', 'citySouls.jpg', 12, 'In einem atemberaubenden Kampf ueber den Daechern von New York haben die junge Schattenjaegerin Clary und ihre Freunde die Daemonin Lilith besiegt. Doch die Freude ist von kurzer Dauer: Von Jace, den Clary ueber alles liebt, fehlt jede Spur, und auch ihr finsterer Bruder Sebastian ist verschwunden. Wenig spaeter muss Clary erfahren, dass Jace durch Liliths Zauber auf immer mit Sebastian und den Dunklen Maechten verbunden sein wird. Nur wenn seine Schattenjaegerfreunde sich selbst der Schwarzen Magie verschreiben, haben sie eine Chance, dieses grausame Band zu zertrennen. Clary ist zu allem entschlossen – doch kann sie Jace überhaupt noch vertrauen?', 'Cassandra Clare'),
(16, 6, 'Demon Slayer - Kimetsu no Yaiba 9-16 mit Schuber', 'demonSlayer.jpg', 83.5, 'Tanjiro und seine Freunde begleiten den Demon Slayer Tengen Uzui in ein Vergnügungsviertel. Dort sollten seine Spione eigentlich Informationen zu einem Daemon sammeln … bis sie alle spurlos verschwanden. Um an Informationen zu gelangen, müssen Tanjiro und die anderen zu außergewoehnlichen Mitteln greifen. Doch der Daemon ist ihnen bereits auf den Fersen …\r\nDie Baende 9-16 der Erfolgsreihe DEMON SLAYER – KIMETSU NO YAIBA im coolen Sammelschuber!', 'Koyoharu Gotouge'),
(17, 6, 'Fairy Tail Massiv 1', 'fairyTail.jpg', 6.95, 'Lucy ist ein zauberhaftes Maedchen, das schon immer ein Mitglied der legendaeren Magier-Gilde »Fairy Tail« werden wollte. Doch stattdessen geraet sie mit ihrem Ehrgeiz in die Faenge einer Bande, die von einem hinterhaeltigen Magier angefuehrt wird. Ihre einzige Hoffnung ist Natsu, ein eigenartiger Junge, den sie kurz zuvor zufaellig trifft. Natsu ist alles andere als ein typischer Held – er leidet an Reisekrankheit, isst wie ein Schwein und sein bester Freund ist eine sprechende Katze namens Happy. Lucy ahnt noch nicht, auf was fuer verrueckte Abenteuer sie sich mit den beiden einlaesst!', 'Hiro Mashima'),
(18, 6, 'Spy x Family – Band 1', 'spyFamily.jpg', 7.9, 'Sein Name ist Forger. Loid Forger. Deckname: Twilight. Der Auftrag: „Finde eine Familie als Tarnung. Infiltriere die beruehmte Eden-Akademie. Verhindere den drohenden Krieg zwischen Ost und West!“ Was er nicht ahnt: Seine Adoptivtochter kann Gedanken lesen und seine frisch gebackene Ehefrau ist eine Auftragskillerin …?! Uff, diese Familie zu organisieren, ist eine andere Hausnummer als Terrorabwehr und Atombombenentschärfung!', 'Tatsuya Endo'),
(19, 7, 'Todesurteil / Maarten S. Sneijder Bd.2', 'todesurteil.jpg', 10.9, 'In Wien verschwindet die zehnjaehrige Clara. Ein Jahr spaeter taucht sie voellig verstoert am nahen Waldrand wieder auf. Ihr gesamter Ruecken ist mit Motiven aus Dantes \"Inferno\" taetowiert – und sie spricht kein Wort. Indessen nimmt der niederlaendische Profiler Maarten S. Sneijder an der Akademie des BKA fuer hochbegabten Nachwuchs mit seinen Studenten ungeloeste Mordfaelle durch. Seine beste Schuelerin Sabine Nemez entdeckt einen Zusammenhang zwischen mehreren Faellen – aber das Werk des raffinierten Killers ist noch lange nicht beendet. Seine Spur fuehrt nach Wien – wo Clara die einzige ist, die den Moerder je zu Gesicht bekommen hat … Der zweite Fall für Sneijder und Nemez.', 'Andreas Gruber'),
(20, 7, 'Playlist', 'playlist.jpg', 13, 'Musik ist ihr Leben. 15 Songs entscheiden, wie lange es noch dauert. Vor einem Monat verschwand die 15-jaehrige Feline Jagow spurlos auf dem Weg zur Schule. Von ihrer Mutter beauftragt, stoeßt Privatermittler Alexander Zorbach auf einen Musikdienst im Internet, ueber den Feline immer ihre Lieblingssongs hoerte. Das Erstaunliche: Vor wenigen Tagen wurde die Playlist veraendert. Sendet Feline mit der Auswahl der Songs einen versteckten Hinweis, wohin sie verschleppt wurde und wie sie gerettet werden kann? Fieberhaft versucht Zorbach das Raetsel der Playlist zu entschluesseln. Ahnungslos, dass ihn die Suche nach Feline und die Loesung des Raetsels der Playlist in einen grauenhaften Albtraum stuerzen wird. Ein gnadenloser Wettlauf gegen die Zeit, bei dem die UEberlebenschancen aller Beteiligten gegen Null gehen ...', 'Sebastian Fitzek'),
(21, 7, 'Der Insasse', 'insasse.jpg', 12.9, 'Zwei entsetzliche Kindermorde hat er bereits gestanden und die Berliner Polizei zu den grausam entstellten Leichen gefuehrt. Doch jetzt schweigt Guido T., der im Hochsicherheitstrakt der Psychiatrie einsitzt, auf Anraten seiner Anwaeltin. Die Polizei ist sicher: Er ist auch der Entfuehrer des sechsjaehrigen Max, der seit einem Jahr spurlos verschwunden ist. Die Ermittler haben jedoch keine belastbaren Beweise, nur Indizien. Und ohne die Aussage des Häftlings werden Maxs Eltern keine Gewissheit haben und niemals Abschied von ihrem Sohn nehmen koennen. Monate nach dem Verschwinden von Max macht ein Ermittler der Mord-Kommission dem verzweifelten Vater ein unglaubliches Angebot: Er schleust ihn in das psychiatrische Gefaengnis-Krankenhaus ein, in dessen Hochsicherheitstrakt Guido T. eingesperrt ist. Als falscher Patient, ausgestattet mit einer fingierten Krankenakte. Damit er dem Kindermoerder so nahe wie nur irgend moeglich ist und ihn zu einem Gestaendnis zwingen kann. Denn nichts ist s', 'Sebastian Fitzek');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rechnungen`
--

CREATE TABLE `rechnungen` (
  `r_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `b_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bestellungen`
--
ALTER TABLE `bestellungen`
  ADD PRIMARY KEY (`b_id`),
  ADD UNIQUE KEY `u_id` (`u_id`),
  ADD UNIQUE KEY `pr_id` (`pr_id`),
  ADD KEY `b_timestamp` (`b_timestamp`);

--
-- Indizes für die Tabelle `gutscheine`
--
ALTER TABLE `gutscheine`
  ADD PRIMARY KEY (`g_id`),
  ADD UNIQUE KEY `g_code` (`g_code`);

--
-- Indizes für die Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  ADD PRIMARY KEY (`k_id`),
  ADD UNIQUE KEY `k_name` (`k_name`);

--
-- Indizes für die Tabelle `personen`
--
ALTER TABLE `personen`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indizes für die Tabelle `produkte`
--
ALTER TABLE `produkte`
  ADD PRIMARY KEY (`pr_id`),
  ADD UNIQUE KEY `pr_bild` (`pr_bild`),
  ADD KEY `k_id_2` (`k_id`),
  ADD KEY `k_id` (`k_id`) USING BTREE;

--
-- Indizes für die Tabelle `rechnungen`
--
ALTER TABLE `rechnungen`
  ADD PRIMARY KEY (`r_id`),
  ADD UNIQUE KEY `u_id` (`u_id`),
  ADD KEY `b_timestamp` (`b_timestamp`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `u_username` (`u_username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bestellungen`
--
ALTER TABLE `bestellungen`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `gutscheine`
--
ALTER TABLE `gutscheine`
  MODIFY `g_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  MODIFY `k_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `personen`
--
ALTER TABLE `personen`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `produkte`
--
ALTER TABLE `produkte`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT für Tabelle `rechnungen`
--
ALTER TABLE `rechnungen`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bestellungen`
--
ALTER TABLE `bestellungen`
  ADD CONSTRAINT `bestellungen_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bestellungen_ibfk_2` FOREIGN KEY (`pr_id`) REFERENCES `produkte` (`pr_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `personen`
--
ALTER TABLE `personen`
  ADD CONSTRAINT `personen_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `produkte`
--
ALTER TABLE `produkte`
  ADD CONSTRAINT `produkte_ibfk_1` FOREIGN KEY (`k_id`) REFERENCES `kategorien` (`k_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `rechnungen`
--
ALTER TABLE `rechnungen`
  ADD CONSTRAINT `rechnungen_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rechnungen_ibfk_2` FOREIGN KEY (`b_timestamp`) REFERENCES `bestellungen` (`b_timestamp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
