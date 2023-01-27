-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Jan-2023 às 15:32
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `h.s`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `CodAluno` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Matricula` char(11) DEFAULT NULL,
  `Formacao` varchar(100) DEFAULT NULL,
  `Turma` char(10) DEFAULT NULL,
  `Periodo` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`CodAluno`, `Nome`, `Matricula`, `Formacao`, `Turma`, `Periodo`) VALUES
(1, 'Matheus Fernandes', '65438906784', 'Assistente Administrativo', '3003', 'Manha'),
(2, 'Julia Amaral', '65423809645', 'Assistente Logistico', '2004', 'Manha'),
(3, 'Lorena Matos', '34509876147', 'Assistente Farmaceutico', '1001', 'Tarde'),
(4, 'Carina Barbosa', '43609783456', 'Assistente Logistico', '2005', 'Noite');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `CodCurso` int(11) NOT NULL,
  `Formacao` varchar(100) DEFAULT NULL,
  `Tipo` varchar(100) DEFAULT NULL,
  `Periodo` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`CodCurso`, `Formacao`, `Tipo`, `Periodo`) VALUES
(1, 'Administracao', 'Basico', '1 ano'),
(2, 'Logistica', 'Basico', '10 meses'),
(3, 'Farmacia', 'Basico', '8 meses'),
(4, 'Informatica', 'Basico', '6 meses');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `CodFuncionario` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Matricula` char(11) DEFAULT NULL,
  `Funcao` varchar(60) DEFAULT NULL,
  `CargaHoraria` char(20) DEFAULT NULL,
  `DocIdentificacao` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`CodFuncionario`, `Nome`, `Matricula`, `Funcao`, `CargaHoraria`, `DocIdentificacao`) VALUES
(1, 'Jeimersom Lima', '89056378924', 'Coordenador Pedagogico', '36 horas semanais', '47653412905'),
(2, 'Noah Aguiar', '79642106349', 'Professor', '40 horas semanais', '38764325678'),
(3, 'Pedro Oliveira', '65312905673', 'Professor', '40 horas semanais', '20645238967'),
(4, 'André Pereira', '53560978312', 'Auxiliar de Servicos Gerais', '40 horas semanais', '16412065489');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turmas`
--

CREATE TABLE `turmas` (
  `CodTurma` int(11) NOT NULL,
  `CodAluno` int(11) DEFAULT NULL,
  `CodCurso` int(11) DEFAULT NULL,
  `CodFuncionario` int(11) DEFAULT NULL,
  `DataInicio` date DEFAULT NULL,
  `DataPrevFim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `turmas`
--

INSERT INTO `turmas` (`CodTurma`, `CodAluno`, `CodCurso`, `CodFuncionario`, `DataInicio`, `DataPrevFim`) VALUES
(1, 1, 1, 1, '2023-02-06', '2024-02-06'),
(2, 2, 2, 2, '2023-03-06', '2024-01-06'),
(3, 3, 3, 3, '2023-04-03', '2023-12-03'),
(4, 4, 4, 4, '2023-05-01', '2024-11-01');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`CodAluno`);

--
-- Índices para tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`CodCurso`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`CodFuncionario`);

--
-- Índices para tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`CodTurma`),
  ADD KEY `CodAluno` (`CodAluno`),
  ADD KEY `CodCurso` (`CodCurso`),
  ADD KEY `CodFuncionario` (`CodFuncionario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `CodAluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `CodCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `CodFuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `CodTurma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`CodAluno`) REFERENCES `alunos` (`CodAluno`),
  ADD CONSTRAINT `turmas_ibfk_2` FOREIGN KEY (`CodCurso`) REFERENCES `cursos` (`CodCurso`),
  ADD CONSTRAINT `turmas_ibfk_3` FOREIGN KEY (`CodFuncionario`) REFERENCES `funcionarios` (`CodFuncionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
