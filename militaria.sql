-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 09 Mar 2022, 11:22
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `militaria`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres`
--

CREATE TABLE `adres` (
  `id` int(11) NOT NULL,
  `wojewodztwo` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `miasto` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `ulica` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `numer_ulicy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `historia`
--

CREATE TABLE `historia` (
  `id` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  `zamowienie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `kategoria`
--

INSERT INTO `kategoria` (`id`, `nazwa`) VALUES
(1, 'Amunicja'),
(2, 'Broń palna'),
(3, 'Broń biała'),
(4, 'Pojazdy'),
(5, 'Narzędzia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `paczkomaty`
--

CREATE TABLE `paczkomaty` (
  `id` int(11) NOT NULL,
  `kod` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `podkategoria`
--

CREATE TABLE `podkategoria` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `kategoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `podkategoria`
--

INSERT INTO `podkategoria` (`id`, `nazwa`, `kategoria_id`) VALUES
(1, 'Amunicja pistoletowa', 1),
(2, 'Amunicja karabinowa', 1),
(3, 'Amunicja śrutowa', 1),
(4, 'Broń długa', 2),
(5, 'Broń krótka', 2),
(6, 'Strzelby', 2),
(7, 'Noże', 3),
(8, 'Maczety', 3),
(9, 'Czołgi', 4),
(10, 'Samochody opancerzone', 4),
(11, 'Samoloty', 4),
(12, 'Multitool', 5),
(13, 'Inne', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producent`
--

CREATE TABLE `producent` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `producent`
--

INSERT INTO `producent` (`id`, `nazwa`) VALUES
(1, 'Alfa Proj'),
(2, 'Arex'),
(3, 'Arsenal Firearms'),
(4, 'Barnaul'),
(5, 'Beretta'),
(6, 'BUL'),
(7, 'SWIZA'),
(8, 'Victorinox'),
(9, 'Leatherman'),
(10, 'Daniel Defense ');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `koszt` decimal(19,2) DEFAULT NULL,
  `opis` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `podkategoria_id` int(11) NOT NULL,
  `stan_dostepnosci_id` int(11) NOT NULL,
  `producent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `produkt`
--

INSERT INTO `produkt` (`id`, `nazwa`, `koszt`, `opis`, `podkategoria_id`, `stan_dostepnosci_id`, `producent_id`) VALUES
(1, 'Karabinek DD M4A1 14,5\" - 5,56 mm NATO / .223Rem -', '11500.00', 'Karabinek DD M4A1 - żywa \"legenda\" - wyposażony jest w łoże M4A1 RIS II, które jest w użyciu w jednostkach US Special Operations Command (SOCOM) w systemie uzbrojenia SOPMOD II od 2005r.Ergonomiczne lekkie łoże z zestawem szyn Picatinny pozwala na swobodn', 4, 1, 10),
(2, 'DDM4 V11', '9000.00', 'DDM4 V11 z lufą 16\" to jeden z najnowszych modeli z rodzin karabinków firmy Daniel Defense. Bazuje na sprawdzonej konstrukcji AR-15 ale posiada łoże z systemem KeyMod wyprodukowanym w technologii SLiM Rail™ (Slim Lightweight Modular). ', 4, 2, 10),
(3, 'Karabin DD5V2 18\" - 308Win - M-LOK - Daniel Defens', '13000.00', 'Ponad 10 lat doświadczenia czołowych inżynierów Daniel Defense przyczyniło się do wprowadzenia zupełnie nowego, zaskakującego rozwiązania dla platformy .308 jakim został karabin DD5V2.', 4, 1, 10),
(4, 'Karabin mod. NC-10, kaliber: 308 WIN ', '12900.00', 'Karabin mod. NC-10 kaliber: 308 WIN na podstawie platformy AR-10 zaprojektowany dla profesjonalnych strzelców, wymagających najwyższej precyzji zarówno na stanowisku jak i na tarczy.  Karabinki NC-10 pozwalają użytkownikowi wykorzystać potencjał kalibru .', 4, 1, 4),
(5, 'Karabin Nemo Omen Watchmen kal. .300 WINMAG , 24\",', '33000.00', 'Jeśli zastanawiasz się nad wyborem karabinu długodystansowego w kalibrze .300  - trafiłeś na właściwy produkt. Model Watchman z 24\" lufą jest bardzo lekki i celny.', 4, 3, 2),
(6, 'Karabinek sportowy Saiga AK TR3-7 - 7,62x39 - Kala', '8000.00', 'Karabinek Sportowy Saiga AK TR3-7 został wyprodukowany przez rosyjski koncern Kalashnikov Group jako cywilna wersja karabinka AK-12 i AK-15. ', 4, 1, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stan_dostepnosci`
--

CREATE TABLE `stan_dostepnosci` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `ilosc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `stan_dostepnosci`
--

INSERT INTO `stan_dostepnosci` (`id`, `nazwa`, `ilosc`) VALUES
(1, 'Mała', 101),
(2, 'Średnia', 1001),
(3, 'Duża', 10001),
(4, 'Towar niedostępny', 0),
(5, 'Brak', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `haslo` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `id` int(11) NOT NULL,
  `numer_zamowenia` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `uzytkownik_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie_has_produkt`
--

CREATE TABLE `zamowienie_has_produkt` (
  `zamowienie_id` int(11) NOT NULL,
  `produkt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawartosc_koszyka`
--

CREATE TABLE `zawartosc_koszyka` (
  `id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `produkt_id` int(11) NOT NULL,
  `ilosc` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adres`
--
ALTER TABLE `adres`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_historia_zamowienie1_idx` (`zamowienie_id`);

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `paczkomaty`
--
ALTER TABLE `paczkomaty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Paczkomaty_adres1_idx` (`adres_id`);

--
-- Indeksy dla tabeli `podkategoria`
--
ALTER TABLE `podkategoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_podkategoria_kategoria1_idx` (`kategoria_id`);

--
-- Indeksy dla tabeli `producent`
--
ALTER TABLE `producent`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produkt_podkategoria_idx` (`podkategoria_id`),
  ADD KEY `fk_produkt_stan_dostepnosci1_idx` (`stan_dostepnosci_id`),
  ADD KEY `fk_produkt_producent1_idx` (`producent_id`);

--
-- Indeksy dla tabeli `stan_dostepnosci`
--
ALTER TABLE `stan_dostepnosci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_uzytkownik_adres1_idx` (`adres_id`);

--
-- Indeksy dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zamowienie_uzytkownik1_idx` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `zamowienie_has_produkt`
--
ALTER TABLE `zamowienie_has_produkt`
  ADD PRIMARY KEY (`zamowienie_id`,`produkt_id`),
  ADD KEY `fk_zamowienie_has_produkt_produkt1_idx` (`produkt_id`),
  ADD KEY `fk_zamowienie_has_produkt_zamowienie1_idx` (`zamowienie_id`);

--
-- Indeksy dla tabeli `zawartosc_koszyka`
--
ALTER TABLE `zawartosc_koszyka`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zawartosc_koszyka_uzytkownik1_idx` (`uzytkownik_id`),
  ADD KEY `fk_zawartosc_koszyka_produkt1_idx` (`produkt_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `adres`
--
ALTER TABLE `adres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `historia`
--
ALTER TABLE `historia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `paczkomaty`
--
ALTER TABLE `paczkomaty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `podkategoria`
--
ALTER TABLE `podkategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `producent`
--
ALTER TABLE `producent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `produkt`
--
ALTER TABLE `produkt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `stan_dostepnosci`
--
ALTER TABLE `stan_dostepnosci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zawartosc_koszyka`
--
ALTER TABLE `zawartosc_koszyka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `historia`
--
ALTER TABLE `historia`
  ADD CONSTRAINT `fk_historia_zamowienie1` FOREIGN KEY (`zamowienie_id`) REFERENCES `zamowienie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `paczkomaty`
--
ALTER TABLE `paczkomaty`
  ADD CONSTRAINT `fk_Paczkomaty_adres1` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `podkategoria`
--
ALTER TABLE `podkategoria`
  ADD CONSTRAINT `fk_podkategoria_kategoria1` FOREIGN KEY (`kategoria_id`) REFERENCES `kategoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD CONSTRAINT `fk_produkt_podkategoria` FOREIGN KEY (`podkategoria_id`) REFERENCES `podkategoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produkt_producent1` FOREIGN KEY (`producent_id`) REFERENCES `producent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produkt_stan_dostepnosci1` FOREIGN KEY (`stan_dostepnosci_id`) REFERENCES `stan_dostepnosci` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD CONSTRAINT `fk_uzytkownik_adres1` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `fk_zamowienie_uzytkownik1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `zamowienie_has_produkt`
--
ALTER TABLE `zamowienie_has_produkt`
  ADD CONSTRAINT `fk_zamowienie_has_produkt_produkt1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_zamowienie_has_produkt_zamowienie1` FOREIGN KEY (`zamowienie_id`) REFERENCES `zamowienie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `zawartosc_koszyka`
--
ALTER TABLE `zawartosc_koszyka`
  ADD CONSTRAINT `fk_zawartosc_koszyka_produkt1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_zawartosc_koszyka_uzytkownik1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
