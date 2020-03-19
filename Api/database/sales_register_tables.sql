--
create table tb_endereco(
  id_endereco serial,
  cep varchar(8),
  rua varchar(255),
  numero integer,
  bairro varchar(255),
  estado varchar(200),
  primary key (id_endereco)
);

create table tb_cliente(
    id_cliente serial,
    id_endereco integer not null,
    cpf varchar(11),
    nome varchar(255),
    email varchar(255),
    data_nasc date,
    sexo char,
    telefone varchar(14),
    primary key (id_cliente, cpf),
    foreign key (id_endereco) references tb_endereco(id_endereco)

);

create table tb_cargo(
  id_cargo serial,
  id_funcionario integer not null,
  categoria varchar(255),
  salario_base double precision,
  primary key (nome_cargo),
  foreign key (id_funcionario) references tb_funcionario (id_funcionario)
);

create table loja (
    id_loja serial,
    id_endereco integer not null,
    cnpj varchar(14),
    razao_social varchar(255),
    nome_fantasia varchar(255),
    primary key (id_loja, cnpj),
    foreign key (id_endereco) references tb_endereco(id_endereco)
);

create table tb_funcionario(
  id_funcionario serial,
  telefone varchar(14),
  nome varchar(255),
  salario double precision,
  ctpa varchar(11),
  data_nasc date,
  usuario varchar(100),
  senha varchar(20),
  id_endereco integer not null,
  primary key (id_funcionario),
  foreign key (id_endereco) references tb_endereco(id_endereco)
);

create table produto(
    id_produto serial,
    id_estoque integer not null,
    descricao varchar(255),
    categoria varchar(255),
    primary key (id_produto),
    foreign key (id_estoque) references tb_estoque(id_estoque)
);

create table tb_pedido(
    id_pedido serial,
    id_loja integer not null,
    id_funcionario integer not null,
    primary key (id_pedido),
    foreign key (id_loja) references tb_loja(id_loja),
    foreign key (id_funcionario) references tb_funcionario(id_funcionario)
);

create table pedido_info(
  id_pedido_info serial,
  id_pedido integer not null,
  id_produto integer not null,
  quantidade integer,
  data date,
  primary key (id_pedido_info),
  foreign key (id_pedido) references tb_pedido(id_pedido),
  foreign key (id_produto) references tb_produto(id_produto)
);

create table tb_forma_pagamento(
  id_forma_pagamento serial,
  tipo varchar(20),
  primary key (id_forma_pagamento)
);

create table tb_transacao(
  id_transacao serial,
  id_forma_pagamento integer not null,
  tipo varchar(20),
  data date,
  primary key (id_transacao),
  foreign key (id_forma_pagamento) references tb_forma_pagamento(id_forma_pagamento),
);

create table tb_cliente_pagamento_transacao(
  id_cliente integer not null,
  id_transacao integer not null,
  data date,
  primary key (id_cliente, id_transacao),
  foreign key (id_cliente) references tb_cliente(id_cliente),
  foreign key (id_transacao) references tb_transacao(id_transacao)
);

create table tb_funcionario_venda_transacao(
  id_funcionario integer,
  id_transacao integer,
  comissao integer,
  primary key (id_transacao),
  foreign key (id_funcionario) references tb_funcionario(id_funcionario),
  foreign key (id_transacao) references tb_transacao(id_transacao)
);

create table estoque(
    id_estoque serial,
    id_produto integer not null,
    quantidade integer,
    primary key (id_estoque),
    foreign key (id_produto) references tb_produto(id_produto)

);

/*
create table hitorico(
    id_historico serial,
    id_cliente integer not null,
     id_loja integer not null,
);

*/

