
CREATE DATABASE IF NOT EXISTS `bases2`;


CREATE TABLE IF NOT EXISTS `bases2`.`Listing_Facts` (
  `id` INT NULL,
  `City_id` INT NULL,
  `HouseConfiguration_id` INT NULL,
  INDEX `fk_Listing_City_idx` (`City_id` ASC),
  INDEX `fk_Listing_HouseConfiguration1_idx` (`HouseConfiguration_id` ASC),
  CONSTRAINT `fk_Listing_City`
    FOREIGN KEY (`City_id`)
    REFERENCES `bases2`.`City_Dimension` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Listing_HouseConfiguration1`
    FOREIGN KEY (`HouseConfiguration_id`)
    REFERENCES `bases2`.`HouseConfiguration_Dimension` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `bases2`.`HouseConfiguration`;

CREATE TABLE IF NOT EXISTS `bases2`.`HouseConfiguration` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `propertyType` VARCHAR(250) NULL,
  `roomType` VARCHAR(250) NULL,
  `accommodatesCount` INT NULL,
  `bathromsCount` INT NULL,
  `bedroomsCount` INT NULL,
  `bedsCount` INT NULL,
  `bedType` VARCHAR(250) NULL,
  `amenities` VARCHAR(1000) NULL,
  `squareFeet` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `bases2`.`Weather`;

CREATE TABLE IF NOT EXISTS `bases2`.`Weather` (
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
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
