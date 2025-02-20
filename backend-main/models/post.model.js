const mongoose = require("mongoose");

const PostSchema = new mongoose.Schema({
  PostDescription: { type: String, required: true },
  Category: { type: String },
  Quantity: { type: String, required: true },
  Price: { type: String, required: true },
  TVA: { type: String },
  Localisation: { type: String },
  PostImage: { type: String }
}, {
  toJSON: {
    transform: function (doc, ret) {
      ret.postId = ret._id.toString();
      delete ret._id;
      delete ret.__v;
    }
  }
});

const Post = mongoose.model('Post', PostSchema);
module.exports = Post;
