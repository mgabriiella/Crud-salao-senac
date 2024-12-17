import { AppDataSource } from "../db/data-source";
import { Servico } from "../models/servico";

class ServicoRepository {
    servicoRepository = AppDataSource.getRepository(Servico);

    // Método para salvar um serviço
    async save(servico: Servico): Promise<Servico> {
        try {
            await this.servicoRepository.save(servico); // Garantir que o salvamento seja concluído
            return servico;
        } catch (err) {
            throw new Error("Falha ao criar o Servico!");
        }
    }

    // Método para recuperar todos os serviços
    async retrieveAll(): Promise<Array<Servico>> {
        try {
            return await this.servicoRepository.find(); // Garantir que a busca seja aguardada
        } catch (error) {
            throw new Error("Falha ao retornar os serviços!");
        }
    }

    // Método para buscar um serviço por ID
    async retrieveById(servicoId: number): Promise<Servico | null> {
        try {
            return await this.servicoRepository.findOneBy({ idservicos: servicoId }); // Garantir que a busca seja aguardada
        } catch (error) {
            throw new Error("Falha ao buscar o serviço!");
        }
    }

    // Método para buscar um serviço pelo nome
    async retrieveByNome(n: string): Promise<Servico | null> {
        try {
            return await this.servicoRepository.findOneBy({ nome: n }); // Garantir que a busca seja aguardada
        } catch (error) {
            throw new Error("Falha ao buscar o serviço!");
        }
    }

    // Método para atualizar um serviço
    async update(servico: Servico): Promise<Servico> {
        const { idservicos, nome } = servico;
        try {
            await this.servicoRepository.save(servico); // Garantir que o salvamento seja concluído
            return servico;
        } catch (error) {
            throw new Error("Falha ao atualizar o serviço!");
        }
    }

    // Método para deletar um serviço por ID
    async delete(servicoId: number): Promise<number> {
        try {
            const servicoEncontrado = await this.servicoRepository.findOneBy({ idservicos: servicoId });
            if (servicoEncontrado) {
                await this.servicoRepository.remove(servicoEncontrado); // Garantir que a remoção seja concluída
                return 1;
            }
            return 0; // Serviço não encontrado
        } catch (error) {
            throw new Error("Falha ao deletar o Serviço!");
        }
    }

    // Método para deletar todos os serviços
    async deleteAll(): Promise<number> {
        try {
            const num = await this.servicoRepository.query("SELECT COUNT(idservicos) FROM servico;"); // Aguardar o resultado da consulta
            await this.servicoRepository.query("DELETE FROM servico;"); // Deletar todos os serviços
            return num[0]["count"]; // Retornar a quantidade de serviços deletados
        } catch (error) {
            throw new Error("Falha ao deletar todos os serviços!");
        }
    }
}

export default new ServicoRepository();
