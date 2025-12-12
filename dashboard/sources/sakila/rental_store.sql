select 
    r.rental_date,
    s.store_id
from staging.rental r
    join staging.inventory i ON i.inventory_id = r.inventory_id
    join staging.store s ON i.store_id = s.store_id
    ;