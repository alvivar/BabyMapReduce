
drop table if exists bases2.barcelona_cleanliness;
create table bases2.barcelona_cleanliness as
select review_scores_cleanliness, count(id) as id_count
from bases2.barcelona_listings
group by review_scores_cleanliness
order by id_count;

drop table if exists bases2.cape_town_cleanliness;
create table bases2.cape_town_cleanliness as
select review_scores_cleanliness, count(id) as id_count
from bases2.cape_town_listings
group by review_scores_cleanliness
order by id_count;

drop table if exists bases2.montreal_cleanliness;
create table bases2.montreal_cleanliness as
select review_scores_cleanliness, count(id) as id_count
from bases2.montreal_listings
group by review_scores_cleanliness
order by id_count;


-- Barcelona

select review_scores_cleanliness, count(id) as idCount
from bases2.barcelona_listings
group by review_scores_cleanliness
order by idCount;


select
    score, idCount,
    case
        when cast(score as float) <= 3.34 then 1
        when cast(score as float) > 3.34 and cast(score as float) < 6.68 then 2
        when cast(score as float) >= 6.68 then 3
    end as scorestack
from (
    select review_scores_cleanliness as score, count(id) as idCount
    from bases2.barcelona_listings
    group by review_scores_cleanliness
) t;


-- Cape Town

select review_scores_cleanliness, count(id) as idCount
from bases2.cape_town_listings
group by review_scores_cleanliness
order by idCount;


select
    score, idCount,
    case
        when cast(score as float) <= 3.34 then 1
        when cast(score as float) > 3.34 and cast(score as float) < 6.68 then 2
        when cast(score as float) >= 6.68 then 3
    end as scorestack
from (
    select review_scores_cleanliness as score, count(id) as idCount
    from bases2.cape_town_listings
    group by review_scores_cleanliness
) t;


-- Montreal

drop table if exists bases2.montreal_cleanliness;
create table bases2.montreal_cleanliness as
select review_scores_cleanliness, count(id) as id_count
from bases2.montreal_listings
group by review_scores_cleanliness
order by id_count;


select review_scores_cleanliness, count(id) as idCount
from bases2.montreal_listings
group by review_scores_cleanliness
order by idCount;


select
    score, idCount,
    case
        when cast(score as float) <= 3.34 then 1
        when cast(score as float) > 3.34 and cast(score as float) < 6.68 then 2
        when cast(score as float) >= 6.68 then 3
    end as scorestack
from (
    select review_scores_cleanliness as score, count(id) as idCount
    from bases2.barcelona_listings
    group by review_scores_cleanliness
) t;
