-- Inserções iniciais de exemplo

-- Usuários
INSERT INTO Usuarios (Nome, Email, Senha, Tipo_Usuario)
VALUES 
  ('João Silva', 'joao@email.com', 'senha123', 'cliente'),
  ('Maria Oliveira', 'maria@email.com', 'senha456', 'cliente'),
  ('Admin Master', 'admin@email.com', 'admin123', 'administrador');

-- Categorias
INSERT INTO Categorias (Nome_Categoria, Descricao)
VALUES 
  ('Eletrônicos', 'Dispositivos eletrônicos em geral'),
  ('Roupas', 'Vestuário masculino e feminino'),
  ('Livros', 'Livros de diversos gêneros');

-- Fornecedores
INSERT INTO Fornecedores (Nome_Fornecedor, CNPJ, Endereco)
VALUES 
  ('Fornecedor A', '12345678000199', 'Rua das Flores, 100'),
  ('Fornecedor B', '98765432000188', 'Av. Central, 500');

-- Produtos
INSERT INTO Produtos (Nome, Descricao, Preco, Quantidade_Estoque, ID_Categoria, ID_Fornecedor)
VALUES 
  ('Smartphone X', 'Celular de última geração', 2500.00, 10, 1, 1),
  ('Camiseta Azul', 'Camiseta 100% algodão', 50.00, 25, 2, 2),
  ('Livro Aventura', 'Livro de aventuras épicas', 40.00, 15, 3, 2);

-- Pedidos
INSERT INTO Pedidos (Data_Pedido, ID_Usuario, Status_Pedido, Total_Pedido)
VALUES 
  (NOW(), 1, 'concluído', 2590.00),
  (NOW(), 2, 'pendente', 90.00);

-- Itens do Pedido
INSERT INTO Itens_Pedido (ID_Pedido, ID_Produto, Quantidade, Preco_Unitario, Subtotal)
VALUES 
  (1, 1, 1, 2500.00, 2500.00),
  (1, 2, 1, 50.00, 50.00),
  (2, 3, 2, 40.00, 80.00);

-- Métodos de Pagamento
INSERT INTO Metodos_Pagamento (Nome_Metodo_Pagamento, Descricao)
VALUES 
  ('Cartão de Crédito', 'Pagamento em até 12x'),
  ('Boleto Bancário', 'Pagamento à vista');

-- Pagamentos
INSERT INTO Pagamentos (ID_Pedido, ID_Metodo_Pagamento, Valor, Data_Pagamento, Status_Pagamento)
VALUES 
  (1, 1, 2590.00, NOW(), 'pago'),
  (2, 2, 90.00, NOW(), 'pendente');

-- Entregas
INSERT INTO Entregas (ID_Pedido, Endereco_Entrega, Data_Envio, Status_Envio)
VALUES 
  (1, 'Rua Alfa, 123', NOW(), 'entregue'),
  (2, 'Av. Beta, 456', NULL, 'pendente');

-- Avaliações
INSERT INTO Avaliacoes (ID_Produto, ID_Usuario, Nota, Comentario, Data_Avaliacao)
VALUES 
  (1, 1, 5, 'Excelente produto!', NOW()),
  (3, 2, 4, 'Muito bom!', NOW());
