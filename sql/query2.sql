select
    DATE_TRUNC ('day', r.start_time) as date,
    DATE_TRUNC ('hour', r.start_time) as hour_slot,
    count(r.id) as reservation_count
from
    reservations r
    join orders o on o.reservation_id = r.id
    join users u on r.user_id = u.id
where
    o.order_time BETWEEN NOW() - INTERVAL '14 DAYS' AND NOW()
group by
    date,
    r.start_time
order by date, r.start_time
limit 14