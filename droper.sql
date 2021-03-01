-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 28/02/2021 às 18:33
-- Versão do servidor: 10.4.14-MariaDB
-- Versão do PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `droper`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `title`, `slug`, `status`) VALUES
(2330172, 0, 'Crianças & Bebes ', '2330172-criancas-bebes', 1),
(2330176, 2330172, 'Roupas para menina', '2330176-roupas-para-menina', 1),
(2333373, 2330176, 'Vestido Infantil', '2333373-vestido-infantil', 1),
(2344729, 0, 'Automotivo', '2344729-automotivo', 1),
(2344731, 2344729, 'Scanners Automotivos', '2344731-scanners-automotivos', 1),
(2363356, 0, 'Beleza e Cuidado Pessoal', '2363356-beleza-e-cuidado-pessoal', 1),
(2363358, 2363356, 'Barba e Cabelo', '2363358-barba-e-cabelo', 1),
(2368293, 0, 'Casa e Cozinha', '2368293-casa-e-cozinha', 1),
(2368297, 2368293, 'Lâmpadas Repelentes', '2368297-lampadas-repelentes', 1),
(2371240, 0, 'Eletrodomésticos', '2371240-eletrodomesticos', 1),
(2371241, 2371240, 'Ar e ventilação', '2371241-ar-e-ventilacao', 1),
(2371242, 2371241, 'Climatizadores', '2371242-climatizadores', 1),
(2373996, 0, 'Celulares e Telefones', '2373996-celulares-e-telefones', 1),
(2373997, 2373996, 'Acessórios para celulares', '2373997-acessorios-para-celulares', 1),
(2373998, 2373997, 'Carregadores Veiculares', '2373998-carregadores-veiculares', 1),
(2373999, 2373997, 'Carregadores Portáteis', '2373999-carregadores-portateis', 1),
(2400142, 2368293, 'Acessórios para Limpeza', '2400142-acessorios-para-limpeza', 1),
(2401715, 0, 'Vestuário', '2401715-vestuario', 1),
(2401717, 2401715, 'Feminino', '2401717-feminino', 1),
(2401720, 2401717, 'Babylooks', '2401720-babylooks', 1),
(2417758, 2363356, 'Kits para o cabelo', '2417758-kits-para-o-cabelo', 1),
(2461178, 2363358, 'Shampoos e Condicionadores', '2461178-shampoos-e-condicionadores', 1),
(2578310, 0, 'Brinquedos e Hobbies', '2578310-brinquedos-e-hobbies', 1),
(2578312, 2578310, 'Bonecos e Bonecas', '2578312-bonecos-e-bonecas', 1),
(2578314, 2578312, 'Bonecas', '2578314-bonecas', 1),
(2584765, 2368293, 'Utilidades Domésticas', '2584765-utilidades-domesticas', 1),
(2584766, 2584765, 'Utensílios de Preparação', '2584766-utensilios-de-preparacao', 1),
(2584768, 2584766, 'Outros Utensílios', '2584768-outros-utensilios', 1),
(2584868, 0, 'Esporte e Fitness', '2584868-esporte-e-fitness', 1),
(2584869, 2584868, 'Fitness e Musculação', '2584869-fitness-e-musculacao', 1),
(2584871, 2584869, 'Funcional, Pilates e Yoga', '2584871-funcional-pilates-e-yoga', 1),
(2584879, 2584871, 'Pranchas de Equilibrio', '2584879-pranchas-de-equilibrio', 1),
(2591814, 2584766, 'Tábuas de Corte', '2591814-tabuas-de-corte', 1),
(2664440, 2368293, 'Torneiras de Cozinha', '2664440-torneiras-de-cozinha', 1),
(2672325, 2584868, 'Camping & Lazer', '2672325-camping-lazer', 1),
(2672327, 2672325, 'Caixas térmicas, Bolsas térmicas e Gelo', '2672327-caixas-termicas-bolsas-termicas-e-gelo', 1),
(2679450, 2368293, 'Churrasco', '2679450-churrasco', 1),
(2679512, 2679450, 'Garfos', '2679512-garfos', 1),
(2696352, 2578310, 'Jogos de Tabuleiro e Cartas', '2696352-jogos-de-tabuleiro-e-cartas', 1),
(2696355, 2696352, 'Jogos de Tabuleiro', '2696355-jogos-de-tabuleiro', 1),
(2697437, 2584766, 'Secadores de Salada', '2697437-secadores-de-salada', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `type` varchar(2) NOT NULL DEFAULT 's',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `img` int(11) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `res_stock` int(11) NOT NULL DEFAULT 0,
  `price` float(14,2) NOT NULL DEFAULT 0.00,
  `ean` varchar(255) DEFAULT NULL,
  `weight` float(15,3) NOT NULL DEFAULT 0.000,
  `width` float(15,2) NOT NULL DEFAULT 0.00,
  `height` float(15,2) NOT NULL DEFAULT 0.00,
  `length` float(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2697438;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
