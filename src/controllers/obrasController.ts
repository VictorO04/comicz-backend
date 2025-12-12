import * as obrasModel from "../models/obrasModel.js";
import { Request, Response } from "express";

export const getAllObras = async (req: Request, res: Response) => {
    try {
        const obras = await obrasModel.findAllObras();
        const totalObras = obras.length;

        if (totalObras === 0) {
            return res.status(404).json({
                total: 0,
                mensagem: "Nenhuma obra encontrada",
                obras: []
            });
        }

        return res.status(200).json({
            total: totalObras,
            mensagem: "Obras encontradas com sucesso",
            obras
        });
    } catch (error) {
        const detalhes = error instanceof Error ? error.message : "Erro desconhecido";

        return res.status(500).json({
            mensagem: "Erro interno do servidor",
            detalhes
        });
    }
}

export const getObraById = async (req: Request, res: Response) => {
    try {
        const id = parseInt(req.params.id);

        if (isNaN(id) || id <= 0) {
            return res.status(400).json({
                total: 0,
                mensagem: "Digite um ID válido"
            });
        }

        const obra = await obrasModel.findObraById(id);

        if (!obra) {
            return res.status(404).json({
                total: 0,
                mensagem: `Nenhuma obra com o ID ${id} encontrada`
            });
        }

        return res.status(200).json({
            total: 1,
            mensagem: `Obra com o ID ${id} encontrada`,
            obra
        });
    } catch (error) {
        const detalhes = error instanceof Error ? error.message : "Erro desconhecido";

        return res.status(500).json({
            mensagem: "Erro interno do servidor",
            detalhes
        });
    }
}