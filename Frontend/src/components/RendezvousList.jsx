import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "axios";
import { useSelector } from "react-redux";
import Modal from 'react-modal';

const customStyles = {
  content: {
    top: '50%',
    left: '50%',
    right: 'auto',
    bottom: 'auto',
    marginRight: '-50%',
    transform: 'translate(-50%, -50%)',
    width: '400px',
    minHeight: '100px',
    padding: '20px',
    borderRadius: '12px',
    boxShadow: '0 4px 15px rgba(0,0,0,0.6)',
    backgroundColor: '#1e1e1e',
    color: '#e0e0e0',
    border: '1px solid #444',
    fontFamily: "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif",
  },
  overlay: {
    backgroundColor: 'rgba(0, 0, 0, 0.8)',  // Darker background color with some transparency
  },
};

const RendezvousList = () => {
  const [appointments, setAppointments] = useState([]);
  const [acceptedAppointments, setAcceptedAppointments] = useState([]);
  const [modalIsOpen, setModalIsOpen] = useState(false);
  const [selectedAppointment, setSelectedAppointment] = useState(null);
  const [newDate, setNewDate] = useState("");
  const [newTime, setNewTime] = useState("");
  const { user } = useSelector((state) => state.auth);

  useEffect(() => {
    getAppointments();
  }, []);

  const getAppointments = async () => {
    if (user && user.role === 'admin') {
      const response = await axios.get("http://localhost:5000/rendezvous");
      setAppointments(response.data);
    } else if (user && user.role === 'user') {
      const response = await axios.get(`http://localhost:5000/rendezvous/category/${user.name}`);
      setAppointments(response.data);
    } else if (user && user.role === 'client') {
      const response = await axios.get(`http://localhost:5000/Myrendezvous`);
      setAppointments(response.data);
    }
  };

  const deleteAppointment = async (appointmentId) => {
    await axios.delete(`http://localhost:5000/rendezvous/${appointmentId}`);
    getAppointments();
  };

  const sendMailForReport = async (mail, newDate, newTime) => {
    try {
      await axios.post('http://localhost:5000/rendezvous/mailReport', {
        mail,
        newDate,
        newTime
      });
      getAppointments();
      closeModal();
    } catch (error) {
      console.error('Error sending mail report:', error.response ? error.response.data : error.message);
    }
  };

  const sendMailForAccept = async (mail, appointmentDate, appointmentTime, reason, categorie) => {
    try {
      await axios.post('http://localhost:5000/rendezvous/mailAccept', {
        mail,
        appointmentDate,
        appointmentTime,
        reason,
        categorie
      });
      setAcceptedAppointments([...acceptedAppointments, mail]);
    } catch (error) {
      console.log(error);
    }
  };

  const openModal = (appointment) => {
    setSelectedAppointment(appointment);
    setModalIsOpen(true);
  };

  const closeModal = () => {
    setSelectedAppointment(null);
    setNewDate("");
    setNewTime("");
    setModalIsOpen(false);
  };

  return (
    <div>
      <h1 className="titre">Rendez-vous</h1>
      <h2 className="subtitle">Liste des Rendez-vous</h2>
      {user && user.role === "client" && (
        <li>
          <Link to="/rendezvous/add" className="button is-primary mb-2">
            Ajouter un Rendez-vous
          </Link>
        </li>
      )}

      <table className="table is-striped is-fullwidth">
        <thead>
          <tr>
            <th>No</th>
            <th>Nom de la personne</th>
            <th>Email</th>
            <th>Catégorie</th>
            <th>Motif</th>
            <th>Jours</th>
            <th>Heures</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {appointments.map((appointment, index) => (
            <tr key={appointment.uuid}>
              <td>{index + 1}</td>
              <td>{appointment.name}</td>
              <td>{appointment.email}</td>
              <td>{appointment.categorie}</td>
              <td>{appointment.reason}</td>
              <td>{appointment.appointmentDate}</td>
              <td>{appointment.appointmentTime}</td>
              <td>
                {!acceptedAppointments.includes(appointment.email) && (
                  <>
                    {user && (user.role === "admin" || user.role === "client") && (
                      <Link to={`/rendezvous/edit/${appointment.uuid}`} className="button is-small is-info">
                        Modifier
                      </Link>
                    )}
                    {user && user.role === "client" && (
                      <button onClick={() => deleteAppointment(appointment.uuid)} className="button is-small is-danger">
                        Annuler
                      </button>
                    )}
                    {user && user.role === "user" && (
                      <>
                        <button onClick={() => openModal(appointment)} className="button is-small is-info">
                          Reporter
                        </button>
                        <button onClick={() => sendMailForAccept(appointment.email, appointment.appointmentDate, appointment.appointmentTime, appointment.reason, appointment.categorie)} className="button is-small is-success">
                          Accepter
                        </button>
                      </>
                    )}
                  </>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      <Modal
        isOpen={modalIsOpen}
        onRequestClose={closeModal}
        style={customStyles}
        contentLabel="Reporter Rendez-vous"
      >
        <h2 style={{ textAlign: 'center' }}>Reporter Rendez-vous</h2>
        {selectedAppointment && (
          <form
            onSubmit={(e) => {
              e.preventDefault();
              sendMailForReport(selectedAppointment.email, newDate, newTime);
            }}
          >
            <div style={{ marginBottom: '10px' }}>
              <label style={{ color: '#e0e0e0' }}>Date :</label>
              <input
                type="text"
                value={newDate}
                onChange={(e) => setNewDate(e.target.value)}
                required
                style={{
                  width: '100%',
                  padding: '8px',
                  marginTop: '5px',
                  backgroundColor: '#333',
                  color: '#e0e0e0',
                  border: '1px solid #444',
                  borderRadius: '4px',
                  fontFamily: "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif",
                }}
              />
            </div>
            <div style={{ marginBottom: '20px' }}>
              <label style={{ color: '#e0e0e0' }}>Heure :</label>
              <input
                type="text"
                value={newTime}
                onChange={(e) => setNewTime(e.target.value)}
                required
                style={{
                  width: '100%',
                  padding: '8px',
                  marginTop: '5px',
                  backgroundColor: '#333',
                  color: '#e0e0e0',
                  border: '1px solid #444',
                  borderRadius: '4px',
                  fontFamily: "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif",
                }}
              />
            </div>

            <button type="submit" className="button is-primary" style={{ marginRight: '10px' }}>
              Reporter
            </button>
            <button type="button" onClick={closeModal} className="button">
              Annuler
            </button>
          </form>
        )}
      </Modal>
    </div>
  );
};

export default RendezvousList;
