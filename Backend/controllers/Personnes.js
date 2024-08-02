import Personne from "../models/PersonneModel.js";
import User from "../models/UserModel.js";
import { Op } from "sequelize";


export const getPersonnes = async (req, res) => {
    try {
        let response;
        if(req.role === "admin"){
            response = await Personne.findAll({
                attributes:['uuid','name','category', 'workingHours', 'workDaysOfWeek'], 
                include:[{
                    model: User,
                    attributes:['name','email',]
                }]
            });
        } else {
            response = await Personne.findAll({
                attributes:['uuid','name','category', 'workingHours', 'workDaysOfWeek'], 
                where:{
                    userId: req.userId
                },
                include:[{
                    model: User,
                    attributes:['name','email']
                }]
            });
        }
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}



export const getPersonneById = async(req, res) => {
    try {
        const personne = await Personne.findOne({
            where:{
                uuid: req.params.id
            }
        });
        if(!personne) return res.status(404).json({msg: "Données non trouvées"});
        let response;
        if(req.role === "admin"){
            response = await Personne.findOne({
                attributes:['uuid','name','category', 'workingHours', 'workDaysOfWeek'],
                where:{
                    id: personne.id
                },
                include:[{
                    model: User,
                    attributes:['name','email']
                }]
            });
        } else {
            response = await Personne.findOne({
                attributes:['uuid','name','category', 'workingHours', 'workDaysOfWeek'],
                where:{
                    [Op.and]:[{id: personne.id}, {userId: req.userId}]
                },
                include:[{
                    model: User,
                    attributes:['name','email']
                }]
            });
        }
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}



export const createPersonne = async(req, res) => {
    const {name, category, workingHours, workDaysOfWeek} = req.body;
    try {
        await Personne.create({
            name: name,
            category: category,
            userId: req.userId,
            workingHours: workingHours, 
            workDaysOfWeek: workDaysOfWeek
        });
        res.status(201).json({msg: "Création de la personne réussie"});
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}



export const updatePersonne = async(req, res) => {
    try {
        const personne = await Personne.findOne({
            where:{
                uuid: req.params.id
            }
        });
        if(!personne) return res.status(404).json({msg: "Données non trouvées"});
        const {name, category, workingHours, workDaysOfWeek} = req.body;
        if(req.role === "admin" || (req.userId=== personne.userId)){
            await Personne.update({
                name: name,
                category: category,
                workingHours: workingHours,
                workDaysOfWeek: workDaysOfWeek
            },{
                where:{
                    [Op.and]:[{id: personne.id}, {userId: req.userId}]
                }
            });
            res.status(200).json({msg: "Mise à jour de la personne réussie"});
        } else {
            return res.status(403).json({msg: "Accès refusé"});
        }
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}



export const deletePersonne = async(req, res) => {
    try {
        const personne = await Personne.findOne({
            where:{
                uuid: req.params.id
            }
        });
        if(!personne) return res.status(404).json({msg: "Données non trouvées"});
        if(req.role === "admin" || (req.userId=== personne.userId)){
            await Personne.destroy({
                where:{
                    [Op.and]:[{id: personne.id}, {userId: req.userId}]
                }
            });
            res.status(200).json({msg: "Suppression de la personne réussie"});
        } else {
            return res.status(403).json({msg: "Accès refusé"});
        }
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}
