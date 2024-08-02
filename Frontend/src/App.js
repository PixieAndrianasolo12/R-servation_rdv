import { BrowserRouter, Routes, Route } from "react-router-dom";
import Dashboard from "./pages/Dashboard";
import Login from "./components/Login";
import Users from "./pages/User";
import Personnes from "./pages/Personnes";
import Rendezvous from "./pages/Rendezvous";
import AddUser from "./pages/AddUser";
import EditUser from "./pages/EditUser";
import AddPersonne from "./pages/AddPersonne";
import EditPersonne from "./pages/EditPersonne";
import Register from "./components/Register";
import AddRendezvous from "./pages/AddRendezvous";
import EditRendezvous from "./pages/EditRendezvous";

function App() {
  return (
    <div>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Login />} />
          <Route path="/register" element={<Register/>} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/users" element={<Users />} />
          <Route path="/users/add" element={<AddUser />} />
          <Route path="/users/edit/:id" element={<EditUser />} />
          <Route path="/personnes" element={<Personnes />} />
          <Route path="/personnes/add" element={<AddPersonne />} />
          <Route path="/personnes/edit/:id" element={<EditPersonne />} />
          <Route path="/rendezvous" element={<Rendezvous />} />
          <Route path="/rendezvous/add" element={<AddRendezvous />} />
          <Route path="/rendezvous/edit/:id" element={<EditRendezvous />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
