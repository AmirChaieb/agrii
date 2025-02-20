const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
  username: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  image: { type: String },
  about: { type: String },
  postsPublished: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Post' }], // Liste des posts publiés
  postsBought: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Post' }] // Liste des posts achetés
});

const User = mongoose.model('User', UserSchema);
module.exports = User;
