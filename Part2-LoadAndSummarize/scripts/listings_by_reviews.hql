
select number_of_reviews, count(id) as idCount
from bases2.barcelona_listings
group by number_of_reviews
order by cast(number_of_reviews as int);


select number_of_reviews, count(id) as idCount
from bases2.cape_town_listings
group by number_of_reviews
order by cast(number_of_reviews as int);


select number_of_reviews, count(id) as idCount
from bases2.montreal_listings
group by number_of_reviews
order by cast(number_of_reviews as int);
