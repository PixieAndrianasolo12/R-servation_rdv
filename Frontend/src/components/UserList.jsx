import React, { useState, useEffect } from "react";
import axios from "axios";
import { Link } from "react-router-dom";

const Userlist = () => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    getUsers();
  }, []);

  const getUsers = async () => {
    const response = await axios.get("http://localhost:5000/users");
    setUsers(response.data);
  };

  const deleteUser = async (userId) => {
    await axios.delete(`http://localhost:5000/users/${userId}`);
    getUsers();
  };

  return (
    <div>
  <h1 class="titre">Utilisateurs</h1>  <h2 class="subtitle">Liste des Utilisateurs</h2>
  <Link to="/users/add" class="button is-primary mb-2">
    Ajouter un utilisateur
  </Link>
  <table class="table is-striped is-fullwidth">
    <thead>
      <tr>
        <th>No</th>
        <th>Nom</th>
        <th>Email</th>
        <th>Rôle</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      {users.map((user, index) => (
        <tr key={user.uuid}>
          <td>{index + 1}</td>
          <td>{user.name}</td>
          <td>{user.email}</td>
          <td>{user.role}</td>
          <td>
            <Link to={`/users/edit/${user.uuid}`} class="button is-small is-info">
              Modifier
            </Link>
            <button onClick={() => deleteUser(user.uuid)} class="button is-small is-danger">
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

export default Userlist;
