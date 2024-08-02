import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import { LoginUser, reset } from "../features/authSlice";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { user, isError, isSuccess, isLoading, message, role } = useSelector(
    (state) => state.auth
  );

  useEffect(() => {
    if (user && isSuccess) {
      // Redirection basée sur le rôle
      switch (role) {
        case 'admin':
          navigate('/dashboard');
          break;
        case 'user':
          navigate('/dashboard');
          break;
        default:
          navigate('/dashboard');
          break;
      }
    }
    dispatch(reset());
  }, [user, isSuccess, dispatch, navigate, role]);

  const Auth = (e) => {
    e.preventDefault();
    dispatch(LoginUser({ email, password }));
  };

  return (
    <section className="hero is-fullheight is-fullwidth">
      <div className="hero-body">
        <div className="container">
          <div className="columns is-centered">
            <div className="column is-4">
              <form onSubmit={Auth} className="box">
                {isError && <p className="has-text-centered">{message}</p>}
                <h1 className="title is-2 cont">Connexion</h1>
                <div className="field">
                  <label className="label">Email</label>
                  <div className="control">
                    <input type="text" className="input" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Email" />
                  </div>
                </div>

                <div className="field">
                  <label className="label">Mot de passe</label>
                  <div className="control">
                    <input type="password" className="input" value={password} onChange={(e) => setPassword(e.target.value)} placeholder="******" />
                  </div>
                </div>
                
                <div className="field mt-5">
                  <button type="submit" className="button is-success is-fullwidth">
                    {isLoading? "Chargement..." : "Connexion"}
                  </button>
                </div>
                
                <div>
                  <button
                    type="button"
                    className="button is-light is-outlined is-fullwidth"
                    onClick={() => navigate("/register")}
                  >
                    Cliquez ici pour vous inscrire
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Login;
