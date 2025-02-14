const mongoose = require("mongoose");

const post = mongoose.model(
  "Post",
  mongoose.Schema(
    {
      PostDescription: {
        type: String,
        require: true,
      },
      Category: {
        type: String,
      },
      Quantity: {
        type: String,
        require: true,
      },
      Price: {
        type: String,
        require: true,
      },
      TVA: {
        type: String,
      },
      Localisation: {
        type: String
      },
      PostImage: {
        type: String,
      },
    },
    {
      toJSON: {
        transform: function (doc, ret) {
          ret.postId = ret._id.toString();
          delete ret._id;
          delete ret._v;
        },
      },
    }
  )
);

module.exports = {
  post,
};
