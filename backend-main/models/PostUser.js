const mongoose = require("mongoose");

const PostUserSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
  postId: { type: mongoose.Schema.Types.ObjectId, ref: "Post", required: true },
  type: { type: String, enum: ["published", "purchased"], required: true }
});

const PostUser = mongoose.model("PostUser", PostUserSchema);
module.exports = PostUser;
