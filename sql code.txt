CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(35) NOT NULL,
  `regDate` datetime NOT NULL,
  PRIMARY KEY (`username`)
);

CREATE TABLE `etairia` (
  `AFM` char(9) NOT NULL,
  `DOY` varchar(30) NOT NULL,
  `name` varchar(35) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `street` varchar(15) NOT NULL,
  `num` int(11) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(15) NOT NULL,
  PRIMARY KEY (`AFM`)
);

CREATE TABLE `employee` (
  `username` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `sistatikes` varchar(35) NOT NULL,
  `certificates` varchar(35) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk_employee_user` FOREIGN KEY `fk_employee_user` (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `evaluator` (
  `username` varchar(30) NOT NULL,
  `firm` char(9) NOT NULL,
  `expYears` tinyint(4) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk_evaluator_firm` FOREIGN KEY `fk_evaluator_firm` (`firm`) REFERENCES `etairia` (`AFM`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_evaluator_user` FOREIGN KEY `fk_evaluator_user` (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `degree` (
  `titlos` varchar(150) NOT NULL,
  `idryma` varchar(150) NOT NULL,
  `bathmida` enum('bsc','msc','phd') NOT NULL,
  PRIMARY KEY (`titlos`, `idryma`)
);

CREATE TABLE `hasDegree` (
  `candUsername` varchar(30) NOT NULL,
  `degrTitle` varchar(150) NOT NULL,
  `degrIdryma` varchar(150) NOT NULL,
  `etos` year(4) NOT NULL,
  `grade` float NOT NULL,
  PRIMARY KEY (`candUsername`, `degrTitle`, `degrIdryma`),
  CONSTRAINT `fk_hasDegree_employee` FOREIGN KEY `fk_hasDegree_employee` (`candUsername`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hasDegree_degree` FOREIGN KEY `fk_hasDegree_degree` (`degrTitle`, `degrIdryma`) REFERENCES `degree` (`titlos`, `idryma`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `job` (
  `id` int(10) NOT NULL,
  `startDate` date NOT NULL,
  `salary` float NOT NULL,
  `position` varchar(60) NOT NULL,
  `edra` varchar(60) NOT NULL,
  `announceDate` datetime NOT NULL,
  `submissionDate` datetime NOT NULL,
  `evaluator` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_job_evaluator` FOREIGN KEY `fk_job_evaluator` (`evaluator`) REFERENCES `evaluator` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `languages` (
  `lang` set('en','fr','sp','ge','ch','gr') NOT NULL,
  `candid` varchar(30) NOT NULL,
  PRIMARY KEY (`lang`, `candid`),
  CONSTRAINT `fk_languages_employee` FOREIGN KEY `fk_languages_employee` (`candid`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `project` (
  `num` tinyint(4) NOT NULL,
  `candid` varchar(30) NOT NULL,
  `descr` text NOT NULL,
  `url` varchar(60) NOT NULL,
  PRIMARY KEY (`num`, `candid`),
  CONSTRAINT `fk_project_employee` FOREIGN KEY `fk_project_employee` (`candid`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `subject` (
  `title` varchar(36) NOT NULL,
  `descr` tinytext NOT NULL,
  `belongsTo` varchar(36) NOT NULL,
  PRIMARY KEY (`title`),
  CONSTRAINT `fk_subject_subject` FOREIGN KEY `fk_subject_subject` (`belongsTo`) REFERENCES `subject` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `requires` (
  `subjectTitle` varchar(36) NOT NULL,
  `jobId` int(10) NOT NULL,
  PRIMARY KEY (`subjectTitle`, `jobId`),
  CONSTRAINT `fk_requires_subject` FOREIGN KEY `fk_requires_subject` (`subjectTitle`) REFERENCES `subject` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_requires_job` FOREIGN KEY `fk_requires_job` (`jobId`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `applies` (
  `candUsername` varchar(30) NOT NULL,
  `jobID` int(10) NOT NULL,
  PRIMARY KEY (`candUsername`, `jobID`),
  CONSTRAINT `fk_applies_employee` FOREIGN KEY `fk_applies_employee` (`candUsername`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_applies_job` FOREIGN KEY `fk_applies_job` (`jobID`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
