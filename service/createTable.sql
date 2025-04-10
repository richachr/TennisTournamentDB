CREATE TABLE IF NOT EXISTS `tournament` (
	`team_id` INTEGER NOT NULL,
	`player_id` TEXT NOT NULL,
	`wins` INTEGER NOT NULL DEFAULT '0',
	`losses` INTEGER NOT NULL DEFAULT '0',
	`rank` INTEGER NOT NULL,
	`arrival_time` REAL,
FOREIGN KEY(`team_id`) REFERENCES `team`(`team_id`),
FOREIGN KEY(`player_id`) REFERENCES `player`(`player_id`)
);
CREATE TABLE IF NOT EXISTS `team` (
	`team_id` integer primary key NOT NULL UNIQUE,
	`name` TEXT NOT NULL,
	`coach` TEXT
);
CREATE TABLE IF NOT EXISTS `player` (
	`player_id` integer primary key NOT NULL UNIQUE,
	`name` TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS `match` (
	`id` integer primary key NOT NULL UNIQUE,
	`player1` INTEGER NOT NULL,
	`player2` INTEGER NOT NULL,
	`winner` TEXT,
	`score` TEXT NOT NULL,
	`start_time` REAL NOT NULL,
	`end_time` REAL NOT NULL,
FOREIGN KEY(`player1`) REFERENCES `player`(`player_id`),
FOREIGN KEY(`player2`) REFERENCES `player`(`player_id`),
FOREIGN KEY(`winner`) REFERENCES `player`(`player_id`)
);
CREATE TABLE IF NOT EXISTS `point` (
	`match_id` integer primary key NOT NULL UNIQUE,
	`point_id` integer primary key NOT NULL,
	`server` INTEGER NOT NULL,
	`winner` INTEGER NOT NULL,
FOREIGN KEY(`match_id`) REFERENCES `match`(`id`),
FOREIGN KEY(`server`) REFERENCES `player`(`player_id`),
FOREIGN KEY(`winner`) REFERENCES `player`(`player_id`)
);