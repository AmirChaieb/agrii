const {
    addPublishedPost,
    addPurchasedPost,
    getPublishedPostsByUser,
    getPurchasedPostsByUser
  } = require("../services/postUser.service");
  
  const publishPost = async (req, res) => {
    try {
      const userId = req.user.id;
      const post = await addPublishedPost(userId, req.body);
      res.json(post);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };
  
  const purchasePost = async (req, res) => {
    try {
      const userId = req.user.id;
      const { postId } = req.body;
      const result = await addPurchasedPost(userId, postId);
      res.json(result);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };
  
  const getUserPublishedPosts = async (req, res) => {
    try {
      const userId = req.user.id;
      const posts = await getPublishedPostsByUser(userId);
      res.json(posts);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };
  
  const getUserPurchasedPosts = async (req, res) => {
    try {
      const userId = req.user.id;
      const posts = await getPurchasedPostsByUser(userId);
      res.json(posts);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };
  
  module.exports = {
    publishPost,
    purchasePost,
    getUserPublishedPosts,
    getUserPurchasedPosts
  };
  