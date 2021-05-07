const mongoose = require("mongoose")
const config = require("@config")
const environments = require("@enums/environments")
const loadFilesIn = require("@utils/loadFilesIn")

mongoose.Promise = global.Promise
mongoose.set("useCreateIndex", true)
mongoose.set("useFindAndModify", false)

console.log(config.mongodbUri)

const connectionUri =
  config.nodeEnv == environments.test ? config.mongodbUriTest : config.mongodbUri

mongoose.connect(connectionUri, {
  useNewUrlParser: true,
  useUnifiedTopology: true
})

// load all models
loadFilesIn(__dirname, "../../models")

module.exports = mongoose
