import User from "../models/UserModel.js";
import argon2 from "argon2";


/**** INSCRIPTION ****/ 
export const Register = async (req, res) => {
  const { name, email, password, role } = req.body;

  // Liste des rôles interdits pour l'inscription
  const forbiddenRoles = ['Employeur', 'Administrateur'];

  // Vérifiez si l'utilisateur existe déjà
  const existingUser = await User.findOne({
    where: {
      email,
    },
  });

  if (existingUser) {
    return res.status(400).json({ msg: "L'utilisateur existe déjà" });
  }

  // Vérifiez si le rôle est interdit
  if (forbiddenRoles.includes(role)) {
    return res.status(403).json({ msg: "Les rôles Employeur et Administrateur ne sont pas autorisés à s'inscrire." });
  }

  const hashedPassword = await argon2.hash(password);
  const user = await User.create({
    name,
    email,
    password: hashedPassword,
    role: role || "client",
  });

  req.session.userId = user.uuid;

  res.status(201).json({
    uuid: user.uuid,
    name: user.name,
    email: user.email,
    role: user.role,
  });
};



/**** Connexion ****/ 
export const Login = async (req, res) => {
  const user = await User.findOne({
    where: {
      email: req.body.email,
    },
  });

  if (!user) {
    return res.status(404).json({ msg: "L'utilisateur n'a pas été trouvé" });
  }
  const match = await argon2.verify(user.password, req.body.password);

  if (!match) {
    return res.status(400).json({ msg: "Mot de passe incorrect" });
  }

  req.session.userId = user.uuid;
  res.status(200).json({ uuid: user.uuid, name: user.name, email: user.email, role: user.role });
};

// Récupérer les informations de l'utilisateur connecté ( Afaka testena ao @ request.rest )
export const Me = async (req, res) => {
  if (!req.session.userId) {
    return res.status(401).json({ msg: "Veuillez vous connecter à votre compte!" });
  }

  // Recherchez l'utilisateur connecté par son UUID ( Afaka testena ao @ request.rest )
  const user = await User.findOne({
    attributes: ["uuid", "name", "email", "role"],
    where: {
      uuid: req.session.userId,
    },
  });

  if (!user) {
    return res.status(404).json({ msg: "L'utilisateur n'a pas été trouvé" });
  }
  res.status(200).json(user);
};


/**** Déconnexion ****/ 
export const logOut = async (req, res) => {
  try {
    await req.session.destroy();
  } catch (err) {
    console.error(err);
    return res.status(400).json({ msg: "Erreur lors de la déconnexion" });
  }
  res.status(200).json({ msg: "Vous avez été déconnecté" });
};
