const postsService = require("../services/post.service");
const upload = require("../middleware/post.upload");

exports.create = (req, res, next) => {
  upload(req, res, function (err) {
    if (err) {
      next(err);
    } else {
      const path =
        req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";

      var model = {
        PostDescription: req.body.PostDescription,
        Category: req.body.Category,
        Quantity: req.body.Quantity,
        Price: req.body.Price,
        TVA: req.body.TVA,
        Localisation: req.body.Localisation,
        PostImage: path != "" ? "/" + path : "",
      };
      postsService.createPost(model, (error, results) => {
        if (error) {
          next(error);
        } else {
          return res.status(200).send({
            message: "Success",
            data: results,
          });
        }
      });
    }
  });
};

exports.findAll = (req, res, next) => {
  var model = {
    Category: req.query.Category,
    pageSize: req.query.pageSize,
    page: req.query.page,
  };
  postsService.getPosts(model, (error, results) => {
    if (error) {
      next(error);
    } else {
      return res.status(200).send({
        message: "Success",
        data: results,
      });
    }
  });
};

exports.findOne = (req, res, next) => {
  var model = {
    postId: req.params.id,
  };
  postsService.getPostById(model, (error, results) => {
    if (error) {
      next(error);
    } else {
      return res.status(200).send({
        message: "Success",
        data: results,
      });
    }
  });
};

exports.update = (req, res, next) => {
  upload(req, res, function (err) {
    if (err) {
      next(err);
    } else {
      const path =
        req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";

      var model = {
        postId: req.params.id,
        PostDescription: req.body.PostDescription,
        Category: req.body.Category,
        Quantity: req.body.Quantity,
        Price: req.body.Price,
        TVA: req.body.TVA,
        Localisation: req.body.Localisation,
        PostImage: path != "" ? "/" + path : "",
      };
      postsService.updatePost(model, (error, results) => {
        if (error) {
          next(error);
        } else {
          return res.status(200).send({
            message: "Success",
            data: results,
          });
        }
      });
    }
  });
};

exports.delete = (req, res, next) => {
  var model = {
    postId: req.params.id,
  };
  postsService.deletePost(model, (error, results) => {
    if (error) {
      next(error);
    } else {
      return res.status(200).send({
        message: "Success",
        data: results,
      });
    }
  });
};
