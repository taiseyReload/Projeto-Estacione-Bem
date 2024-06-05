-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/05/2024 às 02:59
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
-- Banco de dados: `estacione_bem`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `estacionamento`
--

CREATE TABLE `estacionamento` (
  `id` int(11) NOT NULL,
  `placa` varchar(7) DEFAULT NULL,
  `celular` varchar(13) DEFAULT NULL,
  `data_entrada` timestamp NULL DEFAULT current_timestamp(),
  `data_saida` datetime DEFAULT NULL,
  `convenio` tinyint(1) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `observacoes` varchar(500) DEFAULT NULL,
  `pago` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `estacionamento`
--

INSERT INTO `estacionamento` (`id`, `placa`, `celular`, `data_entrada`, `data_saida`, `convenio`, `id_usuario`, `id_tipo`, `observacoes`, `pago`) VALUES
(1, 'cgw0i33', '11991340806', '2024-04-29 22:46:49', NULL, 3, 1, 3, '', 1),
(5, 'XYU4APU', '12558649332', '2024-05-30 03:25:21', NULL, 3, 4, 3, '', 0),
(6, 'CGW0I33', '12558649332', '2024-05-30 03:26:51', NULL, 2, 4, 5, 'Parabrisa arranhado', 0),
(7, 'QWS5M91', '12558649332', '2024-05-30 04:00:04', NULL, 3, 4, 3, '', 0),
(8, 'cgw0i33', '12991340806', '2024-05-30 04:15:14', NULL, 3, 6, 2, '', 0),
(10, 'mmm1m12', '12558649332', '2024-05-30 04:21:25', NULL, 3, 4, 5, '', 0),
(11, 'CGW0I33', '12558649332', '2024-05-30 04:22:27', NULL, 4, 4, 5, '', 0),
(12, 'bbb1b11', '12558649332', '2024-05-30 04:31:44', NULL, 3, 4, 3, '', 0),
(13, 'cgw0i33', '12558649332', '2024-05-30 05:40:19', NULL, 3, 4, 2, '', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fila_de_servicos`
--

CREATE TABLE `fila_de_servicos` (
  `id` int(11) NOT NULL,
  `id_estacionamento` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `registro`
--

CREATE TABLE `registro` (
  `id` int(11) NOT NULL,
  `saidaEntrada` tinyint(1) DEFAULT NULL,
  `horario` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_estacionamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `registro`
--

INSERT INTO `registro` (`id`, `saidaEntrada`, `horario`, `id_estacionamento`) VALUES
(3, 0, '2024-05-29 23:26:54', 1),
(4, 1, '2024-05-29 23:27:21', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `servico` varchar(45) CHARACTER SET armscii8 COLLATE armscii8_general_ci DEFAULT NULL,
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `servicos`
--

INSERT INTO `servicos` (`id`, `servico`, `valor`) VALUES
(2, 'Lavagem', 400),
(3, 'Avulso', 300),
(4, 'Mensal', 120);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tipo`
--

INSERT INTO `tipo` (`id`, `tipo`) VALUES
(2, 'Moto'),
(3, 'Carro'),
(5, 'Caminhão');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(11) NOT NULL,
  `senha` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `telefone`, `senha`) VALUES
(1, 'Gui Silva da Lherme', 'guisil@sp.senac.br', '1299734012', '321'),
(4, 'Juca Uca de Souza', 'juca@gmail.com', '12558649332', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
(5, 'admin', 'admin@admin.com', '12586943967', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918'),
(6, 'Oséias dos Santos Araújo', 'oseiassantosaraujo796@gmail.com', '12991340806', '2fdce24b8eeaa92587874c581c423b395362c1f15ff3b1b81c5adaa92f80b00a');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `estacionamento`
--
ALTER TABLE `estacionamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_idx` (`id_usuario`),
  ADD KEY `tipo_idx` (`id_tipo`);

--
-- Índices de tabela `fila_de_servicos`
--
ALTER TABLE `fila_de_servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_veiculo` (`id_estacionamento`),
  ADD KEY `id_servico` (`id_servico`);

--
-- Índices de tabela `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estacionamento_idx` (`id_estacionamento`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `estacionamento`
--
ALTER TABLE `estacionamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `fila_de_servicos`
--
ALTER TABLE `fila_de_servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `registro`
--
ALTER TABLE `registro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estacionamento`
--
ALTER TABLE `estacionamento`
  ADD CONSTRAINT `tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `fila_de_servicos`
--
ALTER TABLE `fila_de_servicos`
  ADD CONSTRAINT `id_servico` FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id`),
  ADD CONSTRAINT `id_veiculo` FOREIGN KEY (`id_estacionamento`) REFERENCES `estacionamento` (`id`);

--
-- Restrições para tabelas `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `fk_estacionamento` FOREIGN KEY (`id_estacionamento`) REFERENCES `estacionamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;