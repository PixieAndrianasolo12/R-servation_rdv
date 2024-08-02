import React from "react";
import { NavLink, useNavigate } from "react-router-dom";
import { IoPerson, IoHome, IoLogOut, IoList, IoTimeSharp } from "react-icons/io5";
import { useDispatch, useSelector } from "react-redux";
import { LogOut, reset } from "../features/authSlice";

const Sidebar = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { user } = useSelector((state) => state.auth);

  const logout = () => {
    dispatch(LogOut());
    dispatch(reset());
    navigate("/");
  };

  return (
    <div>
  <aside class="menu pl-2 is-fixed has-shadow">
    <p class="menu-label">Général</p>  <ul class="menu-list">
      <li>
        <NavLink to={"/dashboard"}>
          <IoHome /> Accueil
        </NavLink>
      </li>
      

      {user && user.role === "admin" &&(
        <li>
          <NavLink to={"/rendezvous"}>
            <IoTimeSharp /> Rendez-vous
          </NavLink>
        </li>
      )}
      
      {user && (user.role === "client" || user.role === 'user' )&&(
        <li>
          <NavLink to={"/rendezvous"}>
            <IoList /> Liste de Rendez-vous
          </NavLink>
        </li>
      )}
      
    </ul>
    {user && user.role === "admin" && (
      <div>
        <p class="menu-label">Admin</p>  <ul class="menu-list">
          <li>
            <NavLink to={"/users"}>
              <IoPerson /> Utilisateurs
            </NavLink>
          </li>
        </ul>
      </div>
    )}

    <p class="menu-label">Paramètres</p>  <ul class="menu-list">
      <li>
        <button onClick={logout} class="button is-white">
          <IoLogOut /> Déconnexion
        </button>
      </li>
    </ul>
  </aside>
</div>

  );
};

export default Sidebar;
