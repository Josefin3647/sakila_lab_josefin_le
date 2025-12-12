---
title: Analyses
---

<!-- For the following code, sql rentals, I got help from an LLM to sort the months correctly -->

# Number of rentals per month in 2005:

```sql rentals
select
  cast(strftime(rental_date, '%m') as int) as month_number,
  strftime(rental_date, '%B') as month,
  count(*) as number_of_rentals
from sakila.rental_store
where year(rental_date) = 2005
group by month_number, month
order by month_number
```

<BarChart
    data={rentals}
    title="Total - all stores"
    x=month
    y=number_of_rentals
    sort={false}
/>

```sql rents
from sakila.rental_store
```

### Select a store to view the results for that store:

<Dropdown 
data={rents}
name=store
value=store_id
title="Select a store" defaultValue="1">
</Dropdown>

```sql store_choice
select
  cast(strftime(rental_date, '%m') as int) as month_number,
  strftime(rental_date, '%B') as month,
  count(*) as number_of_rentals,
  store_id as store
from sakila.rental_store
where year(rental_date) = 2005
    and store_id = ${inputs.store.value}
group by store_id, month_number, month
order by month_number
```

<BarChart
    data={store_choice}
    title="Store {inputs.store.value}:"
    x=month
    y=number_of_rentals
    sort={false}
    yFmt="$#,##0"
/>

# Total revenue per film category

```sql total_rev
select
    name as category,
    SUM(amount) as total_revenue
from sakila.film_category
where amount is not null
group by category
order by total_revenue desc
```

<BarChart
    data={total_rev}
    title="All stores"
    x=category
    y=total_revenue
    swapXY=true
    yFmt="$#,##0"
/>
