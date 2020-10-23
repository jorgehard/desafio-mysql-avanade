/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db`;

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) CHARACTER SET latin1 NOT NULL,
  `cpf` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `cnpj` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logradouro` varchar(250) CHARACTER SET latin1 NOT NULL,
  `numero` int(5) NOT NULL DEFAULT '0',
  `complemento` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `bairro` varchar(150) CHARACTER SET latin1 NOT NULL,
  `cep` int(8) NOT NULL DEFAULT '0',
  `cidade` varchar(100) CHARACTER SET latin1 NOT NULL,
  `uf` varchar(2) CHARACTER SET latin1 NOT NULL,
  `id_tipo_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_clientes_tipo_cliente` (`id_tipo_cliente`),
  CONSTRAINT `FK_clientes_tipo_cliente` FOREIGN KEY (`id_tipo_cliente`) REFERENCES `tipo_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `nome`, `cpf`, `cnpj`, `logradouro`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `id_tipo_cliente`) VALUES
	(1, 'Heloisa Pereira', '25597192825', NULL, 'Rua José Antônio Coelho', 395, 'Apto 30', 'Vila Mariana', 4011060, 'São Paulo', 'SP', 1);
INSERT INTO `clientes` (`id`, `nome`, `cpf`, `cnpj`, `logradouro`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `id_tipo_cliente`) VALUES
	(2, 'Manuela Alice Oliveira', '20844918865', NULL, 'Rua Padre Josino', 301, 'Apto 301', 'Vila dos Palmares', 5273070, 'São Paulo', 'SP', 1);
INSERT INTO `clientes` (`id`, `nome`, `cpf`, `cnpj`, `logradouro`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `id_tipo_cliente`) VALUES
	(3, 'Osvaldo Iago Marcos Vinicius Mendes', '21421375800', NULL, 'Rua Guaianases 1385', 332, 'Apto 10', 'Campos Elíseos', 1204900, 'São Paulo', 'SP', 1);
INSERT INTO `clientes` (`id`, `nome`, `cpf`, `cnpj`, `logradouro`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `id_tipo_cliente`) VALUES
	(4, 'Henrique Manuel', '17205623855', NULL, 'Rua Barra do Manhuaçu', 903, NULL, 'Jardim Peri', 2679070, 'São Paulo', 'SP', 1);
INSERT INTO `clientes` (`id`, `nome`, `cpf`, `cnpj`, `logradouro`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `id_tipo_cliente`) VALUES
	(5, 'Danilo Ferreira Souza', '03872901842', NULL, 'Travessa José Vieira da Luz', 602, NULL, 'Campo Belo', 4609020, 'São Paulo', 'SP', 1);
INSERT INTO `clientes` (`id`, `nome`, `cpf`, `cnpj`, `logradouro`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `id_tipo_cliente`) VALUES
	(6, 'Luan Murilo Jesus', '36984965853', NULL, 'Rua Doutor Diogo de Faria', 391, 'Casa 2', 'Vila Clementino', 4037005, 'São Paulo', 'SP', 1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `cliente_veiculos_servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_veiculo` int(11) NOT NULL,
  `id_tipo_servico` int(11) NOT NULL,
  `data_servico` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cliente_veiculos_servicos_clientes` (`id_cliente`),
  KEY `FK_cliente_veiculos_servicos_veiculos` (`id_veiculo`),
  KEY `FK_cliente_veiculos_servicos_tipo_servicos` (`id_tipo_servico`),
  CONSTRAINT `FK_cliente_veiculos_servicos_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `FK_cliente_veiculos_servicos_tipo_servicos` FOREIGN KEY (`id_tipo_servico`) REFERENCES `tipo_servicos` (`id`),
  CONSTRAINT `FK_cliente_veiculos_servicos_veiculos` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `cliente_veiculos_servicos` DISABLE KEYS */;
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(1, 5, 7, 1, '2020-10-23');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(2, 1, 1, 1, '2020-10-23');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(3, 4, 6, 2, '2020-10-23');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(4, 6, 2, 1, '2020-05-23');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(5, 2, 4, 2, '2020-03-20');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(6, 4, 2, 1, '2020-05-19');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(7, 5, 7, 1, '2020-03-15');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(8, 5, 7, 1, '2020-03-30');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(9, 5, 7, 2, '2020-02-10');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(10, 2, 4, 1, '2020-01-18');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(11, 1, 2, 1, '2019-11-20');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(12, 2, 3, 2, '2019-10-12');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(13, 2, 5, 1, '2020-01-21');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(14, 2, 5, 2, '2020-02-05');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(15, 5, 6, 1, '2020-10-23');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(16, 3, 4, 1, '2020-08-25');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(17, 1, 1, 1, '2020-06-21');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(18, 1, 2, 1, '2020-04-03');
INSERT INTO `cliente_veiculos_servicos` (`id`, `id_cliente`, `id_veiculo`, `id_tipo_servico`, `data_servico`) VALUES
	(19, 1, 1, 2, '2020-01-01');
/*!40000 ALTER TABLE `cliente_veiculos_servicos` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `precos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_veiculo` int(11) NOT NULL,
  `id_tipo_servico` int(11) NOT NULL,
  `preco` float(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `FK_precos_veiculos` (`id_veiculo`),
  KEY `FK_precos_tipo_servicos` (`id_tipo_servico`),
  CONSTRAINT `FK_precos_tipo_servicos` FOREIGN KEY (`id_tipo_servico`) REFERENCES `tipo_servicos` (`id`),
  CONSTRAINT `FK_precos_veiculos` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `precos` DISABLE KEYS */;
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(1, 1, 1, 300.00);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(2, 2, 1, 250.00);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(3, 3, 1, 250.00);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(4, 3, 2, 70000.00);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(5, 4, 1, 150.00);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(6, 4, 2, 80000.00);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(7, 5, 1, 275.50);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(8, 5, 2, 95030.31);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(9, 6, 1, 134.50);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(10, 7, 1, 250.35);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(11, 8, 2, 85350.31);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(12, 8, 1, 500.00);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(13, 1, 2, 50000.00);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(14, 2, 2, 134000.00);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(15, 6, 2, 55000.00);
INSERT INTO `precos` (`id`, `id_veiculo`, `id_tipo_servico`, `preco`) VALUES
	(16, 7, 2, 150000.00);
/*!40000 ALTER TABLE `precos` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tipo_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tipo_cliente` DISABLE KEYS */;
INSERT INTO `tipo_cliente` (`id`, `descricao`) VALUES
	(1, 'Pessoa Fisica');
