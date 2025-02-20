const { response } = require("express")
const post = require("../models/post.model")
const { MONGO_DB_CONFIG } = require("../config/app.config")

async function createPost(params, callback) {
    if(!params.PostDescription){
        return callback({
            message : "Post Description Required!"
        }, "")
    }
    if(!params.Quantity){
        return callback({
            message : "Quantity Required!"
        }, "")
    }
    if(!params.Price){
        return callback({
            message : "Price Required!"
        }, "")
    }

    const model = new post(params)
    model.save()
    .then((response) => {
        return callback(null, response)
    })
    .catch((error) => {
        return callback(error)
    })
}

async function getPosts(params, callback) {
    const Category = params.Category
    // Création de la condition de recherche (filtrage par category si fourni)
    var condition = Category ? {
        Category : {$regex : new RegExp(Category), $options : "i"}
    }
    : {};

    // Gestion de la pagination
    let perPage = Math.abs(params.pageSize) || MONGO_DB_CONFIG.pageSize // Nombre d'éléments par page
    let page = (Math.abs(params.page) || 1) - 1 // Calcul du numéro de page (index basé sur 0)

    post.find(condition, "PostDescription Category Quantity Price TVA Localisation PostImage")
    .limit(perPage) // Limite le nombre de résultats
    .skip(perPage * page) // Ignore les éléments des pages précédentes
    .then((response) => {
        return callback(null, response)
    })
    .catch((error) => {
        return callback(error)
    })

}

async function getPostById(params, callback) {
    const postId = params.postId

    post.findById(postId)
    .then((response) => {
        if(!response) callback("Not Found Post with Id : " + postId)
        else callback(null, response)
    })
    .catch((error) => {
        return callback(error)
    })

}

async function updatePost(params, callback) {
    const postId = params.postId

    post.findByIdAndUpdate(postId, params, {useFindAndModify : false})
    .then((response) => {
        if(!response) callback("Not Found post with Id : " + postId)
        else callback(null, response)
    })
    .catch((error) => {
        return callback(error)
    })

}

async function deletePost(params, callback) {
    const postId = params.postId

    post.findByIdAndDelete(postId)
    .then((response) => {
        if(!response) callback("Not Found Post with Id : " + postId)
        else callback(null, response)
    })
    .catch((error) => {
        return callback(error)
    })

}
module.exports = {
    getPosts,
    createPost,
    getPostById,
    updatePost,
    deletePost
}