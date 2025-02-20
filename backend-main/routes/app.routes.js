const postController = require("../controllers/posts.controller")
const express = require("express")
const router = express.Router()

router.post("/post", postController.create);
router.get("/post", postController.findAll);
router.get("/post/:id", postController.findOne);
router.put("/post/:id", postController.update);
router.delete("/post/:id", postController.delete);

module.exports = router;