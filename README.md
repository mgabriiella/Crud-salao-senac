🚀 CRUD - Salão SENAC
Uma aplicação simples para o gerenciamento de serviços de um salão de beleza. Com funcionalidades de Cadastro, Consulta, Atualização e Exclusão de serviços, utilizando SQL, TypeScript, TypeORM e Express.js.

🛠️ Tecnologias Utilizadas
TypeScript: Garantindo tipagem estática e maior segurança no desenvolvimento.
Express.js: Framework minimalista para Node.js utilizado para criar a API RESTful.
TypeORM: ORM que facilita as interações com o banco de dados.
SQL: Banco de dados relacional (MySQL, PostgreSQL ou outro).

🌟 Funcionalidades
📝 Cadastro de Serviços: Adicione novos serviços ao salão.
🔍 Consulta de Serviços: Visualize todos os serviços cadastrados.
✏️ Atualização de Serviços: Modifique as informações de serviços existentes.
❌ Exclusão de Serviços: Remova serviços do sistema de maneira fácil.

💻 Como Rodar o Projeto
Pré-requisitos
Node.js (versão 14 ou superior)
TypeScript (instalado via NPM)
Banco de dados SQL (MySQL, PostgreSQL ou outro)
Passos para execução

Clone o repositório:
git clone https://github.com/mgabriiella/Crud-salao-senac.git

Acesse o diretório do projeto:
cd Crud-salao-senac

Instale as dependências:
npm install

Configure o banco de dados em ormconfig.json (adapte para suas credenciais).

Execute as migrações:
npm run typeorm migration:run

Inicie o servidor:
npm start

Acesse a API no seu navegador:
http://localhost:3000

📱 Responsividade
O sistema é totalmente responsivo, garantindo uma experiência otimizada tanto para desktop quanto para smartphones.

🤝 Como Contribuir
Fork o repositório.
Crie uma branch para a sua feature (git checkout -b minha-feature).
Faça suas alterações e faça o commit (git commit -am 'Adicionando nova feature').
Envie suas mudanças para o repositório remoto (git push origin minha-feature).
Abra um pull request.
