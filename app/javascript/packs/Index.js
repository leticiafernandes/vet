//react
import React from "react";
import { render } from "react-dom";
//boostratp
import 'bootstrap/dist/css/bootstrap.min.css';
import $ from 'jquery'; // eslint-disable-line
import 'bootstrap/dist/js/bootstrap.bundle.min';
//components
import App from "../components/App";

document.addEventListener("DOMContentLoaded", () => {
  render(
    <App />,
    document.body.appendChild(document.createElement("div"))
  );
})