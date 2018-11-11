CREATE DATABASE IF NOT EXISTS `bases2`;

DROP TABLE IF EXISTS `bases2`.`HouseConfiguration`;

CREATE TABLE IF NOT EXISTS `bases2`.`HouseConfiguration` (
  `idHouseConfiguration` VARCHAR(250) NULL,
  `PropertyType` VARCHAR(250) NULL,
  `RoomType` VARCHAR(250) NULL,
  `AccommodatesCount` VARCHAR(250) NULL,
  `BathromsCount` VARCHAR(250) NULL,
  `BedroomsCount` VARCHAR(250) NULL,
  `BedsCount` VARCHAR(250) NULL,
  `BedType` VARCHAR(250) NULL,
  `Amenities` VARCHAR(1000) NULL,
  `SquareFeet` VARCHAR(250) NULL);
