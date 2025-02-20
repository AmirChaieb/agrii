const PostUser = require("../models/PostUser");
const Post = require("../models/post.model");

const addPublishedPost = async (userId, postData) => {
  const post = new Post({ ...postData });
  await post.save();

  const postUser = new PostUser({ userId, postId: post._id, type: "published" });
  await postUser.save();

  return post;
};

const addPurchasedPost = async (userId, postId) => {
  const postExists = await Post.findById(postId);
  if (!postExists) throw new Error("Post not found");

  const postUser = new PostUser({ userId, postId, type: "purchased" });
  await postUser.save();

  return { message: "Post purchased successfully" };
};

const getPublishedPostsByUser = async (userId) => {
  return await PostUser.find({ userId, type: "published" }).populate("postId");
};

const getPurchasedPostsByUser = async (userId) => {
  return await PostUser.find({ userId, type: "purchased" }).populate("postId");
};

module.exports = {
  addPublishedPost,
  addPurchasedPost,
  getPublishedPostsByUser,
  getPurchasedPostsByUser
};
