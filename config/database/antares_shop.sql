drop database if exists antares_shop;

create database antares_shop;

use antares_shop;

create table nacionalidade(
	id_nacionalidade int auto_increment primary key,
    nm_nacionalidade varchar(100) not null
);

create table endereco(
	id_endereco int auto_increment primary key,
    ds_cep varchar(9),
    ds_estado varchar(2),
    ds_cidade varchar(100),
    ds_rua varchar(200),
    ds_bairro varchar(100),
    ds_numero varchar(5)
);

create table cliente(
	id_cliente int auto_increment primary key,
    nm_cliente varchar(200) not null,
    ds_emailCliente varchar(200) not null,
    ds_senhaCliente varchar(100) not null,
    ds_cpfCliente varchar (20),
    dt_nascimento date not null,
    id_nacionalidade int not null,
    nmr_telefoneCliente varchar(20),
    ds_fPerfilCliente varchar(100),
    id_endereco int,
    
    constraint foreign key (id_nacionalidade) references nacionalidade(id_nacionalidade),
    constraint foreign key (id_endereco) references endereco(id_endereco)
);

create table vendedor(
	id_vendedor int auto_increment primary key,
    nm_vendedor varchar(200) not null,
    ds_emailVendedor varchar(200) not null,
    ds_senhaVendedor varchar(100) not null,
    ds_cpfVendedor varchar (20),
    dt_nascimento date not null,
    id_nacionalidade int not null,
    nmr_telefoneVendedor varchar(20),
    ds_fPerfilVendedor varchar(100),
    id_endereco int,
    
    constraint foreign key (id_nacionalidade) references nacionalidade(id_nacionalidade),
    constraint foreign key (id_endereco) references endereco(id_endereco)
);

create table cupom(
	id_cupom int auto_increment primary key,
    ds_tipo enum('FRETE','DESCONTO') not null,
    vl_cupom decimal(10,2)
);

create table cupom_cliente(
	id_cupom int not null,
    id_cliente int not null,
    dt_validade datetime,
    
    constraint pk_cupomCli
        primary key (id_cupom, id_cliente)
);

create table produto(
	cd_produto int auto_increment primary key,
    nm_produto varchar(200) not null,
    ds_produto varchar (500) not null,
    vl_procoPorduto decimal(10,2) not null,
    ds_fotoProduto varchar(100)
);

create table favorito(
	id_favorito int auto_increment primary key,
    cd_produto int,
    id_cliente int,
    
    constraint foreign key (cd_produto) references produto(cd_produto),
    constraint foreign key (id_cliente) references cliente(id_cliente)
);

create table avaliacao(
	id_avaliacao int auto_increment primary key,
    cd_produto int,
    id_cliente int,
    ds_avaliacao varchar(200),
    qt_estrela int,
    dt_avaliacao datetime,
    
	constraint foreign key (cd_produto) references produto(cd_produto),
    constraint foreign key (id_cliente) references cliente(id_cliente)
);

create table carrinho(
	id_carrinho int auto_increment primary key,
    cd_produto int not null,
    qt_produto int not null,
    ds_metodoPagamento enum('CRÉDITO','PIX','BOLETO')
);