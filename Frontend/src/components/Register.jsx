import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import { RegisterUser, reset } from "../features/authSlice"; // Assurez-vous que RegisterUser est défini dans votre slice Redux

const Register = () => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [role, setRole] = useState("");
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { user, isError, isSuccess, isLoading, message } = useSelector((state) => state.auth);

  useEffect(() => {
    if (user || isSuccess) {
      navigate("/"); 
    }
    dispatch(reset());
  }, [user, isSuccess, dispatch, navigate]);

  const Auth = (e) => {
    e.preventDefault();
    dispatch(RegisterUser({ name, email, password, role })); 
  };

  return (
    <section className="hero is-fullheight is-fullwidth">
      <div className="hero-body">
        <div className="container">
          <div className="columns is-centered">
            <div className="column is-4">
              <form onSubmit={Auth} className="box">
                {isError && <p className="has-text-centered">{message}</p>}
                <h1 className="title is-2">Inscription</h1>
                <div className="field">
                  <label className="label">Nom</label>
                  <div className="control">
                    <input type="text" className="input" value={name} onChange={(e) => setName(e.target.value)} placeholder="Votre Nom" />
                  </div>

                </div>
                <div className="field">
                  <label className="label">Email</label>
                  <div className="control">
                    <input type="email" className="input" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Email" />
                  </div>
                </div>
                <div className="field">
                  <label className="label">Mot de passe</label>
                  <div className="control">
                    <input type="password" className="input" value={password} onChange={(e) => setPassword(e.target.value)} placeholder="******" />
                  </div>
                </div>
                
                <div className="field">
                    <label className="label">Rôle</label>
                    <div className="control">
                      <select
                        className="input"
                        value={role}
                        onChange={(e) => {
                          const selectedRole = e.target.value;
                          if (selectedRole === "client") {
                            setRole(selectedRole);
                          } else {
                            alert("L'inscription en tant qu'employeur ou administrateur n'est pas autorisée.");
                          }
                        }}
                      >
                        <option value="client">Client</option>
                      </select>
                    </div>
                  </div>

                <div className="field mt-5">
                  <button type="submit" className="button is-success is-fullwidth">
                    {isLoading? "Enregistrement..." : "S'inscrire"}
                  </button>
                </div>
                <div>
              <button
                    type="button"
                    class="button is-light is-outlined is-fullwidth"
                    onClick={() => navigate("/")} 
                  >
                    Cliquez ici pour vous connecter
                  </button> </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Register;
