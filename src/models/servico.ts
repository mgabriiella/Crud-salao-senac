import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("servicos") // Define a tabela 'servicos' no banco
export class Servico {
  @PrimaryGeneratedColumn({ name: "idservicos" }) // Nome da coluna alterado para idservicos
  idservicos!: number;

  @Column({ type: "varchar", length: 100, nullable: false }) // Adicionado 'nullable: false' para garantir que o campo 'nome' não seja nulo
  nome!: string;

  @Column({ type: "decimal", precision: 10, scale: 2, nullable: false }) // Adicionado 'nullable: false' para o campo 'preco'
  preco!: number;

  constructor(nome: string, preco: number, idservicos?: number) {
    if (idservicos) {
      this.idservicos = idservicos; // Atribuição do idservicos, se fornecido
    }
    this.nome = nome;
    this.preco = preco;
  }
}
