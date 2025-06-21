select u.name, (count(o.quantity)) * (sum(m.price)) as total_price, o.quantity, m.price, o.order_time
from
    users u
    join reservations r on u.id = r.user_id
    join orders o on r.id = o.reservation_id
    join menus m on o.menu_id = m.id
where
    r.status = 'ordered'
    AND o.order_time BETWEEN NOW() - INTERVAL '60 DAYS' AND NOW()
group by
    u.name,
    o.quantity,
    m.price,
    o.order_time
order by total_price desc
limit 10