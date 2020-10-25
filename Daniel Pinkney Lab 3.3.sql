-- Lab 3.03 - Finished
use sakila;

-- Get all pairs of actors that worked together.
select a1.actor_id, a2.actor_id 
from film_actor a1
join film_actor a2 on a1.film_id = a2.film_id and a1.actor_id < a2.actor_id
group by a1.actor_id, a2.actor_id
order by a1.actor_id;

-- Get all pairs of customers that have rented the same film more than 3 times.
select r.customer_id, i.film_id
from rental r
join inventory i on i.inventory_id = r.inventory_id	
order by r.customer_id, i.film_id;

select r1.customer_id as "Customer A", r2.customer_id as "Customer B", i1.film_id, count(distinct r1.rental_id) as "count"
from rental r1
join inventory i1 on i1.inventory_id = r1.inventory_id	
join inventory i2 on i1.film_id = i2.film_id	
join rental r2 on r2.inventory_id = i2.inventory_id and r1.customer_id < r2.customer_id
group by i1.film_id
order by r1.customer_id, r2.customer_id;


-- Get all possible pairs of actors and films.
select title, conat(first_name, " ", last_name) from film
cross join actor

