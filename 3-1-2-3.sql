CREATE TABLE `promotion_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `evaluator1` varchar(30) NOT NULL,
  `evaluator2` varchar(30) NOT NULL,
  `employee` varchar(30) NOT NULL,
  `job` int(10) NOT NULL,
  `status` enum('completed') NOT NULL,
  `grade` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_promotion_history_evaluator1` FOREIGN KEY (`evaluator1`) REFERENCES `evaluator` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_promotion_history_evaluator2` FOREIGN KEY (`evaluator2`) REFERENCES `evaluator` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_promotion_history_employee` FOREIGN KEY (`employee`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_promotion_history_job` FOREIGN KEY (`job`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

