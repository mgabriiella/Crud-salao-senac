import { Application } from "express";
import servicoRoutes from "./servico.routes";

// Concentrador de rotas
export default class Routes {
  constructor(app: Application) {
    app.use("/mydb", servicoRoutes);
  }
}