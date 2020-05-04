-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 02 2020 г., 16:07
-- Версия сервера: 10.1.38-MariaDB
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `online_store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `ID_Category` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`ID_Category`, `name`) VALUES
(1, 'Eyeliner'),
(2, 'Mascara'),
(3, 'Lip gloss'),
(4, 'Powder');

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
  `ID_Items` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `quality` varchar(50) NOT NULL,
  `FID_Vendor` int(11) NOT NULL,
  `FID_Category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`ID_Items`, `name`, `price`, `quantity`, `quality`, `FID_Vendor`, `FID_Category`) VALUES
(1, 'Diorshow Maximizer 3d', 978, 2, 'high', 1, 2),
(2, 'Dior Addict Stellar Gloss', 940, 1, 'high', 1, 3),
(3, 'Diorskin Nude Air Loose Powder', 1460, 10, 'high', 1, 4),
(4, 'Liner Plume', 1299, 4, 'high', 2, 1),
(5, 'L’Absolu Gloss Rosy Plump', 1099, 2, 'high', 2, 3),
(6, 'Monsieur Big Waterproof', 1049, 3, 'high', 2, 2),
(7, 'Party Puff', 1512, 1, 'high', 3, 4),
(8, 'Little Black Liner', 924, 9, 'high', 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `vendors`
--

CREATE TABLE `vendors` (
  `ID_Vendors` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `vendors`
--

INSERT INTO `vendors` (`ID_Vendors`, `name`) VALUES
(1, 'Dior'),
(2, 'Lancome'),
(3, 'Estee Lauder');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID_Category`);

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID_Items`),
  ADD KEY `FID_Vendor` (`FID_Vendor`),
  ADD KEY `FID_Category` (`FID_Category`);

--
-- Индексы таблицы `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`ID_Vendors`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`FID_Vendor`) REFERENCES `vendors` (`ID_Vendors`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`FID_Category`) REFERENCES `category` (`ID_Category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
