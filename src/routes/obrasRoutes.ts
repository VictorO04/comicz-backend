import * as obrasController from "../controllers/obrasController.js";
import { Router } from "express";

const router = Router();

router.get("/", obrasController.getAllObras);
router.get("/:id", obrasController.getObraById)

export default router;