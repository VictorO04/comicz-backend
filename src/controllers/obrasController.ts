import * as obrasModel from "../models/obrasModel";
import { Request, Response } from "express";

export const getAllObras = async (req: Request, res: Response) => {
    const obras = await obrasModel.findAllObras();

    res.status(200).json({
        total: obras.length,
        mensagem: obras.length === 0
            ? "Nenhuma obra registrada no banco de dados"
            : "As obras foram encontradas",
        obras: obras
    });
}