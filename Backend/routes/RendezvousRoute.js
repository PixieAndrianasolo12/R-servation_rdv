import express from "express";
import {
    getAppointments ,
    getAppointmentById,
    createAppointment,
    updateAppointment,
    deleteAppointment,
    getAppointmentByUserId,
    getAppointmentByCategory,
    SendMailForReport,
    SendMailForAccept
} from "../controllers/Rendezvous.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/rendezvous',verifyUser,getAppointments);
router.get('/rendezvous/category/:category', verifyUser , getAppointmentByCategory)
router.get('/rendezvous/:id', verifyUser, getAppointmentById);
router.post('/rendezvous',verifyUser,createAppointment);
router.patch('/rendezvous/:id',verifyUser, updateAppointment);
router.delete('/rendezvous/:id',verifyUser, deleteAppointment);
router.get('/Myrendezvous', verifyUser, getAppointmentByUserId );
router.post('/rendezvous/mailReport', verifyUser , SendMailForReport )
router.post('/rendezvous/mailAccept', verifyUser , SendMailForAccept )

export default router;