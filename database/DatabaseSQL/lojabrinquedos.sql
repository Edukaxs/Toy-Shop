-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/09/2026 às 04:13
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lojabrinquedos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL COMMENT 'Chave Primaria**',
  `Nome` varchar(120) NOT NULL,
  `Descricao` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL COMMENT 'Chave Primaria**',
  `Nome` varchar(120) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  `Email` varchar(120) NOT NULL,
  `Endereco` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL COMMENT 'Chave Primaria**',
  `Nome` varchar(120) NOT NULL,
  `CNPJ` varchar(14) NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  `Email` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idFuncionario` int(11) NOT NULL COMMENT 'Chave Primaria**',
  `Nome` varchar(120) NOT NULL,
  `Cargo` varchar(60) NOT NULL,
  `Login` varchar(60) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `nivelPermissao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `idItemVenda` int(11) NOT NULL COMMENT 'Chave Primaria**',
  `Quantidade` int(11) NOT NULL,
  `precoUnitario` decimal(10,0) NOT NULL,
  `idVenda` int(11) NOT NULL COMMENT 'FK de Venda**',
  `idProduto` int(11) NOT NULL COMMENT 'FK de Produto**'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL COMMENT 'Chave Primaria**',
  `Nome` varchar(120) NOT NULL,
  `Preco` decimal(10,0) NOT NULL,
  `quantidadeEstoque` int(11) NOT NULL,
  `idFornecedor` int(11) NOT NULL COMMENT 'FK de Fornecedor**',
  `idCategoria` int(11) NOT NULL COMMENT 'FK de Categoria**'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `idVenda` int(11) NOT NULL COMMENT 'Chave Primaria**',
  `dataVenda` datetime NOT NULL,
  `ValorTotal` decimal(10,0) NOT NULL,
  `idCliente` int(11) NOT NULL COMMENT 'FK de cliente**',
  `idFuncionario` int(11) NOT NULL COMMENT 'FK de funcionario**'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`idFornecedor`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idFuncionario`);

--
-- Índices de tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD PRIMARY KEY (`idItemVenda`),
  ADD KEY `idVenda` (`idVenda`),
  ADD KEY `idProduto` (`idProduto`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`),
  ADD KEY `idFornecedor` (`idFornecedor`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idVenda`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idFuncionario` (`idFuncionario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave Primaria**';

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave Primaria**';

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `idFornecedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave Primaria**';

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `idFuncionario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave Primaria**';

--
-- AUTO_INCREMENT de tabela `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `idItemVenda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave Primaria**';

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave Primaria**';

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave Primaria**';

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `item_venda`
--
ALTER TABLE `item_venda`
  ADD CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`),
  ADD CONSTRAINT `item_venda_ibfk_2` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
