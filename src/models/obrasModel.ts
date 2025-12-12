import { prisma } from "../../.lib/prisma.js";

export const findAllObras = async () => {
    return await prisma.obras.findMany({
        orderBy: { titulo: "asc" }
    });
}

export const findObraById = async (id: number) => {
    return await prisma.obras.findUnique({
        where: { id_obra: id }
    });
}