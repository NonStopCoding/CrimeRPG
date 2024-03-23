CREATE TABLE IF NOT EXISTS `items` (
	id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(75) NOT NULL,
	description TEXT NOT NULL,
	cost int(11) NOT NULL	
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `locations` (
	id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(75) NOT NULL,
	description TEXT NOT NULL,
	cost int(11) NOT NULL,
	traveltime int(11) NOT NULL DEFAULT 0
) ENGINE = INNODB;

INSERT INTO `locations` (id, name, description, cost, traveltime) VALUES (1, 'Dump', 'This is the starting location', 0, 0);

CREATE TABLE IF NOT EXISTS `attacklogs` (
	id bigint(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userid int(11) NOT NULL,
	page TEXT NOT NULL,
	iplogged varchar(255) NOT NULL,
	ip2logged varchar(255) NOT NULL,
	textlogged TEXT NOT NULL,
	checked ENUM('yes', 'no') NOT NULL DEFAULT 'no'
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `mainlogs` (
	id bigint(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userid int(11) NOT NULL,
	page TEXT NOT NULL,
	iplogged varchar(255) NOT NULL,
	ip2logged varchar(255) NOT NULL,
	textlogged TEXT NOT NULL,
	checked ENUM('yes', 'no') NOT NULL DEFAULT 'no'
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `moneylogs` (
	id bigint(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userid int(11) NOT NULL,
	page TEXT NOT NULL,
	iplogged varchar(255) NOT NULL,
	textlogged TEXT NOT NULL,
	checked ENUM('yes', 'no') NOT NULL DEFAULT 'no'
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `pointslogs` (
	id bigint(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userid int(11) NOT NULL,
	page TEXT NOT NULL,
	iplogged varchar(255) NOT NULL,
	ip2logged varchar(255) NOT NULL,
	textlogged TEXT NOT NULL,
	checked ENUM('yes', 'no') NOT NULL DEFAULT 'no'
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `transactionslogs` (
	id bigint(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userid int(11) NOT NULL,
	page TEXT NOT NULL,
	iplogged varchar(255) NOT NULL,
	ip2logged varchar(255) NOT NULL,
	textlogged TEXT NOT NULL,
	checked ENUM('yes', 'no') NOT NULL DEFAULT 'no'
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `travellogs` (
	id bigint(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userid int(11) NOT NULL,
	page TEXT NOT NULL,
	iplogged varchar(255) NOT NULL,
	ip2logged varchar(255) NOT NULL,
	textlogged TEXT NOT NULL,
	checked ENUM('yes', 'no') NOT NULL DEFAULT 'no'
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `travelcompany` (
	id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	location int(11) NOT NULL,
	cost int(11) NOT NULL,
	traveltime int(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS `members` (
	`usr_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`usr_username` varchar(255) NOT NULL,
	`usr_password` TEXT NOT NULL,
	`usr_email` TEXT NOT NULL,
	`usr_money` int(11) NOT NULL DEFAULT 250,
	`usr_points` int(11) NOT NULL DEFAULT 0,
	`usr_level` int(11) NOT NULL DEFAULT 1,
	`usr_energy` int(11) NOT NULL DEFAULT 100,
	`usr_maxenergy` int(11) NOT NULL DEFAULT 100,
	`usr_nerve` int(11) NOT NULL DEFAULT 5,
	`usr_maxnerve` int(11) NOT NULL DEFAULT 5,
	`usr_awake` int(11) NOT NULL DEFAULT 100,
	`usr_maxawake` int(11) NOT NULL DEFAULT 100,
	`usr_health` int(11) NOT NULL DEFAULT 50,
	`usr_maxhealth` int(11) NOT NULL DEFAULT 50,
	`usr_crimexp` DECIMAL(11, 3) NOT NULL DEFAULT '0.00',
	`usr_levelxp` DECIMAL(11, 3) NOT NULL DEFAULT '0.00',
	`usr_jail` int(11) NOT NULL DEFAULT 0,
	`usr_hospital` int(11) NOT NULL DEFAULT 0,
	`usr_registerip` varchar(255) NOT NULL,
	`usr_registerip2` varchar(255) NOT NULL,
	`usr_loginip` varchar(255) NOT NULL,
	`usr_loginip2` varchar(255) NOT NULL,
	`usr_verified` enum('yes', 'no') NOT NULL DEFAULT 'no'
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `members_stats` (
	id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	strength FLOAT(11) NOT NULL DEFAULT 10,
	defense FLOAT(11) NOT NULL DEFAULT 10,
	speed FLOAT(11) NOT NULL DEFAULT 10,
	dodge FLOAT(11) NOT NULL DEFAULT 10
) ENGINE = INNODB;