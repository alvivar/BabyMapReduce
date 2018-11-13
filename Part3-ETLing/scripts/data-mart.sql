
CREATE DATABASE IF NOT EXISTS `bases2`;


DROP TABLE IF EXISTS `bases2`.`City_Fact`;
CREATE TABLE IF NOT EXISTS `bases2`.`City_Fact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `listingId` INT NULL,
  `climateId` INT NULL,
  `bookingListingId` INT NULL,
  `cleaningRankingId` INT NULL,
  `pricingRankingId` INT NULL,
  `reviewRankingId` INT NULL,
  `name` VARCHAR(250) NULL,
  PRIMARY KEY (`id`));


DROP TABLE IF EXISTS `bases2`.`Cleaning_Ranking_Dimension`;
CREATE TABLE IF NOT EXISTS `bases2`.`Cleaning_Ranking_Dimension` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `score` INT NULL,
  `count` INT NULL,
  PRIMARY KEY (`id`));


DROP TABLE IF EXISTS `bases2`.`Pricing_Ranking_Dimension`;
CREATE TABLE IF NOT EXISTS `bases2`.`Pricing_Ranking_Dimension` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` FLOAT NULL,
  `count` INT NULL,
  PRIMARY KEY (`id`));


DROP TABLE IF EXISTS `bases2`.`Review_Dimension`;
CREATE TABLE IF NOT EXISTS `bases2`.`Review_Dimension` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numberOfReviews` INT NULL,
  `scoreRating` INT NULL,
  `scoreAccuracy` INT NULL,
  `scoreCleanliness` INT NULL,
  `scoreCheckin` INT NULL,
  `scoreCommunication` INT NULL,
  `scoreLocation` INT NULL,
  `scoreValue` INT NULL,
  PRIMARY KEY (`id`));


DROP TABLE IF EXISTS `bases2`.`Climate_Dimension`;
CREATE TABLE IF NOT EXISTS `bases2`.`Climate_Dimension` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cityId` INT NULL,
  `weatherId` INT NULL,
  PRIMARY KEY (`id`));


DROP TABLE IF EXISTS `bases2`.`Weather_Dimension`;
CREATE TABLE IF NOT EXISTS `bases2`.`Weather_Dimension` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `year` INT NULL,
  `month` INT NULL,
  `day` INT NULL,
  `hour` INT NULL,
  `minute` INT NULL,
  `temperatureDailyMean` FLOAT NULL,
  `relativeHumidityDailyMean` FLOAT NULL,
  `meanSeaLevelPressureDailyMean` FLOAT NULL,
  `totalPrecipitationDailySum` FLOAT NULL,
  `snowfallAmountRawDailySum` FLOAT NULL,
  `totalCloudCoverDailyMean` FLOAT NULL,
  `highCloudCoverDailyMean` FLOAT NULL,
  `mediumCloudCoverDailyMean` FLOAT NULL,
  `lowCloudCoverDailyMean` FLOAT NULL,
  `sunshineDurationDailySum` FLOAT NULL,
  `shortwaveRadiationDailySum` FLOAT NULL,
  `windSpeedDailyMean10m` FLOAT NULL,
  `windDirectionDailyMean10m` FLOAT NULL,
  `windSpeedDailyMean80m` FLOAT NULL,
  `windDirectionDailyMean80m` FLOAT NULL,
  `windSpeedDailyMean900mb` FLOAT NULL,
  `windDirectionDailyMean900mb` FLOAT NULL,
  `windGustDailyMean` FLOAT NULL,
  `temperatureDailyMax` FLOAT NULL,
  `temperatureDailyMin` FLOAT NULL,
  `relativeHumidityDailyMax` FLOAT NULL,
  `relativeHumidityDailyMin` FLOAT NULL,
  `meanSeaLevelPressureDailyMax` FLOAT NULL,
  `meanSeaLevelPressureDailyMin` FLOAT NULL,
  `totalCloudCoverDailyMax` FLOAT NULL,
  `totalCloudCoverDailyMin` FLOAT NULL,
  `highCloudCoverDailyMax` FLOAT NULL,
  `highCloudCoverDailyMin` FLOAT NULL,
  `mediumCloudCoverDailyMax` FLOAT NULL,
  `mediumCloudCoverDailyMin` FLOAT NULL,
  `lowCloudCoverDailyMax` FLOAT NULL,
  `lowCloudCoverDailyMin` FLOAT NULL,
  `windSpeedDailyMax10m` FLOAT NULL,
  `windSpeedDailyMin10m` FLOAT NULL,
  `windSpeedDailyMax80m` FLOAT NULL,
  `windSpeedDailyMin80m` FLOAT NULL,
  `windSpeedDailyMax900mb` FLOAT NULL,
  `windSpeedDailyMin900mb` FLOAT NULL,
  `windGustDailyMax` FLOAT NULL,
  `windGustDailyMin` FLOAT NULL,
  PRIMARY KEY (`id`));


DROP TABLE IF EXISTS `bases2`.`Listing_Dimension`;
CREATE TABLE IF NOT EXISTS `bases2`.`Listing_Dimension` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cityId` INT NULL,
  `houseConfigurationId` INT NULL,
  PRIMARY KEY (`id`));


DROP TABLE IF EXISTS `bases2`.`HouseConfiguration_Dimension`;
CREATE TABLE IF NOT EXISTS `bases2`.`HouseConfiguration_Dimension` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hiveListingId` INT NULL,
  `propertyType` VARCHAR(250) NULL,
  `roomType` VARCHAR(250) NULL,
  `accommodatesCount` INT NULL,
  `bathromsCount` INT NULL,
  `bedroomsCount` INT NULL,
  `bedsCount` INT NULL,
  `bedType` VARCHAR(250) NULL,
  `amenities` VARCHAR(1000) NULL,
  `squareFeet` INT NULL,
  `kitchenCount` INT NULL,
  `parkingCount` INT NULL,
  PRIMARY KEY (`id`));


DROP TABLE IF EXISTS `bases2`.`BookingListing_Dimension`;
CREATE TABLE IF NOT EXISTS `bases2`.`BookingListing_Dimension` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cityId` INT NULL,
  `bookingId` INT NULL,
  PRIMARY KEY (`id`));


DROP TABLE IF EXISTS `bases2`.`Booking_Dimension`;
CREATE TABLE IF NOT EXISTS `bases2`.`Booking_Dimension` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hiveListingId` INT NULL,
  `date` DATETIME NULL,
  `available` TINYINT NULL,
  `price` FLOAT NULL,
  PRIMARY KEY (`id`));
