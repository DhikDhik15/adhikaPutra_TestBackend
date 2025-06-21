const Pool = require("pg").Pool;
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'testbe',
    password: 'postgres',
    port: 5432
});console.log(pool);


const getReservationByDate = (request, response) => {
    // const user_id = parseInt(request.body.user_id)
    // const party_size = parseInt(request.body.party_size)
    // const requested_date = request.body.requested_date
    // const requested_time = request.body.requested_time
    // const duration_minutes = request.body.duration_minutes
    const { user_id, party_size, requested_date, requested_time, duration_minutes } = request.body
    pool.query('select * from reservations limit 1', (error, results) => {
        if (error) {
            throw error
        }
        response.status(200);
    })
}

module.exports = {
    getReservationByDate
}