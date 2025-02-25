# 🚀 CRUD - Salão SENAC

Uma aplicação simples para o gerenciamento de serviços de um salão de beleza. Com funcionalidades de **Cadastro**, **Consulta**, **Atualização** e **Exclusão** de serviços, utilizando **SQL**, **TypeScript**, **TypeORM** e **Express.js**.

---

## 🛠️ Tecnologias Utilizadas

- **TypeScript**: Garantindo tipagem estática e maior segurança no desenvolvimento.
- **Express.js**: Framework minimalista para Node.js utilizado para criar a API RESTful.
- **TypeORM**: ORM que facilita as interações com o banco de dados.
- **SQL**: Banco de dados relacional (MySQL, PostgreSQL ou outro).

---

## 🌟 Funcionalidades

- **📝 Cadastro de Serviços**: Adicione novos serviços ao salão.
- **🔍 Consulta de Serviços**: Visualize todos os serviços cadastrados.
- **✏️ Atualização de Serviços**: Modifique as informações de serviços existentes.
- **❌ Exclusão de Serviços**: Remova serviços do sistema de maneira fácil.

---

## 💻 Como Rodar o Projeto

### Pré-requisitos

- [Node.js](https://nodejs.org/) (versão 14 ou superior)
- [TypeScript](https://www.typescriptlang.org/) (instalado via NPM)
- Banco de dados SQL (MySQL, PostgreSQL ou outro)

### Passos para execução

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/mgabriiella/Crud-salao-senac.git

2. **Acesse o diretório do projeto**:
 
   ```bash
   cd Crud-salao-senac

3. **Instale as dependências**:
   ```bash
   npm install

5. **Configure o banco de dados em ormconfig.json (adapte para suas credenciais)**.

6. **Execute as migrações**:
   
   ```bash
   npm run typeorm migration:run

6. **Inicie o servidor**:
   
   ```bash
   npm start

8. **Acesse a API no seu navegador**:
   
   ```bash
    http://localhost:3000

## Responsividade
O sistema é totalmente responsivo, garantindo uma experiência otimizada tanto para desktop quanto para smartphones.

🤝 Como Contribuir
Fork o repositório.
Crie uma branch para a sua feature (git checkout -b minha-feature).
Faça suas alterações e faça o commit (git commit -am 'Adicionando nova feature').
Envie suas mudanças para o repositório remoto (git push origin minha-feature).
Abra um pull request.
