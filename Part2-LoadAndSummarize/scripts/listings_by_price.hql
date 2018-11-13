
drop table if exists bases2.barcelona_pricing;
create table bases2.barcelona_pricing as
select price, count(id) as id_count
from bases2.barcelona_listings
group by price
order by id_count;

drop table if exists bases2.cape_town_pricing;
create table bases2.cape_town_pricing as
select price, count(id) as id_count
from bases2.cape_town_listings
group by price
order by id_count;

drop table if exists bases2.montreal_pricing;
create table bases2.montreal_pricing as
select price, count(id) as id_count
from bases2.montreal_listings
group by price
order by id_count;


-- Barcelona

select price, count(id) as idCount
from bases2.barcelona_listings
group by price
order by idCount;

select price, count(id) as idCount
from bases2.barcelona_listings
group by price
order by cast(price as float) desc;

select
    avg(cast(price as float)) as avg_price,
    max(cast(price as float)) as max_price,
    min(cast(price as float)) as min_price
from (
    select price
    from bases2.barcelona_listings
) t;

select
    id, price,
    case
        when cast(price as float) < 113 then 1
        when cast(price as float) > 113 and cast(price as float) < 20000/2 then 2
        when cast(price as float) > 20000/2 then 3
    end as pricestack
from bases2.barcelona_listings
order by cast(price as float);


-- Cape Town




select price, count(id) as idCount
from bases2.cape_town_listings
group by price
order by idCount;

select
    avg(cast(price as float)) as avg_price,
    max(cast(price as float)) as max_price,
    min(cast(price as float)) as min_price
from (
    select price
    from bases2.cape_town_listings
) t;


-- Montreal

select price, count(id) as idCount
from bases2.montreal_listings
group by price
order by idCount;

select
    avg(cast(price as float)) as avg_price,
    max(cast(price as float)) as max_price,
    min(cast(price as float)) as min_price
from (
    select price
    from bases2.montreal_listings
) t;
