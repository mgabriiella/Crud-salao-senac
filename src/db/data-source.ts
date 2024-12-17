import "reflect-metadata"
import { DataSource } from "typeorm"
import { config, dialect } from
"../config/db.config"
import { Servico } from "../models/servico"
export const AppDataSource = new DataSource({
 type: dialect,
 host: config.HOST,
 port: config.PORT,
 username: config.USER,
 password: config.PASSWORD,
 database: config.DB,   
 entities: [Servico],
 synchronize: true,
 logging: true,
})