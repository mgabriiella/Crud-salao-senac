import { Request, Response } from "express";
import { Servico } from "../models/servico";
import servicoRepository from "../repositories/Servicorepository";

export default class ServicoController {

    async create(req: Request, res: Response) {
        if (!req.body.nome) {
            res.status(400).send({
                message: "O nome do serviço não pode ser vazio!"
            });
            return;
        }

        try {
            const servico: Servico = req.body;
            const savedServico = await servicoRepository.save(servico);
            res.status(201).send(savedServico);
        } catch (err) {
            res.status(500).send({
                message: "Erro ao tentar salvar um serviço."
            });
        }
    }

    async findAll(req: Request, res: Response) {
        try {
            const servicos = await servicoRepository.retrieveAll();
            res.status(200).send(servicos);
        } catch (err) {
            res.status(500).send({
                message: "Erro encontrado quando estava buscando todos os serviços."
            });
        }
    }

    async findOne(req: Request, res: Response) {
        const id: number = parseInt(req.params.id);

        try {
            const servico = await servicoRepository.retrieveById(id);
            if (servico) res.status(200).send(servico);
            else
                res.status(404).send({
                    message: `Não foi encontrado nenhum serviço com esse id=${id}.`
                });
        } catch (err) {
            res.status(500).send({
                message: `Erro ao tentar retornar o serviço com id=${id}.`
            });
        }
    }

    async findName(req: Request, res: Response) {
        const nome: string = req.params.nome;

        try {
            const servico = await servicoRepository.retrieveByNome(nome);
            if (servico) res.status(200).send(servico);
            else
                res.status(404).send({
                    message: `Não foi encontrado nenhum serviço com esse nome=${nome}.`
                });
        } catch (err) {
            res.status(500).send({
                message: `Erro ao tentar retornar o serviço com nome=${nome}.`
            });
        }
    }

    async update(req: Request, res: Response) {
        let servico: Servico = req.body;
        servico.idservicos = parseInt(req.params.id);
        try {
            await servicoRepository.update(servico);
            res.send({
                message: `Serviço ${servico.nome} atualizado com sucesso!`
            });
        } catch (err) {
            res.status(500).send({
                message: `Erro ao atualizar o serviço com id=${servico.idservicos}.`
            });
        }
    }

    async delete(req: Request, res: Response) {
        const id: number = parseInt(req.params.id);

        try {
            const num = await servicoRepository.delete(id);

            if (num == 1) {
                res.send({
                    message: "Serviço deletado com sucesso!"
                });
            } else {
                res.send({
                    message: `Não foi possível deletar o serviço com id=${id}. O serviço não foi encontrado.`,
                });
            }
        } catch (err) {
            res.status(500).send({
                message: `O serviço com id=${id} não pode ser deletado.`
            });
        }
    }

    async deleteAll(req: Request, res: Response) {
        try {
            const num = await servicoRepository.deleteAll();

            res.send({ message: `${num} serviços foram deletados com sucesso!` });
        } catch (err) {
            res.status(500).send({
                message: "Algum erro ocorreu enquanto deletava todos os serviços."
            });
        }
    }
}
