import React, { useState , useEffect } from "react";
import axios from "axios";
import {  useSelector } from "react-redux";
import { useParams } from 'react-router-dom';
import { useNavigate } from "react-router-dom";

// Ignorons les avertissements ESLint pour les variables non utilisées
const FormAddRendezvous = () => {
  // eslint-disable-next-line no-unused-vars
  const { userId } = useParams();
  
  const { user } = useSelector((state) => state.auth);
  
  // eslint-disable-next-line no-unused-vars
  const [categorie, setCategorie] = useState("");
  const [reason, setReason] = useState("");
  const [appointmentDate, setAppointmentDate] = useState("");
  const [appointmentTime, setAppointmentTime] = useState("");
  const [msg, setMsg] = useState("");
  const navigate = useNavigate();
  const [selectedUserName, setSelectedUserName] = useState("");

 


  const saveRendezvous = async (e) => {
    e.preventDefault();
    try {
      await axios.post("http://localhost:5000/rendezvous", {
        categorie : categorie,
        reason : reason, 
        appointmentDate : appointmentDate, 
        appointmentTime : appointmentTime 
      });
      navigate("/rendezvous");
    } catch (error) {
      if (error.response) {
        setMsg(error.response.data.msg);
      }
    }
  };

  return (
    <div className="container">
      <h1>Rendez-vous</h1>
      <h2>Réserver un Rendez-vous</h2>

      <div className="card is-shadowless">
        <div className="card-content">
          <div className="content">
            <form onSubmit={saveRendezvous}>
              <p className="has-text-centered">{msg}</p>


              {user && user.role === "client" &&(
                
              <div>
                <label className="label">Catégorie</label>
                <div className="control">
                <select
                    className="input"
                    value={categorie}
                    onChange={(e) => setCategorie(e.target.value)}
                    placeholder="Sélectionnez un Employer"
                  >
                    <option>Sélectionnez un Employer</option>
                    <option>Secretaire de Direction Générale</option>
                    <option>Responsable Informatique</option>
                    <option>Responsable du Service Client</option>
                    <option>Responsable Marketing </option>
                    <option>Responsable Financier</option>
                    <option>Responsable des Opérations</option>
                  </select>
                </div>
              </div>
            )}

              <br />

              <div className="field">
                <label className="label">Motif de Rendez-vous</label>
                <div className="control">
                  <input
                    type="text"
                    className="input"
                    value={reason}
                    onChange={(e) => setReason(e.target.value)}
                    placeholder="Raison ou Motif de Rendez-vous"
                  />
                </div>
              </div>


              <div className="field">
              <label className="label">Date du rendez-vous:</label>
              <div className="control">
                <input
                  type="date"
                  value={appointmentDate}
                  onChange={(e) => setAppointmentDate(e.target.value)}
                  className="input"
                />
              </div>
            </div>

            <div className="field">
              <label className="label">Heure du rendez-vous:</label>
              <div className="control">
                <input
                  type="time"
                  value={appointmentTime}
                  onChange={(e) => setAppointmentTime(e.target.value)}
                  className="input"
                />
              </div>
            </div>

              <div className="field">
                <div className="control">
                  <button type="submit" className="button is-success">Créer</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default FormAddRendezvous;
