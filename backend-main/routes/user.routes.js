const express = require("express");
const { getUsers } = require("../controllers/user.controller");
const router = express.Router();
const { validateToken } = require("../middleware/auth");

router.get("/", validateToken, getUsers);

module.exports = router;
