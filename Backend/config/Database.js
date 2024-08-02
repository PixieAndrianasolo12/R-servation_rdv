import { Sequelize } from "sequelize";

const db =  new Sequelize('reservationdb', 'root' , '' , {
    host : "localhost", 
    dialect: "mysql"
});

export default db; 