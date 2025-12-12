select 
    c.name,
    p.amount
from staging.category c
    left join staging.film_category fc ON c.category_id = fc.category_id
    left join staging.film f ON fc.film_id = f.film_id
    left join staging.inventory i ON f.film_id = i.film_id
    left join staging.rental r ON i.inventory_id = r.inventory_id
    left join staging.payment p ON r.rental_id = p.rental_id
    ;