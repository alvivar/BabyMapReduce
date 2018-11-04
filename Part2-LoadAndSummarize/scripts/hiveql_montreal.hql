
CREATE DATABASE IF NOT EXISTS bases2;

DROP TABLE IF EXISTS bases2.montreal_listings;

CREATE EXTERNAL TABLE IF NOT EXISTS bases2.montreal_listings
(
    id STRING,
    listing_url STRING,
    scrape_id STRING,
    last_scraped STRING,
    name STRING,
    summary STRING,
    space STRING,
    description STRING,
    experiences_offered STRING,
    neighborhood_overview STRING,
    notes STRING,
    transit STRING,
    access STRING,
    interaction STRING,
    house_rules STRING,
    thumbnail_url STRING,
    medium_url STRING,
    picture_url STRING,
    xl_picture_url STRING,
    host_id STRING,
    host_url STRING,
    host_name STRING,
    host_since STRING,
    host_location STRING,
    host_about STRING,
    host_response_time STRING,
    host_response_rate STRING,
    host_acceptance_rate STRING,
    host_is_superhost STRING,
    host_thumbnail_url STRING,
    host_picture_url STRING,
    host_neighbourhood STRING,
    host_listings_count STRING,
    host_total_listings_count STRING,
    host_verifications STRING,
    host_has_profile_pic STRING,
    host_identity_verified STRING,
    street STRING,
    neighbourhood STRING,
    neighbourhood_cleansed STRING,
    neighbourhood_group_cleansed STRING,
    city STRING,
    state STRING,
    zipcode STRING,
    market STRING,
    smart_location STRING,
    country_code STRING,
    country STRING,
    latitude STRING,
    longitude STRING,
    is_location_exact STRING,
    property_type STRING,
    room_type STRING,
    accommodates STRING,
    bathrooms STRING,
    bedrooms STRING,
    beds STRING,
    bed_type STRING,
    amenities STRING,
    square_feet STRING,
    price DECIMAL(18, 8),
    weekly_price DECIMAL(18, 8),
    monthly_price DECIMAL(18, 8),
    security_deposit STRING,
    cleaning_fee STRING,
    guests_included STRING,
    extra_people STRING,
    minimum_nights STRING,
    maximum_nights STRING,
    calendar_updated STRING,
    has_availability STRING,
    availability_30 STRING,
    availability_60 STRING,
    availability_90 STRING,
    availability_365 STRING,
    calendar_last_scraped STRING,
    number_of_reviews STRING,
    first_review STRING,
    last_review STRING,
    review_scores_rating STRING,
    review_scores_accuracy STRING,
    review_scores_cleanliness STRING,
    review_scores_checkin STRING,
    review_scores_communication STRING,
    review_scores_location STRING,
    review_scores_value STRING,
    requires_license STRING,
    license STRING,
    jurisdiction_names STRING,
    instant_bookable STRING,
    is_business_travel_ready STRING,
    cancellation_policy STRING,
    require_guest_profile_picture STRING,
    require_guest_phone_verification STRING,
    calculated_host_listings_count STRING,
    reviews_per_month STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\n"
)
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/DEV/BigData-BI/Part2-LoadAndSummarize/data/clean_Montreal_Quebec_Canada_listings.csv' OVERWRITE INTO TABLE bases2.montreal_listings;


DROP TABLE IF EXISTS bases2.montreal_calendar;

CREATE EXTERNAL TABLE IF NOT EXISTS bases2.montreal_calendar
(
    listing_id STRING,
    date STRING,
    available STRING,
    price DECIMAL(18, 8)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\n"
)
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/DEV/BigData-BI/Part2-LoadAndSummarize/data/clean_Montreal_Quebec_Canada_calendar.csv' OVERWRITE INTO TABLE bases2.montreal_calendar;
