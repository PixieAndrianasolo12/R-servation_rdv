import React, { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from 'react-router-dom';
import { useNavigate } from "react-router-dom";

// Ignorons les avertissements ESLint pour les variables non utilisées
const FormAddPersonne = () => {
  // eslint-disable-next-line no-unused-vars
  const { userId } = useParams();
  
  // eslint-disable-next-line no-unused-vars
  const [name, setName] = useState("");
  const [category, setCategory] = useState("");
  const [workingHours, setWorkingHours] = useState("");
  const [workDaysOfWeek, setWorkDaysOfWeek] = useState("");
  const [msg, setMsg] = useState("");
  const navigate = useNavigate();

  const [users, setUsers] = useState([]);
  const [selectedUserName, setSelectedUserName] = useState("");

  useEffect(() => {
    const fetchUserList = async () => {
      try {
        const response = await axios.get('http://localhost:5000/users');
        setUsers(response.data.filter(user => user.role === 'user'));
      } catch (error) {
        console.error("Erreur lors de la récupération de la liste des utilisateurs:", error);
      }
    };

    fetchUserList();
  }, []);

  const savePersonne = async (e) => {
    e.preventDefault();
    try {
      await axios.post("http://localhost:5000/personnes", {
        name: selectedUserName,
        category: category,
        workingHours: workingHours,
        workDaysOfWeek: workDaysOfWeek,
      });
      navigate("/personnes");
    } catch (error) {
      if (error.response) {
        setMsg(error.response.data.msg);
      }
    }
  };

  return (
    <div className="container">
      <h1>Catégorie</h1>
      <h2>Ajouter une nouvelle personne</h2>

      <div className="card is-shadowless">
        <div className="card-content">
          <div className="content">
            <form onSubmit={savePersonne}>
              <p className="has-text-centered">{msg}</p>

              <div className="field">
                <label className="label">Nom de l'utilisateur</label>
                <div className="control">
                  <select
                    className="input"
                    value={selectedUserName}
                    onChange={(e) => setSelectedUserName(e.target.value)}
                    disabled={!users.length}
                    placeholder="Sélectionnez un utilisateur"
                  >
                    <option value="">Sélectionnez un utilisateur</option>
                    {users.map((user, index) => (
                      <option key={index} value={user.name}>{user.name}</option>
                    ))}
                  </select>
                </div>
              </div>

              <div className="field">
                <label className="label">Catégorie</label>
                <div className="control">
                  <input
                    type="text"
                    className="input"
                    value={category}
                    onChange={(e) => setCategory(e.target.value)}
                    placeholder="Catégorie"
                  />
                </div>
              </div>

              <div className="field">
                <label className="label">Heures de travail</label>
                <div className="control">
                  <input
                    type="number"
                    className="input"
                    value={workingHours}
                    onChange={(e) => setWorkingHours(e.target.value)}
                    placeholder="Nombre d'heures par jour"
                  />
                </div>
              </div>

              <div className="field">
                <label className="label">Jours de la semaine</label>
                <div className="control">
                  <input
                    type="text"
                    className="input"
                    value={workDaysOfWeek}
                    onChange={(e) => setWorkDaysOfWeek(e.target.value)}
                    placeholder="Jours de la semaine (ex: Lundi, Mardi)"
                  />
                </div>
              </div>

              <div className="field">
                <div className="control">
                  <button type="submit" className="button is-success">Enregistrer</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default FormAddPersonne;
