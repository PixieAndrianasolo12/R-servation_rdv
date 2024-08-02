import express from "express";
import {
    getPersonnes,
    getPersonneById,
    createPersonne,
    updatePersonne,
    deletePersonne
} from "../controllers/Personnes.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/personnes',verifyUser, getPersonnes);
router.get('/personnes/:id', verifyUser, getPersonneById);
router.post('/personnes',verifyUser, createPersonne);
router.patch('/personnes/:id',verifyUser, updatePersonne);
router.delete('/personnes/:id',verifyUser, deletePersonne);

export default router;