SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `ads-board2`
--
CREATE DATABASE IF NOT EXISTS `ads-board2`;
USE `ads-board2`;
-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id`          BIGINT       NOT NULL AUTO_INCREMENT,
  `login`       VARCHAR(32)  NOT NULL,
  `email`       VARCHAR(255) NOT NULL,
  `password`    VARCHAR(64)  NOT NULL,
  `confrimDate` DATETIME,
  `statusId`    BIGINT       NOT NULL,
  `roleId`      BIGINT       NOT NULL,
  `hash`        VARCHAR(64)           DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`, `email`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =1;

CREATE TABLE IF NOT EXISTS `statuses` (
  `id`   BIGINT      NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =1;

CREATE TABLE IF NOT EXISTS `roles` (
  `id`   BIGINT      NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =1;

CREATE TABLE IF NOT EXISTS `profiles` (
  `id`        BIGINT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(32),
  `lastname`  VARCHAR(32),
  `birthdate` DATETIME,
  `phone`     VARCHAR(32),
  `skype`     VARCHAR(16),
  `userId`    BIGINT NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =1;

CREATE TABLE IF NOT EXISTS `advertisements` (
  `id`           BIGINT       NOT NULL AUTO_INCREMENT,
  `subject`      VARCHAR(256) NOT NULL,
  `description`  VARCHAR(256),
  `price`        DECIMAL      NOT NULL,
  `creationDate` DATETIME     NOT NULL,
  `categoryId`   BIGINT,
  `userId`       BIGINT       NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =1;

CREATE TABLE IF NOT EXISTS `payments` (
  `id`          BIGINT       NOT NULL AUTO_INCREMENT,
  `paymentType` VARCHAR(128) NOT NULL,
  `endDate`     DATETIME,
  `price`       DECIMAL      NOT NULL,
  `planId`      BIGINT       NOT NULL,
  `userId`      BIGINT       NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =1;

CREATE TABLE IF NOT EXISTS `categories` (
  `id`          BIGINT       NOT NULL AUTO_INCREMENT,
  `title`       VARCHAR(128) NOT NULL,
  `description` VARCHAR(256),
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =1;

CREATE TABLE IF NOT EXISTS `advertisementsImages` (
  `id`              BIGINT       NOT NULL AUTO_INCREMENT,
  `imageName`       VARCHAR(256) NOT NULL,
  `advertisementId` BIGINT,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =1;

CREATE TABLE IF NOT EXISTS `plans` (
  `id`    BIGINT       NOT NULL AUTO_INCREMENT,
  `name`  VARCHAR(128) NOT NULL,
  `price` DECIMAL      NOT NULL,
  `term`  VARCHAR(32)  NOT NULL,
  `posts` INT          NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =1;

CREATE TABLE IF NOT EXISTS `confirmationLinks` (
  `id`     BIGINT NOT NULL AUTO_INCREMENT,
  `link`   VARCHAR(128),
  `userId` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =1;

ALTER TABLE `profiles` ADD CONSTRAINT `fk_profiles_users` FOREIGN KEY (userId) REFERENCES users (id);
ALTER TABLE `advertisements` ADD CONSTRAINT `fk_advertisements_users` FOREIGN KEY (userId) REFERENCES users (id);
ALTER TABLE `advertisements` ADD CONSTRAINT `fk_advertisements_categories` FOREIGN KEY (categoryId) REFERENCES categories (id);
ALTER TABLE `payments` ADD CONSTRAINT `fk_payments_users` FOREIGN KEY (userId) REFERENCES users (id);
ALTER TABLE `payments` ADD CONSTRAINT `fk_payments_plans` FOREIGN KEY (planId) REFERENCES plans (id);
ALTER TABLE `advertisementsImages` ADD CONSTRAINT `fk_adsImages_ads` FOREIGN KEY (advertisementId) REFERENCES advertisements (id)
  ON DELETE CASCADE;
ALTER TABLE `users` ADD CONSTRAINT `fk_users_statuses` FOREIGN KEY (statusId) REFERENCES statuses (id);
ALTER TABLE `users` ADD CONSTRAINT `fk_users_roles` FOREIGN KEY (roleId) REFERENCES roles (id);
ALTER TABLE `confirmationLinks` ADD CONSTRAINT `fk_confLinks_users` FOREIGN KEY (userId) REFERENCES users (id);


INSERT INTO `roles` (`name`) VALUES
  ('admin'),
  ('user');

INSERT INTO `statuses` (`name`) VALUES
  ('unconfirmed'),
  ('registered'),
  ('banned');

INSERT INTO `users` (`login`, `email`, `password`, `confrimDate`, `statusId`, `roleId`, `hash`) VALUES
  ('Vasya', 'vasya@gmail.com', '$2y$10$ppdxfhYHhdnvAeti02XQOep8YrvlucbZnlpIyA36/gQUB2ocyYIRm', '0000-00-00 00:00:00', 1,
   2, NULL),
  ('Vova', 'vova@gmail.com', '$2y$10$ppdxfhYHhdnvAeti02XQOep8YrvlucbZnlpIyA36/gQUB2ocyYIRm', '0000-00-00 00:00:00', 1,
   1, NULL),
  ('Kolya', 'kolya@gmail.com', '$2y$10$ppdxfhYHhdnvAeti02XQOep8YrvlucbZnlpIyA36/gQUB2ocyYIRm', '0000-00-00 00:00:00', 2,
   2, NULL);

INSERT INTO `categories` (`title`, `description`) VALUES
  ('Automobiles', 'Description'),
  ('Toys', 'Description'),
  ('Furniture', 'Description');

INSERT INTO `confirmationLinks` (`link`, `userId`) VALUES
  ('somelink', 1),
  ('somelink', 2),
  ('somelink', 3);

# INSERT INTO `profiles` ( `firstname`, `lastname`, `birthdate`, `phone`, `skype`, `userId`,) VALUES
#   ('vasya','ivanov,','0000-00-00 00:00:00','123456',null,1);


/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
