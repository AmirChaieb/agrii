const express = require("express");
const {
  publishPost,
  purchasePost,
  getUserPublishedPosts,
  getUserPurchasedPosts
} = require("../controllers/postUser.controller");
const { validateToken } = require("../middleware/auth");

const router = express.Router();

router.post("/publish", validateToken, publishPost);
router.post("/purchase", validateToken, purchasePost);
router.get("/published", validateToken, getUserPublishedPosts);
router.get("/purchased", validateToken, getUserPurchasedPosts);

module.exports = router;
