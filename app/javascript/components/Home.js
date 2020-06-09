import React from "react";
import { Link } from "react-router-dom";

const Home = () => {
  const title = "Clínica Veterinária";
  const subtitle =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In non lacus vel leo mollis maximus.";

  return (
    <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
      <div className="jumbotron jumbotron-fluid bg-transparent">
        <div className="container secondary-color">
          <h1 className="display-4">{title}</h1>
          <p className="lead">{subtitle}</p>
          <hr className="my-4" />
          <Link to="/panel" className="btn btn-lg custom-button" role="button">
            Painel
          </Link>
        </div>
      </div>
    </div>
  );
};

export default Home;
