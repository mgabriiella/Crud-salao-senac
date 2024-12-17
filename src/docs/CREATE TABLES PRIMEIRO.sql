SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
    `cpf` VARCHAR(11) NOT NULL,
    `email` VARCHAR(200) NOT NULL,
    `senha` VARCHAR(60) NOT NULL,
    `nome` VARCHAR(200) NOT NULL,
    `dataNasc` DATE NOT NULL,
    `fotoPerfil` VARCHAR(255) NULL,
    `idUsuario` INT NOT NULL AUTO_INCREMENT,
    `tipoPerfil` ENUM('client', 'especialista', 'administrador') NOT NULL,
    UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC),
    PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefone` (
  `idtelefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(15) NOT NULL,
  `usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idtelefone`, `usuario_idUsuario`),
  INDEX `fk_telefone_usuario1_idx` (`usuario_idUsuario` ASC),
  CONSTRAINT `fk_telefone_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `mydb`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idcliente`, `usuario_idUsuario`),
  INDEX `fk_cliente_usuario_idx` (`usuario_idUsuario` ASC),
  CONSTRAINT `fk_cliente_usuario`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `mydb`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`especialista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`especialista` (
  `idespecialista` INT NOT NULL AUTO_INCREMENT,
  `usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idespecialista`, `usuario_idUsuario`),
  INDEX `fk_especialista_usuario1_idx` (`usuario_idUsuario` ASC),
  CONSTRAINT `fk_especialista_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `mydb`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`administrador` (
  `idadministrador` INT NOT NULL AUTO_INCREMENT,
  `usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idadministrador`, `usuario_idUsuario`),
  INDEX `fk_administrador_usuario1_idx` (`usuario_idUsuario` ASC),
  CONSTRAINT `fk_administrador_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `mydb`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agendamento` (
  `idagendamento` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `administrador_idadministrador` INT NOT NULL,
  `administrador_usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idagendamento`, `administrador_idadministrador`, `administrador_usuario_idUsuario`),
  INDEX `fk_agendamento_administrador1_idx` (`administrador_idadministrador` ASC, `administrador_usuario_idUsuario` ASC),
  CONSTRAINT `fk_agendamento_administrador1`
    FOREIGN KEY (`administrador_idadministrador` , `administrador_usuario_idUsuario`)
    REFERENCES `mydb`.`administrador` (`idadministrador` , `usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`feedback` (
  `idfeedback` INT NOT NULL AUTO_INCREMENT,
  `mensagemFeedback` TEXT NULL,
  `cliente_idcliente` INT NOT NULL,
  `cliente_usuario_idUsuario` INT NOT NULL,
  `agendamento_idagendamento` INT NOT NULL,
  `administrador_idadministrador` INT NOT NULL,
  `administrador_usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idfeedback`, `cliente_idcliente`, `cliente_usuario_idUsuario`, `agendamento_idagendamento`, `administrador_idadministrador`, `administrador_usuario_idUsuario`),
  INDEX `fk_feedback_cliente1_idx` (`cliente_idcliente` ASC, `cliente_usuario_idUsuario` ASC),
  INDEX `fk_feedback_agendamento1_idx` (`agendamento_idagendamento` ASC),
  INDEX `fk_feedback_administrador1_idx` (`administrador_idadministrador` ASC, `administrador_usuario_idUsuario` ASC),
  CONSTRAINT `fk_feedback_cliente1`
    FOREIGN KEY (`cliente_idcliente` , `cliente_usuario_idUsuario`)
    REFERENCES `mydb`.`cliente` (`idcliente` , `usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_feedback_agendamento1`
    FOREIGN KEY (`agendamento_idagendamento`)
    REFERENCES `mydb`.`agendamento` (`idagendamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_feedback_administrador1`
    FOREIGN KEY (`administrador_idadministrador` , `administrador_usuario_idUsuario`)
    REFERENCES `mydb`.`administrador` (`idadministrador` , `usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`alteracao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`alteracao` (
  `idalteracao` INT NOT NULL AUTO_INCREMENT,
  `novoServico` VARCHAR(100) NULL,
  `dataAlteracao` DATETIME NOT NULL,
  `especialista_idespecialista` INT NOT NULL,
  `especialista_usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idalteracao`, `especialista_idespecialista`, `especialista_usuario_idUsuario`),
  INDEX `fk_alteracao_especialista1_idx` (`especialista_idespecialista` ASC, `especialista_usuario_idUsuario` ASC),
  CONSTRAINT `fk_alteracao_especialista1`
    FOREIGN KEY (`especialista_idespecialista` , `especialista_usuario_idUsuario`)
    REFERENCES `mydb`.`especialista` (`idespecialista` , `usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Disponibilidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disponibilidade` (
  `idDisponibilidade` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `especialista_idespecialista` INT NOT NULL,
  `especialista_usuario_idUsuario` INT NOT NULL,
  `agendamento_idagendamento` INT NOT NULL,
  PRIMARY KEY (`idDisponibilidade`, `especialista_idespecialista`, `especialista_usuario_idUsuario`, `agendamento_idagendamento`),
  INDEX `fk_Disponibilidade_especialista1_idx` (`especialista_idespecialista` ASC, `especialista_usuario_idUsuario` ASC),
  INDEX `fk_Disponibilidade_agendamento1_idx` (`agendamento_idagendamento` ASC),
  CONSTRAINT `fk_Disponibilidade_especialista1`
    FOREIGN KEY (`especialista_idespecialista` , `especialista_usuario_idUsuario`)
    REFERENCES `mydb`.`especialista` (`idespecialista` , `usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Disponibilidade_agendamento1`
    FOREIGN KEY (`agendamento_idagendamento`)
    REFERENCES `mydb`.`agendamento` (`idagendamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`servicos` (
  `idservicos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `administrador_idadministrador` INT NOT NULL,
  `administrador_usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idservicos`, `administrador_idadministrador`, `administrador_usuario_idUsuario`),
  INDEX `fk_servicos_administrador1_idx` (`administrador_idadministrador` ASC, `administrador_usuario_idUsuario` ASC),
  CONSTRAINT `fk_servicos_administrador


