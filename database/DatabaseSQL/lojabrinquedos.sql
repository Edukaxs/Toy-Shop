-- =============================================
-- Banco de dados: lojabrinquedos
-- =============================================

IF DB_ID(N'LojaDeBrinquedos') IS NULL
    CREATE DATABASE LojaDeBrinquedos;
GO

USE LojaDeBrinquedos;
GO

CREATE TABLE categoria (
    idCategoria INT IDENTITY(1,1) NOT NULL,      -- Chave Primaria
    Nome        NVARCHAR(120) NOT NULL,
    Descricao   NVARCHAR(200) NOT NULL,
    CONSTRAINT PK_categoria PRIMARY KEY (idCategoria)
);
GO

CREATE TABLE cliente (
    idCliente INT IDENTITY(1,1) NOT NULL,        -- Chave Primaria
    Nome      NVARCHAR(120) NOT NULL,
    CPF       VARCHAR(11)   NOT NULL,
    Telefone  VARCHAR(20)   NOT NULL,
    Email     NVARCHAR(120) NOT NULL,
    Endereco  NVARCHAR(200) NOT NULL,
    CONSTRAINT PK_cliente PRIMARY KEY (idCliente)
);
GO

CREATE TABLE fornecedor (
    idFornecedor INT IDENTITY(1,1) NOT NULL,     -- Chave Primaria
    Nome         NVARCHAR(120) NOT NULL,
    CNPJ         VARCHAR(14)   NOT NULL,
    Telefone     VARCHAR(20)   NOT NULL,
    Email        NVARCHAR(120) NOT NULL,
    CONSTRAINT PK_fornecedor PRIMARY KEY (idFornecedor)
);
GO

CREATE TABLE funcionario (
    idFuncionario  INT IDENTITY(1,1) NOT NULL,   -- Chave Primaria
    Nome           NVARCHAR(120) NOT NULL,
    Cargo          NVARCHAR(60)  NOT NULL,
    Login          VARCHAR(60)   NOT NULL,
    Senha          VARCHAR(255)  NOT NULL,
    nivelPermissao INT           NOT NULL,
    CONSTRAINT PK_funcionario PRIMARY KEY (idFuncionario)
);
GO

CREATE TABLE produto (
    idProduto         INT IDENTITY(1,1) NOT NULL, -- Chave Primaria
    Nome              NVARCHAR(120) NOT NULL,
    Preco             DECIMAL(10,2) NOT NULL,
    quantidadeEstoque INT           NOT NULL,
    idFornecedor      INT           NOT NULL,     -- FK de Fornecedor
    idCategoria       INT           NOT NULL,     -- FK de Categoria
    CONSTRAINT PK_produto PRIMARY KEY (idProduto),
    CONSTRAINT produto_ibfk_1 FOREIGN KEY (idFornecedor) REFERENCES fornecedor (idFornecedor),
    CONSTRAINT produto_ibfk_2 FOREIGN KEY (idCategoria)  REFERENCES categoria (idCategoria)
);
GO

CREATE TABLE venda (
    idVenda       INT IDENTITY(1,1) NOT NULL,     -- Chave Primaria
    dataVenda     DATETIME2(0)  NOT NULL,
    ValorTotal    DECIMAL(10,2) NOT NULL,
    idCliente     INT           NOT NULL,         -- FK de cliente
    idFuncionario INT           NOT NULL,         -- FK de funcionario
    CONSTRAINT PK_venda PRIMARY KEY (idVenda),
    CONSTRAINT venda_ibfk_1 FOREIGN KEY (idCliente)     REFERENCES cliente (idCliente),
    CONSTRAINT venda_ibfk_2 FOREIGN KEY (idFuncionario) REFERENCES funcionario (idFuncionario)
);
GO

CREATE TABLE item_venda (
    idItemVenda   INT IDENTITY(1,1) NOT NULL,     -- Chave Primaria
    Quantidade    INT           NOT NULL,
    precoUnitario DECIMAL(10,2) NOT NULL,
    idVenda       INT           NOT NULL,         -- FK de Venda
    idProduto     INT           NOT NULL,         -- FK de Produto
    CONSTRAINT PK_item_venda PRIMARY KEY (idItemVenda),
    CONSTRAINT item_venda_ibfk_1 FOREIGN KEY (idVenda)   REFERENCES venda (idVenda),
    CONSTRAINT item_venda_ibfk_2 FOREIGN KEY (idProduto) REFERENCES produto (idProduto)
);
GO

CREATE INDEX idx_item_venda_idVenda     ON item_venda (idVenda);
CREATE INDEX idx_item_venda_idProduto   ON item_venda (idProduto);
CREATE INDEX idx_produto_idFornecedor   ON produto (idFornecedor);
CREATE INDEX idx_produto_idCategoria    ON produto (idCategoria);
CREATE INDEX idx_venda_idCliente        ON venda (idCliente);
CREATE INDEX idx_venda_idFuncionario    ON venda (idFuncionario);
GO