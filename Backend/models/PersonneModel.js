import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Users from "./UserModel.js";

const { DataTypes } = Sequelize;
const Personnes = db.define('personne', {
    uuid: {
      type: DataTypes.STRING,
      defaultValue: DataTypes.UUIDV4,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notEmpty: true,
        len: [3, 100]
      }
    },
    category: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    userId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    workingHours: {
      type: DataTypes.DECIMAL(5, 2),
      allowNull: true,
      validate: {
        isDecimal: true 
      }
    },
    
    workDaysOfWeek: {
      type: DataTypes.STRING, 
      allowNull: true,
      validate: {
        
      }
    }
  }, {
    freezeTableName: true
  });
  
  Users.hasMany(Personnes);
  Personnes.belongsTo(Users, { foreignKey: 'userId' });
  
  export default Personnes;
  
