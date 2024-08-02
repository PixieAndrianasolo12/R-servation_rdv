import express from "express";
import cors from "cors";
import session from "express-session";
import dotenv from "dotenv";
import db from "./config/Database.js";
import SequelizeStore from "connect-session-sequelize";
import UserRoute from "./routes/UserRoute.js";
import PersonneRoute from "./routes/PersonneRoute.js";
import AuthRoute from "./routes/AuthRoute.js";
import RendezvousRoute from './routes/RendezvousRoute.js';



dotenv.config();

const app = express();

const sessionStore = SequelizeStore(session.Store);
const store = new sessionStore({
    db: db
});


/*** Code mandefa ny table ao anatin'ny Model any @  Xamp ***/   
        /*(async()=>{
            await db.sync();
        })(); */


/*** Code manao à jours ny table any @  Xamp raha manao Modification ao @ Models ***/         
        /*(async () => {
            await db.sync({ alter: true });
        })();*/


app.use(session({
    secret: process.env.SESS_SECRET,
    resave: false,
    saveUninitialized: true,
    store: store,
    cookie: {
        secure: 'auto'
    }
}));



app.use(cors({
    credentials: true,
    origin: 'http://localhost:3000'
}));


app.use(express.json());
app.use(UserRoute);
app.use(PersonneRoute);
app.use(AuthRoute);
app.use(RendezvousRoute);


store.sync(); // Créez la table de session dans la base de données


app.listen(process.env.APP_PORT, () => {
    console.log(`Serveur en cours d\'exécution sur le port http://localhost:${process.env.APP_PORT} `, );
});