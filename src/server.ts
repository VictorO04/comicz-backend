import express from "express";
import dotenv from "dotenv";
import obrasRoutes from "./routes/obrasRoutes.js"

const app = express();
app.use(express.json());

dotenv.config();
const serverPort = process.env.PORT;

app.get("/", (req: express.Request, res: express.Response) => {
    res.send("Servidor online!!!");
});

app.use("/obras", obrasRoutes);

app.listen(serverPort, () => {
    console.log(`servidor rodando em: http://localhost:${serverPort}`);
});