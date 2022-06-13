-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Cze 2022, 16:09
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

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

--
-- Zrzut danych tabeli `adres`
--

INSERT INTO `adres` (`id`, `wojewodztwo`, `miasto`, `ulica`, `numer_ulicy`) VALUES
(1, 'Śląskie', 'Katowice', 'Korfantego', 8);

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

--
-- Zrzut danych tabeli `paczkomaty`
--

INSERT INTO `paczkomaty` (`id`, `kod`, `adres_id`) VALUES
(1, 'KOD', 1);

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
(8, 'Czołgi', 4),
(11, 'Samoloty', 4),
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
(1, 'Karabinek DD M4A1 14,5\" - 5,56 mm NATO / .223Rem', '11500.00', 'Karabinek DD M4A1 - żywa \"legenda\" - wyposażony jest w łoże M4A1 RIS II, które jest w użyciu w jednostkach US Special Operations Command (SOCOM) w systemie uzbrojenia SOPMOD II od 2005r.Ergonomiczne lekkie łoże z zestawem szyn Picatinny pozwala na swobodn', 4, 1, 10),
(2, 'DDM4 V11', '9000.00', 'DDM4 V11 z lufą 16\" to jeden z najnowszych modeli z rodzin karabinków firmy Daniel Defense. Bazuje na sprawdzonej konstrukcji AR-15 ale posiada łoże z systemem KeyMod wyprodukowanym w technologii SLiM Rail™ (Slim Lightweight Modular). ', 4, 2, 10),
(3, 'Karabin DD5V2 18\" - 308Win - M-LOK - Daniel Defens', '13000.00', 'Ponad 10 lat doświadczenia czołowych inżynierów Daniel Defense przyczyniło się do wprowadzenia zupełnie nowego, zaskakującego rozwiązania dla platformy .308 jakim został karabin DD5V2.', 4, 1, 10),
(4, 'Karabin mod. NC-10, kaliber: 308 WIN ', '12900.00', 'Karabin mod. NC-10 kaliber: 308 WIN na podstawie platformy AR-10 zaprojektowany dla profesjonalnych strzelców, wymagających najwyższej precyzji zarówno na stanowisku jak i na tarczy.  Karabinki NC-10 pozwalają użytkownikowi wykorzystać potencjał kalibru .', 4, 1, 4),
(5, 'Karabin Nemo Omen Watchmen kal. .300 WINMAG , 24\"', '33000.00', 'Jeśli zastanawiasz się nad wyborem karabinu długodystansowego w kalibrze .300  - trafiłeś na właściwy produkt. Model Watchman z 24\" lufą jest bardzo lekki i celny.', 4, 3, 2),
(6, 'Karabinek sportowy Saiga AK TR3-7 - 7,62x39 - Kala', '8000.00', 'Karabinek Sportowy Saiga AK TR3-7 został wyprodukowany przez rosyjski koncern Kalashnikov Group jako cywilna wersja karabinka AK-12 i AK-15. ', 4, 1, 6),
(7, 'Amunicja .22LR / 5,6 mm', '2.00', 'Amunicja pistoletowa .22LR / 5,6 mm', 1, 1, 2),
(8, 'Amunicja 9x19 mm', '3.00', 'Amunicja pistoletowa 9x19 mm', 1, 2, 4),
(9, 'Amunicja .45ACP', '2.50', 'Amunicja pistoletowa .45ACP', 1, 3, 2),
(10, 'Amunicja .223 Rem / 5,56x45 mm', '4.00', 'Amunicja karabinowa .223 Rem / 5,56x45 mm', 2, 3, 5),
(11, 'Amunicja .308 Win / 7,62x51 mm', '4.50', 'Amunicja karabinowa .308 Win / 7,62x51 mm', 2, 2, 7),
(12, 'Amunicja 12/70', '5.00', 'Amunicja śrutowa 12/70', 3, 3, 3),
(13, 'PISTOLET HS PRODUKT S7 - 3.3 - 9X19 MM SREBRNO-CZA', '3.00', ' HS Produkt w roku 2020 na nowo definiuje to, czego można oczekiwać od nowoczesnego pistoletu. ', 5, 2, 2),
(14, 'PISTOLET HUDSON H-9 KAL.9X19MM', '5.00', 'HUDSON H9 to nowoczesny pistolet bezkurkowy, zbudowany na szkielecie stalowym, lecz konstrukcyjnie opracowanym tak by był  niewiele cięższym od aluminiowych konstrukcji.  W tworzeniu mechanizmu spustowego oparto się  na rozwiązaniach zastosowanych w model', 5, 1, 3),
(15, 'STRZELBA SAIGA-12 IPSC - 12/76 - KALASHNIKOV GROUP', '11.00', 'Strzelba SAIGA-12 IPSC została zaprojektowana i wyprodukowana przez Kalashnikov Group specjalnie z myślą o strzelcach biorących udział w konkurencjach IPSC lub 3GUN w klasie OPEN.', 6, 2, 6),
(16, 'STRZELBA SAIGA-12K - KALASHNIKOV GROUP', '6.00', 'Strzelba SAIGA 12K (030) produkcji rosyjskiej firmy IZMASH charakteryzuje się świetną jakością wykonania z dbałością o najmniejszy detal przy niezwykle wysokiej niezawodności.', 6, 3, 6),
(17, 'MAGAZYNEK 5.56X45 NATO / .223REM - PMAG 10RD - AR1', '99.00', 'Magazynek Pmag Gen M3 od firmy Magpul posiada pojemność 10 naboi kaliber 5.56x45 NATO / .223 Remington. Kompatybilny z karabinami AR15, M4, M16, HK 416, MR556A1, M27 IAR, SA-80, FN SCAR MK 16/16S.', 13, 1, 4),
(18, 'ADAPTER BIPODÓW DO SYSTEMU PICATINNY', '309.00', 'Ultralekki adapter bipodów od firmy Daniel Defense do systemu KeyMod lub picatinny. Adapter umożliwia bezpieczne przymocowanie dwójnogów.', 13, 2, 3),
(19, 'M1 Abrams', '10000000.00', 'Jego produkcja rozpoczęła się w roku 1980. Istniejące czołgi M1 są stale modernizowane, a starsze wersje pojazdu doprowadzane do nowoczesnych standardów M1A1SA, M1A1FEP i M1A2SEP. Czołg został nazwany imieniem generała Creightona Abramsa – dowódcy 37 Bata', 8, 1, 9),
(20, 'KV-2', '5000000.00', 'Czołg konstrukcji klasycznej: z przodu kadłuba przedział kierowania, w środku przedział bojowy, z tyłu przedział silnikowy i za nim transmisyjny. Nad przedziałem bojowym obrotowa wieża. Kadłub spawany z pancernych płyt walcowanych i giętych, wieża spawana', 8, 2, 5),
(21, 'MiG-21', '50000000.00', 'MiG-21 – radziecki samolot myśliwski skonstruowany w latach 50. XX wieku w biurze konstrukcyjnym MiG przez Artioma Mikojana i Michaiła Guriewicza. Ze względu na swoją sylwetkę dorobił się wśród pilotów nazwy \"ołówek\" lub \"bałałajka\".', 11, 3, 3),
(22, 'Nóż Karambit CS:GO Fade Rainbow', '1000.00', 'Nóż typu karambit o konstrukcji full-tang, czyli z trzpieniem klingi przechodzącym przez całą szerokość rękojeści. Na końcu znajduje się kółko na palec, co zapewnia pewny chwyt. Okładziny wykonane są z tworzywa sztucznego. Profil chwytu ukształtowano w ta', 7, 3, 4);

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

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`id`, `nazwa`, `haslo`, `adres_id`) VALUES
(1, 'GIGACHAD', 'gigachad', 1);

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
-- Zrzut danych tabeli `zawartosc_koszyka`
--

INSERT INTO `zawartosc_koszyka` (`id`, `uzytkownik_id`, `produkt_id`, `ilosc`) VALUES
(1, 1, 1, 1),
(2, 1, 7, 50),
(3, 1, 2, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `stan_dostepnosci`
--
ALTER TABLE `stan_dostepnosci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zawartosc_koszyka`
--
ALTER TABLE `zawartosc_koszyka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
