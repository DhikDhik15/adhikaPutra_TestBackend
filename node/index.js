const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 3000
const psqlPort = 5432
const Pool = require('pg').Pool
const db = require('./config/database');


app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

// POSTGRE CONNECTION
new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'testbe',
  password: 'postgres',
  port: 5432,
})

app.post("/api/reservation/allocate-table", db.getReservationByDate);

app.listen(port, () => {
  console.log(`App running on port ${port} and postgre in port ${psqlPort}`)
})