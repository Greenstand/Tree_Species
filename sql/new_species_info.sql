-- Suggested schema for new species management. See https://github.com/Greenstand/treetracker-decisions/blob/main/0012-species-data.md

-- dummy tables
-- CREATE TABLE `trees` (`id` INT(11) NOT NULL PRIMARY KEY);
-- CREATE TABLE `admin_user` (`id` INT(11) NOT NULL PRIMARY KEY);
-- CREATE TABLE `entity` (`id` INT(11) NOT NULL PRIMARY KEY);
-- CREATE TABLE `tree_species` (`id` INT(11) NOT NULL PRIMARY KEY);

CREATE TABLE `localname` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `org_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `localname` VARCHAR(100) NOT NULL
     COMMENT 'the local language name used by an org for a species',
  `sciname` VARCHAR(100) NULL
     COMMENT 'scientific name, if known',
  `timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `org` (`org_id`),
  KEY `user` (`user_id`),
  UNIQUE KEY `org_x_localname` (`org_id`, `localname`),
  CONSTRAINT `fk_ln_org` FOREIGN KEY (`org_id`) REFERENCES `entity` (`id`),
  CONSTRAINT `fk_ln_user` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`id`)
);

CREATE TABLE `det` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tree_id` INT(11) NOT NULL,
  `localname_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tree` (`tree_id`),
  KEY `localname` (`localname_id`),
  KEY `user` (`user_id`),
  CONSTRAINT `fk_det_tree` FOREIGN KEY (`tree_id`) REFERENCES `trees` (`id`),
  CONSTRAINT `fk_det_ln` FOREIGN KEY (`localname_id`)
    REFERENCES `localname` (`id`),
  CONSTRAINT `fk_det_user` FOREIGN KEY (`user_id`)
    REFERENCES `admin_user` (`id`)
);

CREATE TABLE `taxonmap` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `localname_id` INT(11) NOT NULL,
  `species_id` INT(11) NOT NULL,
  `confidence` ENUM('low','medium','high') NOT NULL DEFAULT 'medium'
     COMMENT 'confidence of the botanist in mapping a local to global taxon',
  `notes` VARCHAR(1000) NULL
     COMMENT 'any notes about the mapping',
  `timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `localname` (`localname_id`),
  KEY `species` (`species_id`),
  CONSTRAINT `fk_tm_localname` FOREIGN KEY (`localname_id`)
    REFERENCES `localname` (`id`),
  CONSTRAINT `fk_tm_species` FOREIGN KEY (`species_id`)
    REFERENCES `tree_species` (`id`)
);

