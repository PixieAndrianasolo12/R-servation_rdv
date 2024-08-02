import React, { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate, useParams } from "react-router-dom";

const FormEditPersonne = () => {
  const [name, setName] = useState("");
  const [category, setCategory] = useState("");
  const [workingHours, setWorkingHours] = useState("");
  const [workDaysOfWeek, setWorkDaysOfWeek] = useState("");
  const [msg, setMsg] = useState("");
  const navigate = useNavigate();
  const { id } = useParams();

  useEffect(() => {
        const getPersonneById = async () => {
          try {
            const response = await axios.get(`http://localhost:5000/personnes/${id}`);
            setName(response.data.name);
            setCategory(response.data.category);
            setWorkingHours(response.data.workingHours);
            setWorkDaysOfWeek(response.data.workDaysOfWeek);
          } catch (error) {
            if (error.response) {
              setMsg(error.response.data.msg);
            }
          }
        };
        getPersonneById();
  }, [id]);

  
  const updatePersonne = async (e) => {
        e.preventDefault();
        try {
          await axios.patch(`http://localhost:5000/personnes/${id}`, {
            name: name,
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
    <div>
      <h1 className="titre">Catégorie</h1>
      <h2 className="subtitle">Modifier Personne</h2>
      <div className="card is-shadowless">
        <div className="card-content">
          <div className="content">
            <form onSubmit={updatePersonne}>
              <p className="has-text-centered">{msg}</p>
              <div className="field">
                <label className="label">Nom</label>
                <div className="control">
                  <input
                    type="text"
                    className="input"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    placeholder="Nom de la personne"
                  />
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
                  <button type="submit" className="button is-success">
                    Mettre à jour
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default FormEditPersonne;
