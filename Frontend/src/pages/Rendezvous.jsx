import React, { useEffect, useState } from "react";
import Layout from "./Layout";
import RendezvousList from "../components/RendezvousList";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import { getMe } from "../features/authSlice";

const Rendezvous = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { isError } = useSelector((state) => state.auth);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const fetchData = async () => {
      await dispatch(getMe());
      setIsLoading(false);
    };

    fetchData();
  }, [dispatch]);

  useEffect(() => {
    if (isError) {
      navigate("/");
    }
  }, [isError, navigate]);

  if (isLoading) {
    return <div>Loading...</div>
  }

  return (
    <Layout>
      <RendezvousList />
    </Layout>
  );
};

export default Rendezvous;
