SELECT r.table_id, tab.name, r.start_time
from reservations r
    join tables tab on tab.id = r.table_id
group by
    r.start_time,
    r.table_id,
    tab.name
having
    count(r.start_time) > 1