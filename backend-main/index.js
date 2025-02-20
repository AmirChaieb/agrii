const express = require("express");
require("dotenv").config();
const app = express();
const cookieParser = require("cookie-parser");
const cors = require("cors");
const http = require("http");
const { Server } = require("socket.io");
const mongoose = require("mongoose");
const errors = require("./middleware/errors");
const swaggerUi = require("swagger-ui-express"), swaggerDocument = require("./swagger.json");

// Middlewares
app.use(express.json());
app.use(cookieParser());
app.use(cors());

// WebSocket Server
const server = http.createServer(app);
const io = new Server(server, {
  path: "/ws",
  cors: { origin: "http://10.0.2.2:4000", methods: ["GET", "POST"] }
});

let users = {};

io.on("connection", (socket) => {
  console.log("🟢 User connected");
  socket.on("disconnect", () => console.log("🔴 User disconnected"));
});

mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
.then(() => console.log("✅ Database connected"))
.catch(error => console.log("❌ Database connection failed: " + error));

// Routes
app.use("/api/auth", require("./routes/auth.routes"));
app.use("/api/users", require("./routes/user.routes"));
app.use("/api/post-user", require("./routes/postUser.routes"));



// Error Handling & Docs
app.use(errors.errorHandler);
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Start Server
const PORT = process.env.PORT || 4000;
server.listen(PORT, () => console.log(`🚀 Server running on port ${PORT}`));

app.use(express.json())
app.use("/uploads", express.static("uploads"))
app.use("/api", require("./routes/app.routes"))



