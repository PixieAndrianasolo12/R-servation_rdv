import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "axios";

const PersonneList = () => {
  const [personnes, setPersonnes] = useState([]);

  useEffect(() => {
    getPersonnes();
  }, []);

  const getPersonnes = async () => {
    const response = await axios.get("http://localhost:5000/personnes");
    setPersonnes(response.data);
  };

  const deletePersonne = async (personneId) => {
    await axios.delete(`http://localhost:5000/personnes/${personneId}`);
    getPersonnes();
  };


  return (
    <div>
      <h1 className="titre">Catégorie</h1>
      <h2 className="subtitle">Liste des Personnes</h2>
      <Link to="/personnes/add" className="button is-primary mb-2">
        Ajouter une personne
      </Link>
      <table className="table is-striped is-fullwidth">
        <thead>
          <tr>
            <th>No</th>
            <th>Nom de la personne</th>
            <th>Catégorie</th>
            <th>Heures de travail par Jours</th>
            <th>Jours de travail pendant la semaine</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {personnes.map((personne, index) => (
            <tr key={personne.uuid}>
              <td>{index + 1}</td>
              <td>{personne.name}</td>
              <td>{personne.category}</td>
              <td>{personne.workingHours}</td>
              <td>{personne.workDaysOfWeek}</td>
              <td>
                <Link to={`/personnes/edit/${personne.uuid}`} className="button is-small is-info">
                  Modifier
                </Link>
                <button onClick={() => deletePersonne(personne.uuid)} className="button is-small is-danger">
                  Supprimer
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default PersonneList;
