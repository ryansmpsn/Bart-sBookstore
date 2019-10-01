

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bookstore
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bookstore
-- -----------------------------------------------------
drop database if exists `BookStore`;
create database `BookStore`;
use BookStore;

-- -----------------------------------------------------
-- Table `bookstore`.`ar_internal_metadata`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`ar_internal_metadata` (
  `key` VARCHAR(255) NOT NULL,
  `value` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`authors` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(200) NULL DEFAULT NULL,
  `last_name` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`books` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NULL DEFAULT NULL,
  `pages` DECIMAL(5,0) NULL DEFAULT NULL,
  `price` DECIMAL(6,2) NULL DEFAULT NULL,
  `stock` int(11),
  `cover_file_name` VARCHAR(255) NULL DEFAULT NULL,
  `cover_content_type` VARCHAR(255) NULL DEFAULT NULL,
  `cover_file_size` INT(11) NULL DEFAULT NULL,
  `cover_updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`authors_books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`authors_books` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `book_id` INT(11) NOT NULL,
  `author_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rails_d4a76af72d` (`author_id` ASC),
  INDEX `fk_rails_f7acfea2b6` (`book_id` ASC),
  CONSTRAINT `fk_rails_d4a76af72d`
    FOREIGN KEY (`author_id`)
    REFERENCES `bookstore`.`authors` (`id`),
  CONSTRAINT `fk_rails_f7acfea2b6`
    FOREIGN KEY (`book_id`)
    REFERENCES `bookstore`.`books` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`books_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`books_categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `book_id` INT(11) NOT NULL,
  `category_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rails_426cc1dbb3` (`category_id` ASC),
  INDEX `fk_rails_4b64804a3a` (`book_id` ASC),
  CONSTRAINT `fk_rails_426cc1dbb3`
    FOREIGN KEY (`category_id`)
    REFERENCES `bookstore`.`categories` (`id`),
  CONSTRAINT `fk_rails_4b64804a3a`
    FOREIGN KEY (`book_id`)
    REFERENCES `bookstore`.`books` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`publishers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`publishers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`books_publishers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`books_publishers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `book_id` INT(11) NOT NULL,
  `publisher_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rails_b999b39377` (`publisher_id` ASC),
  INDEX `fk_rails_5aa5e98203` (`book_id` ASC),
  CONSTRAINT `fk_rails_5aa5e98203`
    FOREIGN KEY (`book_id`)
    REFERENCES `bookstore`.`books` (`id`),
  CONSTRAINT `fk_rails_b999b39377`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `bookstore`.`publishers` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`users` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL DEFAULT '',
  `encrypted_password` VARCHAR(255) NOT NULL DEFAULT '',
  `reset_password_token` VARCHAR(255) NULL DEFAULT NULL,
  `reset_password_sent_at` DATETIME NULL DEFAULT NULL,
  `remember_created_at` DATETIME NULL DEFAULT NULL,
  `sign_in_count` INT(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` DATETIME NULL DEFAULT NULL,
  `last_sign_in_at` DATETIME NULL DEFAULT NULL,
  `current_sign_in_ip` VARCHAR(255) NULL DEFAULT NULL,
  `last_sign_in_ip` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `admin` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `index_users_on_email` (`email` ASC),
  UNIQUE INDEX `index_users_on_reset_password_token` (`reset_password_token` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`orders` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `orderDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`invoices` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL,
  `order_id` INT(11) NOT NULL,
  `invoiceDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rails_4fa42a6dca` (`order_id` ASC),
  INDEX `fk_rails_3d1522a0d8` (`user_id` ASC),
  CONSTRAINT `fk_rails_3d1522a0d8`
    FOREIGN KEY (`user_id`)
    REFERENCES `bookstore`.`users` (`id`),
  CONSTRAINT `fk_rails_4fa42a6dca`
    FOREIGN KEY (`order_id`)
    REFERENCES `bookstore`.`orders` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`order_items` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `book_id` INT(11) NOT NULL,
  `order_id` INT(11) NOT NULL,
  `bookQuantity` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rails_24eeff6b07` (`book_id` ASC),
  INDEX `fk_rails_e3cb28f071` (`order_id` ASC),
  CONSTRAINT `fk_rails_24eeff6b07`
    FOREIGN KEY (`book_id`)
    REFERENCES `bookstore`.`books` (`id`),
  CONSTRAINT `fk_rails_e3cb28f071`
    FOREIGN KEY (`order_id`)
    REFERENCES `bookstore`.`orders` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bookstore`.`schema_migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`schema_migrations` (
  `version` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`version`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into publishers (`name`) values('publisher1');
insert into publishers (`name`) values('publisher2');
insert into publishers (`name`) values('publisher3');
insert into publishers (`name`) values('publisher4');
insert into publishers (`name`) values('publisher5');

insert into books values(null, 'The Fellowship of the Ring', 500, 30.23, 100, 'Lotr1.jpg', 'image/jpeg',	40220, '2017-12-04 04:39:21');
insert into books values(null, 'The Two Towers', 400, 30.23, 100, 'Lotr2.jpg', 'image/jpeg',	129066,	'2017-12-04 04:38:53');
insert into books values(null, 'Return of the King', 543, 35.23, 100, 'Lotr3.jpg', 'image/jpeg', 109733, '2017-12-04 04:38:30');
insert into books values(null, 'The Chamber of Secrets', 300, 25.99, 100, 'Chamber.jpg',	'image/jpeg', 49670,'2017-12-04 04:38:10');
insert into books values(null, 'Goblet of Fire', 200, 25.99, 100, 'Goblet.jpg', 'image/jpeg', 25344,	'2017-12-04 04:37:54');
insert into books values(null, 'Good Omens', 200, 25.99, 100, 'GoodOmens.jpg', 'image/jpeg', 92632, '2017-12-04 04:36:00');

insert into categories (`name`) values('Action');
insert into categories (`name`) values('Fantasy');
insert into categories (`name`) values('Comedy');
insert into categories (`name`) values('Sci-Fi');
insert into categories (`name`) values('Fiction');

insert into authors (first_name, last_name) values('JRR', 'Tolkien');
insert into authors (first_name, last_name) values('J.K.', 'Rowling');
insert into authors (first_name, last_name) values('John', 'Steinbeck');
insert into authors (first_name, last_name) values('Terry', 'Pratchett');
insert into authors (first_name, last_name) values('Neil', 'Gaiman');

insert into authors_books (book_id, author_id) values(1, 1);
insert into authors_books (book_id, author_id) values(2, 1);
insert into authors_books (book_id, author_id) values(3, 1);
insert into authors_books (book_id, author_id) values(4, 2);
insert into authors_books (book_id, author_id) values(5, 2);
insert into authors_books (book_id, author_id) values(6, 4);
insert into authors_books (book_id, author_id) values(6, 5);

insert into books_categories (book_id, category_id) values(1,5);
insert into books_categories (book_id, category_id) values(1,2);
insert into books_categories (book_id, category_id) values(2,5);
insert into books_categories (book_id, category_id) values(3,5);
insert into books_categories (book_id, category_id) values(4,5);
insert into books_categories (book_id, category_id) values(5,5);
insert into books_categories (book_id, category_id) values(6,5);

insert into books_publishers (book_id, publisher_id) values(1,1);
insert into books_publishers (book_id, publisher_id) values(1,2);
insert into books_publishers (book_id, publisher_id) values(2,2);
insert into books_publishers (book_id, publisher_id) values(3,3);
insert into books_publishers (book_id, publisher_id) values(4,4);
insert into books_publishers (book_id, publisher_id) values(5,5);
insert into books_publishers (book_id, publisher_id) values(6,5);

delimiter //
drop trigger if exists `updateStock`//
create trigger `updateStock` after insert on invoices
for each row
    begin
    
    
    set @strIDS = (SELECT group_concat(order_items.id) AS order_items_list from order_items
        join orders on order_items.order_id = orders.id
        join invoices on invoices.order_id = orders.id
        where invoices.id = new.id
        group by invoices.id);
    
    IF @strIDs IS NULL THEN
    SET @strIDs = '';
  END IF;

do_this:
  LOOP
    SET @strLen = CHAR_LENGTH(@strIDs);
	update books 
        set books.stock = books.stock -  (select order_items.bookQuantity from order_items
        where order_items.id = substring_index(@strIDS, ',', 1))
        
        where books.id = (select id from (select books.id from books
        join order_items on order_items.book_id = books.id
        where order_items.id = substring_index(@strIDS, ',', 1)) as booksSub);
    #UPDATE TestTable SET status = 'C' WHERE Id = SUBSTRING_INDEX(strIDs, ',', 1);
		SET @SubStrLen = CHAR_LENGTH(SUBSTRING_INDEX(@strIDs, ',', 1)) + 2;
		SET @strIDs = MID(@strIDs, @SubStrLen, @strLen);

		IF @strIDs = '' THEN
			LEAVE do_this;
		END IF;
	END LOOP do_this;
end//

drop trigger if exists `checkStock`//

create trigger `checkStock` before update on books
for each row
    begin
		if new.stock < 20 then
			set new.stock = 50;
		end if;
    end//
    
drop procedure if exists `proc_InsertOrderItem`//
CREATE PROCEDURE `proc_InsertOrderItem`(
	in bookID int(11),
    in orderID int(11),
    in quantity int(11)
)
begin
    if not exists (select * from order_items where book_id = bookID and order_id = orderID limit 1) then
		insert into order_items (order_id, book_id, bookQuantity)
        values (bookID, orderID, quantity);
	else
		update order_items
        set bookQuantity = bookQuantity + quantity
        where book_id = bookID and order_id = orderID;
	end if;
end//
delimiter ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
