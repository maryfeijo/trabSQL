CREATE TABLE Armazem 
(
    codigo int NOT NULL,
    nome varchar (500) NOT NULL,
    endereco varchar (500),
    descricao varchar (500),
    PRIMARY KEY (codigo)
);

INSERT INTO Armazem(codigo, nome, endereco, descricao)
            VALUES(Var_codigo, "Var_nome", "Var_endereco", "Var_descricao");

DELETE * FROM Armazem WHERE campo1 = Var_var1;

UPDATE Armazem SET nome = Var_nome, endereco = Var_endereco, descricao = Var_descricao WHERE codigo = Var_codigo


CREATE TABLE Fornecedor 
(
    cnpj int NOT NULL,
    razao_social varchar (500) NOT NULL,
    nome varchar (500),
    contato varchar (100),
    endereco varchar (500),
    descricao varchar (500),
    PRIMARY KEY (cnpj),    
);

INSERT INTO Fornecedor(cnpj, razao_social, nome, contato, endereco, descricao)
            VALUES(Var_cnpj, "Var_razao_social", "Var_nome", "Var_contato", "Var_endereco", "Var_descricao");

DELETE * FROM Fornecedor WHERE campo1 = Var_var1;

UPDATE Fornecedor SET cnpj = Var_cnpj, razao_social = Var_razao_social, nome = Var_nome, contato = Var_contato, endereco = Var_endereco, descricao = Var_descricao 
                  WHERE codigo = Var_codigo;



CREATE TABLE Cliente (
    matricula int NOT NULL,
    nome varchar (500),
    contato varchar (100),
    endereco varchar (500),
    situacao varchar (500),
    
    *PRIMARY KEY (matricula),
    
);


CREATE TABLE Produto (
    codigo int NOT NULL,
    nome varchar (500) NOT NULL,
    preco double,
    descricao varchar (500),
    situacao varchar (500),
    quantidade int NOT NULL,
    armazem_codigo int NOT NULL,
    fornecedor_cnpj int NOT NULL,
    
    PRIMARY KEY (codigo),
    FOREIGN KEY (armazem_codigo) REFERENCES Armazem(codigo),
    FOREIGN KEY (fornecedor_cnpj) REFERENCES Fornecedor(cnpj)

);

INSERT INTO Produto(codigo, nome, preco, descricao, situacao, quantidade, armazem_codigo, fornecedor_cnpj)
            VALUES(Var_codigo, "Var_nome", preco, "Var_descricao", "Var_situacao", Var_quantidade, Var_armazem_codigo, Var_fornecedor_cnpj);

DELETE * FROM Produto WHERE campo1 = Var_var1;

UPDATE Produto SET codigo = Var_codigo, nome = Var_nome, preco = Var_preco, descricao = Var_descricao, situacao = Var_situacao, quantidade = Var_quantidade, armazem_codigo = Var_armazem_codigo, fornecedor_cnpj = Var_fornecedor_cnpj 
               WHERE codigo = Var_codigo;




CREATE TABLE Pedido (
    codigo int NOT NULL,
    data date NOT NULL,
    valor double,
    situacao varchar(500),
    cliente_matricula int NOT NULL,
    PRIMARY KEY (codigo),
    FOREIGN KEY (cliente_matricula) REFERENCES Cliente(matricula)
);


INSERT INTO Pedido(codigo, data, valor, situacao, cliente_matricula)
            VALUES(Var_codigo, "Var_data", Var_valor, "Var_situacao", Var_cliente_matricula);
DELETE * FROM Pedido WHERE campo1 = Var_var1;

UPDATE Pedido SET codigo = Var_codigo, data = Var_data, valor = Var_valor, situacao = Var_situacao, cliente_matricula = Var_cliente_matricula
               WHERE codigo = Var_codigo;



CREATE TABLE Item (
    sequencial int NOT NULL,
    quantidade int NOT NULL,
    produto_codigo int,
    pedido_codigo int,
    PRIMARY KEY (sequencial, pedido_codigo),
    FOREIGN KEY (produto_codigo) REFERENCES Produto(codigo),
    FOREIGN KEY (pedido_codigo) REFERENCES Pedido(codigo)
);


INSERT INTO Item(sequencial, quantidade, produto_codigo, pedido_codigo)
            VALUES(Var_sequencial, Var_quantidade, Var_produto_codigo, Var_pedido_codigo);

DELETE * FROM Item WHERE sequencial

UPDATE Item SET  quantidade = Var_quantidade
            WHERE sequencial = Var_sequencial AND produto_codigo = Var_produto_codigo AND pedido_codigo = Var_pedido_codigo;

CREATE TABLE Pagamento (
    codigo int NOT NULL,
    valor double,
    data date,
    nome varchar (500) NOT NULL,
    descricao varchar (500),
    situacao varchar (500),
    pedido_codigo int NOT NULL,
    
    PRIMARY KEY (codigo),
    FOREIGN KEY (pedido_codigo) REFERENCES Pedido(codigo)
);

INSERT INTO Pagamento(codigo, valor, data, nome, descricao, situacao, pedido_codigo)
            VALUES(Var_codigo, Var_valor, "Var_data", "Var_nome", "Var_descricao", "Var_situacao", Var_pedido_codigo);

DELETE * FROM Pagamento

UPDATE Pagamento SET codigo = Var_codigo, valor = Var_valor, data = Var_data, nome = Var_nome, descricao = Var_descricao ,situacao = Var_situacao, pedido_codigo = Var_pedido_codigo
               WHERE codigo = Var_codigo;