import { verify } from 'jsonwebtoken'; // Pour la vérification des tokens JWT
import session from 'express-session';

// Configuration de la session
sessionConfig = {
    secret: 'secret',
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false } // Ajustez selon votre environnement (true pour HTTPS)
};

// Middleware d'authentification
function authenticate(req, res, next) {
    // Vérification de la présence d'un token JWT dans le cookie de session
    if (req.session.token) {
        verify(req.session.token, sessionConfig.secret, (err, decoded) => {
            if (err) {
                return res.status(401).send({ message: 'Invalid Token' });
            }
            req.user = decoded; // Ajout des informations de l'utilisateur à la requête
            next();
        });
    } else {
        return res.status(401).send({ message: 'No Token Provided' });
    }
}

export default session(sessionConfig).use(authenticate);
