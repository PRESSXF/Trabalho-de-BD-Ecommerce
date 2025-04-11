-- Criar o banco de dados e utilizá-lo
DROP DATABASE IF EXISTS ECommerce;
CREATE DATABASE ECommerce;
USE ECommerce;

-- Tabela de Usuários
DROP TABLE IF EXISTS Usuarios;
CREATE TABLE Usuarios (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Senha VARCHAR(255),
    Tipo_Usuario ENUM('cliente', 'administrador'),
    Data_Cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Categorias
DROP TABLE IF EXISTS Categorias;
CREATE TABLE Categorias (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Categoria VARCHAR(100),
    Descricao TEXT
);

-- Tabela de Fornecedores
DROP TABLE IF EXISTS Fornecedores;
CREATE TABLE Fornecedores (
    ID_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Fornecedor VARCHAR(100),
    CNPJ VARCHAR(14),
    Endereco TEXT
);

-- Tabela de Produtos
DROP TABLE IF EXISTS Produtos;
CREATE TABLE Produtos (
    ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao TEXT,
    Preco DECIMAL(10, 2),
    Quantidade_Estoque INT,
    ID_Categoria INT,
    ID_Fornecedor INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria),
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedores(ID_Fornecedor)
);

-- Tabela de Pedidos
DROP TABLE IF EXISTS Pedidos;
CREATE TABLE Pedidos (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    Data_Pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ID_Usuario INT,
    Status_Pedido ENUM('pendente', 'concluído', 'cancelado'),
    Total_Pedido DECIMAL(10, 2),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

-- Tabela de Itens de Pedido
DROP TABLE IF EXISTS Itens_Pedido;
CREATE TABLE Itens_Pedido (
    ID_Item_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT,
    ID_Produto INT,
    Quantidade INT,
    Preco_Unitario DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID_Produto)
);

-- Tabela de Métodos de Pagamento
DROP TABLE IF EXISTS Metodos_Pagamento;
CREATE TABLE Metodos_Pagamento (
    ID_Metodo_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Metodo_Pagamento VARCHAR(100),
    Descricao TEXT
);

-- Tabela de Pagamentos
DROP TABLE IF EXISTS Pagamentos;
CREATE TABLE Pagamentos (
    ID_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT,
    ID_Metodo_Pagamento INT,
    Valor DECIMAL(10, 2),
    Data_Pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status_Pagamento ENUM('pendente', 'pago', 'falhado'),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Metodo_Pagamento) REFERENCES Metodos_Pagamento(ID_Metodo_Pagamento)
);

-- Tabela de Entregas
DROP TABLE IF EXISTS Entregas;
CREATE TABLE Entregas (
    ID_Entrega INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT,
    Endereco_Entrega TEXT,
    Data_Envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status_Envio ENUM('pendente', 'enviado', 'entregue'),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido)
);

-- Tabela de Avaliações
DROP TABLE IF EXISTS Avaliacoes;
CREATE TABLE Avaliacoes (
    ID_Avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    ID_Produto INT,
    ID_Usuario INT,
    Nota INT CHECK (Nota BETWEEN 1 AND 5),
    Comentario TEXT,
    Data_Avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID_Produto),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);
