import Appointments from "../models/RendezvousModel.js";
import Appointment from "../models/RendezvousModel.js";
import User from "../models/UserModel.js";
import { Op } from "sequelize";
import emailSenderForDelete from '../Email/emailSenderForDelete.js';
import emailSenderWithNoData from "../Email/emailSenderWithNoData.js";
import emailSenderReport from "../Email/emailSenderReport.js";
import emailSenderForFinalization from "../Email/emailSenderForFinalization.js";

export const getAppointments = async (req, res) => {
    try {
        const response = await Appointment.findAll({
            attributes: ['uuid', 'name', 'email', 'categorie', 'reason', 'appointmentDate', 'appointmentTime'],
            include: [{
                model: User,
                attributes: ['name', 'email']
            }]
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
};

export const getAppointmentById = async (req, res) => {
    try {
        const appointment = await Appointment.findOne({
            where: {
                uuid: req.params.id
            }
        });
        if (!appointment) return res.status(404).json({ msg: "Données non trouvées" });
        const response = await Appointment.findOne({
            attributes: ['uuid', 'name', 'email', 'categorie', 'reason', 'appointmentDate', 'appointmentTime'],
            where: {
                id: appointment.id
            },
            include: [{
                model: User,
                attributes: ['name', 'email']
            }]
        });
        res.status(201).json(response);
    } catch (error) {
        console.log(error);
        res.status(500).json({ msg: error.message });
    }
};

export const getAppointmentByCategory = async (req , res)=>{
    try {
        const category = req.params.category
        const appointement = await Appointment.findAll({
            where : {
                categorie : category
            }
        });

        res.status(200).json(appointement);
    } catch (error) {
        console.log(error);
    }
}


export const getAppointmentByUserId = async (req, res) => {
    try {
        const user = await User.findOne({
            attributes : ['id'],
            where : {
                uuid : req.session.userId
            }
        })
        if(user){
            
        const response = await Appointment.findAll({
            attributes: ['uuid', 'name', 'email', 'categorie', 'reason', 'appointmentDate', 'appointmentTime'],
            where: {
                userId: user.dataValues.id
            },
            include: [{
                model: User,
                attributes: ['name', 'email']
            }]
        });
        res.status(200).json(response);
        }

    } catch (error) {
        console.log(error);
        res.status(500).json({ msg: error.message });
    }
};

export const createAppointment = async (req, res) => {
    const {  categorie, reason, appointmentDate, appointmentTime } = req.body;
    const user = await User.findOne({
        attributes : ['id', 'email' , 'name'],
        where : {
            uuid : req.session.userId
        }
    })

    const Employee = await User.findOne({
        attributes : ['email'],
        where : {
            name : categorie
        }
    })


    try {
        await Appointment.create({
            name: user.dataValues.name,
            email: user.dataValues.email,
            categorie: categorie,
            reason: reason,
            userId: req.userId, // Assurez-vous que req.userId est correctement défini
            appointmentDate: appointmentDate,
            appointmentTime: appointmentTime
        });

        const employeeEmail = Employee.dataValues.email
        const userEmail = user.dataValues.email

        emailSenderWithNoData(employeeEmail, "WaitingForEmploye")
        emailSenderWithNoData(userEmail, "WaitingForClient")
    

        res.status(201).json({ msg: "Création de la Rendez-vous réussie" });
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
};

export const updateAppointment = async (req, res) => {
    try {
        const appointment = await Appointment.findOne({
            where: {
                uuid: req.params.id
            }
        });
        if (!appointment) return res.status(404).json({ msg: "Données non trouvées" });
        const { name, email, categorie, reason, appointmentDate, appointmentTime } = req.body;
        await Appointment.update({
            name: name,
            email: email,
            categorie: categorie,
            reason: reason,
            appointmentDate: appointmentDate,
            appointmentTime: appointmentTime
        }, {
            where: {
                id: appointment.id
            }
        });

        const Employee = await User.findOne({
            attributes : ['email'],
            where : {
                name : categorie
            }
        })

        const employeeEmail = Employee.dataValues.email;
        const userEmail = email;

        emailSenderWithNoData(employeeEmail, "EditAppointment_Employe");
        emailSenderWithNoData(userEmail, "EditAppointment_Client");




        res.status(200).json({ msg: "Mise à jour du Rendez-vous réussie" });
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
};


export const deleteAppointment = async (req, res) => {
    try {
        const appointment = await Appointment.findOne({
            
            where: {
                uuid: req.params.id
            }
        });

        const {appointmentDate, appointmentTime, reason, categorie} = appointment.dataValues

        console.log(appointmentTime);

        const Employee = await User.findOne({
            attributes : ['email'],
            where : {
                name : categorie
            }
        })


        const employeeEmail = Employee.dataValues.email;
        

        emailSenderForDelete(employeeEmail, "DeleteAppointment", {
            date : appointmentDate,
            time : appointmentTime,
            reason : reason
        });
        console.log(appointmentDate);


        if (!appointment) return res.status(404).json({ msg: "Données non trouvées" });
        await Appointment.destroy({
            where: {
                id: appointment.id
            }
        });


        res.status(200).json({ msg: "Suppression du Rendez-vous réussie" });
    } catch (error) {
        res.status(500).json({ msg: error.message });
        console.log(error);
    }
};


export const SendMailForReport = async (req , res)=>{
    try {
        const { mail, newDate , newTime } = req.body
        console.log(req.body);
        
        emailSenderReport(mail, "ReportAppointment", {
            date : newDate,
            time : newTime
        })


        res.sendStatus(200);
    } catch (error) {
        res.sendStatus(500);
    }
}

export const SendMailForAccept = async (req , res)=>{
    try {
        const { mail, appointmentDate, appointmentTime, reason, categorie } = req.body


        const Employee = await User.findOne({
            attributes : ['email'],
            where : {
                name : categorie
            }
        })

        const userEmail = mail;
        const userEmploye = Employee.dataValues.email;

        console.log(userEmploye);
        emailSenderForFinalization(userEmail, userEmploye, "FinalisationForClient", {
            date : appointmentDate,
            time : appointmentTime,
            reason : reason
        })
        emailSenderForFinalization(userEmploye, userEmail, "FinalisationForEmploye", {
            date : appointmentDate,
            time : appointmentTime,
            reason : reason
        })




        res.sendStatus(200)
    } catch (error) {
        res.sendStatus(500);
    }
}