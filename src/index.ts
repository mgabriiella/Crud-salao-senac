import express, { Application } from "express";
import cors, { CorsOptions } from "cors";
import Routes from "./routes/Routes"; // Certifique-se de que o caminho esteja correto para suas rotas
import { AppDataSource } from "./db/data-source";

export default class Server {
    constructor(app: Application) {
        this.config(app);
        new Routes(app); // Inicializa as rotas da aplicação
    }

    private config(app: Application): void {
        const corsOptions: CorsOptions = {
            origin: "http://localhost:8080" // Permitir acesso apenas dessa origem
        };

        app.use(cors(corsOptions)); // Configuração do CORS
        app.use(express.json()); // Middleware para analisar o corpo da requisição em formato JSON
        app.use(express.urlencoded({ extended: true })); // Middleware para analisar dados codificados em URL
    }
}

// Inicializa a conexão com o banco de dados
AppDataSource.initialize()
    .then(() => {
        console.log(`Database is running.`); // Mensagem de sucesso ao inicializar o banco de dados
    })
    .catch((error) => console.log(error)); // Caso haja algum erro na inicialização
