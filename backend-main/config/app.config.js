require("dotenv").config(); 
const MONGO_DB_CONFIG = {
    DB :'mongodb://localhost:27017/Yosser-app',
    PAGE_SIZE : 10
}
module.exports = {
    MONGO_DB_CONFIG
}