INSERT INTO `tipo_cliente` (`id`, `descricao`) VALUES
	(2, 'Pessoa Juridica');
/*!40000 ALTER TABLE `tipo_cliente` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tipo_servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tipo_servicos` DISABLE KEYS */;
INSERT INTO `tipo_servicos` (`id`, `descricao`) VALUES
	(1, 'Aluguel');
INSERT INTO `tipo_servicos` (`id`, `descricao`) VALUES
	(2, 'Compra');
/*!40000 ALTER TABLE `tipo_servicos` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `veiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(250) NOT NULL,
  `placa` varchar(150) NOT NULL,
  `marca` varchar(150) NOT NULL,
  `ano` smallint(4) NOT NULL,
  `cor_veiculo` varchar(50) NOT NULL,
  `qtd_estoque` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` (`id`, `modelo`, `placa`, `marca`, `ano`, `cor_veiculo`, `qtd_estoque`) VALUES
	(1, 'Gran Turismo Sport 4.7 V8 32v 460cv', 'EIT5451', 'Maserati', 2013, 'Vermelho', 2);
INSERT INTO `veiculos` (`id`, `modelo`, `placa`, `marca`, `ano`, `cor_veiculo`, `qtd_estoque`) VALUES
	(2, 'Range R. EVOQUE SI4 SE Dynamic 2.0 Aut.', 'BSF5228', 'Land Rover', 2016, 'Branco', 1);
INSERT INTO `veiculos` (`id`, `modelo`, `placa`, `marca`, `ano`, `cor_veiculo`, `qtd_estoque`) VALUES
	(3, 'MARCH Rio2016 1.0 Flex Fuel 5p', 'CYC0038', 'Nissan', 2013, 'Marrom', 3);
INSERT INTO `veiculos` (`id`, `modelo`, `placa`, `marca`, `ano`, `cor_veiculo`, `qtd_estoque`) VALUES
	(4, 'Fit EX/S/EX 1.5 Flex/Flexone 16V 5p Aut.', 'FHV1202', 'Honda', 2005, 'Dourado', 1);
INSERT INTO `veiculos` (`id`, `modelo`, `placa`, `marca`, `ano`, `cor_veiculo`, `qtd_estoque`) VALUES
	(5, 'RAV4 2.0 4x2 16V Aut.', 'DKB0862', 'Toyota', 2013, 'Vermelho', 1);
INSERT INTO `veiculos` (`id`, `modelo`, `placa`, `marca`, `ano`, `cor_veiculo`, `qtd_estoque`) VALUES
	(6, 'Jumper 2.8 Furg', 'BJX7996', 'Citroen', 2000, 'Marrom', 2);
INSERT INTO `veiculos` (`id`, `modelo`, `placa`, `marca`, `ano`, `cor_veiculo`, `qtd_estoque`) VALUES
	(7, 'Civic Hatch LX Aut', 'EEY9852', 'Honda', 1992, 'Prata', 4);
INSERT INTO `veiculos` (`id`, `modelo`, `placa`, `marca`, `ano`, `cor_veiculo`, `qtd_estoque`) VALUES
	(8, 'HR-V EX 1.8 Flexone 16V 5p Aut.', 'DYI0051', 'Honda', 2016, 'Amarelo', 5);
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
