import express from "express";
import http from "node:http";
import dbConnection from "./services/dbConnection.js";
import studentRouter from "./Routes/associationRoute.js";
import cors from "cors";

const app = express();

// création d'un router

const router = express.Router();

app.use(router);

router.use(express.json());

// router.use("/association", associationRoute);

router.get("/", (req, res) => res.send("coucou"));

const server = http.createServer(app);

export default server;