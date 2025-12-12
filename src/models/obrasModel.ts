import { prisma } from "../../.lib/prisma.js";

export const findAllObras = async () => {
    return await prisma.obras.findMany({
        orderBy: { titulo: "asc" }
    });
}