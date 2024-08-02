import React, { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate, useParams } from "react-router-dom";


const FormEditUser = () => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confPassword, setConfPassword] = useState("");
  const [role, setRole] = useState("");
  const [msg, setMsg] = useState("");
  const navigate = useNavigate();
  const { id } = useParams();

  useEffect(() => {
        const getUserById = async () => {
          try {
            const response = await axios.get(`http://localhost:5000/users/${id}`);
            setName(response.data.name);
            setEmail(response.data.email);
            setRole(response.data.role);
          } catch (error) {
            if (error.response) {
              setMsg(error.response.data.msg);
            }
          }
        };
        getUserById();
  }, [id]);

  const updateUser = async (e) => {
        e.preventDefault();
        try {
          await axios.patch(`http://localhost:5000/users/${id}`, {
            name: name,
            email: email,
            password: password,
            confPassword: confPassword,
            role: role,
          });
          navigate("/users");
        } catch (error) {
          if (error.response) {
            setMsg(error.response.data.msg);
          }
        }
  };
  return (
    <div>
    <h1 class="titre">Utilisateurs</h1>  <h2 class="subtitle">Modifier Utilisateur</h2>
    <div class="card is-shadowless">
      <div class="card-content">
        <div class="content">
          <form onSubmit={updateUser}>
            <p class="has-text-centered">{msg}</p>
            <div class="field">
              <label class="label">Nom</label>  <div class="control">
                <input type="text" class="input" value={name} onChange={(e) => setName(e.target.value)} placeholder="Nom" />
              </div>
            </div>

            <div class="field">
              <label class="label">Email</label>  <div class="control">
                <input type="text" class="input" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Email" />
              </div>
            </div>

            <div class="field">
              <label class="label">Mot de passe</label>  <div class="control">
                <input type="password" class="input" value={password} onChange={(e) => setPassword(e.target.value)} placeholder="******" />
              </div>
            </div>

            <div class="field">
              <label class="label">Confirmer le mot de passe</label>  <div class="control">
                <input type="password" class="input" value={confPassword} onChange={(e) => setConfPassword(e.target.value)} placeholder="******" />
              </div>
            </div>

            <div class="field">
              <label class="label">Rôle</label>  <div class="control">
                <div class="select is-fullwidth">
                  <select value={role} onChange={(e) => setRole(e.target.value)}>
                    <option value="admin">Admin</option>
                    <option value="user"> Employeur</option>  </select>
                </div>
              </div>
            </div>
            
            <div class="field">
              <div class="control">
                <button type="submit" class="button is-success">
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

export default FormEditUser;
