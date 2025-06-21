const { Pool } = require("pg");
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'testbe',
    password: 'postgres',
    port: 5432
});


const getReservationByDate = (request, response) => {
    const user_id = parseInt(request.body.user_id)
    const party_size = parseInt(request.body.party_size)
    const requested_date = request.body.requested_date
    const requested_time = request.body.requested_time
    const duration_minutes = request.body.duration_minutes
    
    pool.query('Select r.table_id from reservations r join users u on u.id = r.user_id join orders o on o.reservation_id = r.id join tables tab on r.table_id = tab.id where u.id = $1 and tab.capacity = $2', [user_id, party_size], (error, results) => {                        
        return response.status(200)
    })
}

module.exports = {
    getReservationByDate
}