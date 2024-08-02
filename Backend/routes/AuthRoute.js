import express from "express";
import {Register ,Login, logOut, Me} from "../controllers/Auth.js";

const router = express.Router();

router.post('/register', Register);
router.get('/me', Me);
router.post('/login', Login);
router.delete('/logout', logOut);

export default router;