CREATE TABLE IF NOT EXISTS `infosecfeeds`.`feeds` (
  `idfeeds` INT NOT NULL,
  `channel_description` VARCHAR(255) NOT NULL,
  `channel_title` VARCHAR(45) NOT NULL,
  `channel_link` VARCHAR(45) NOT NULL,
  `item_title` VARCHAR(255) NOT NULL,
  `item_link` VARCHAR(75) NOT NULL,
  `item_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfeeds`),
  UNIQUE INDEX `idfeeds_UNIQUE` (`idfeeds` ASC))
ENGINE = InnoDB
COMMENT = 'Contains all data for all feeds.'