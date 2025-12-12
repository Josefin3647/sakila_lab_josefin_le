---
title: Analyzes
---

```sql rentals
select
strftime(rental_date, '%B') AS month,
count(rental_date) AS number_of_rentals
from sakila.rentals
where YEAR(rental_date) = 2005
group by month
order by month
```

<BarChart
    data={rentals}
    title="Number of rentals per month in 2005"
    x=month
    y=number_of_rentals
/>