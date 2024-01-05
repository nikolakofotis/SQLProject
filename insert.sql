-- User Table
INSERT INTO user (username, email, password, name, lastname, regDate) VALUES
('anna_wright', 'anna.wright@gmail.com', 'n7jKSP5qqKS', 'Anna', 'Wright', '2022-01-01 12:00:00'),
('cody_curtis', 'cody.curtis@gmail.com', 'nRtkLQn0PZW', 'Cody', 'Curtis', '2022-01-02 12:00:00'),
('zayd_silva', 'zayd.silva@gmail.com', 'EsDgZuHKIbY', 'Zayd', 'Silva', '2022-01-03 12:00:00'),
('leah_contreras', 'leah.contreras@gmail.com', 'LmrADxAHbdE', 'Leah', 'Contreras', '2022-01-04 12:00:00'),
('sallie_rubio', 'sallie.rubio@gmail.com', 'i1FkmypPYSl', 'Sallie', 'Rubio', '2022-01-05 12:00:00'),
('salma_park', 'salma.park@gmail.com', 'RtKq00WZPnL', 'Salma', 'Park', '2022-01-06 12:00:00'),
('gavin_french', 'gavin.french@gmail.com', 'qLynwv7T3bA', 'Gavin', 'French', '2022-01-07 12:00:00'),
('jacqueline_sims', 'jacqueline.sims@gmail.com', 'EYIHuZgDSDr', 'Jacqueline', 'Sims', '2022-01-08 12:00:00'),
('luisa_dickson', 'luisa.dickson@gmail.com', 'AitF7cSSfPZ', 'Luisa', 'Dickson', '2022-01-09 12:00:00'),
('gertrude_stephens', 'gertrude.stephens@gmail.com', 'LmrADxAHbdE', 'Gertrude', 'Stephens', '2022-01-10 12:00:00'),
('luqman_gibson', 'luqman.gibson@gmail.com', 'K5qqKS7nJPn', 'Luqman', 'Gibson', '2022-01-11 12:00:00'),
('catrin_harrell', 'catrin.harrell@gmail.com', 'nRtkLQn0PZW', 'Catrin', 'Harrell', '2022-01-12 12:00:00');

-- Etairia Table
INSERT INTO etairia (AFM, DOY, name, tel, street, num, city, country) VALUES
('987654321', 'DOY1', 'Tech Solutions Ltd', '1234567890', 'Main Street', 123, 'Tech City', 'Techland'),
('543219876', 'DOY2', 'Design Innovators Inc', '9876543210', 'Creative Avenue', 456, 'Design Town', 'Designland'),
('192837465', 'DOY3', 'Data Analytics Corp', '1122334455', 'Innovation Street', 789, 'Data City', 'Dataland');

-- Evaluator Table
INSERT INTO evaluator (username, firm, expYears) VALUES
('evaluator1', '987654321', 8),
('evaluator2', '543219876', 10),
('evaluator3', '192837465', 12),
('evaluator4', '123456789', 6),
('evaluator5', '987654321', 14),
('evaluator6', '543219876', 9);

-- Degree Table
INSERT INTO degree (titlos, idryma, bathmida) VALUES
('Computer Science B.Sc.', 'MIT', 'bsc'),
('Electrical Engineering M.Sc.', 'Stanford', 'msc'),
('Physics Ph.D.', 'Caltech', 'phd'),
('Psychology B.A.', 'Harvard', 'bsc'),
('Business Administration M.B.A.', 'Wharton', 'msc'),
('Economics Ph.D.', 'Chicago', 'phd');

-- HasDegree Table
INSERT INTO hasDegree (candUsername, degrTitle, degrIdryma, etos, grade) VALUES
('anna_wright', 'Computer Science B.Sc.', 'MIT', 2010, 3.8),
('cody_curtis', 'Electrical Engineering M.Sc.', 'Stanford', 2012, 4.0),
('zayd_silva', 'Physics Ph.D.', 'Caltech', 2015, 3.9),
('leah_contreras', 'Psychology B.A.', 'Harvard', 2011, 3.5);

-- Languages Table
INSERT INTO languages (lang, candid) VALUES
('en,fr', 'anna_wright'),
('sp', 'cody_curtis'),
('ge,ch', 'zayd_silva'),
('gr', 'leah_contreras');

-- Employee Table
INSERT INTO employee (username, bio, sistatikes, certificates) VALUES
('anna_wright', 'Experienced software engineer with expertise in web development.', 'Agile, Scrum', 'Microsoft Certified: Azure Developer Associate'),
('cody_curtis', 'Creative graphic designer with a passion for visual storytelling.', 'Adobe Creative Suite', 'Certified Graphic Designer'),
('zayd_silva', 'Dedicated data analyst skilled in interpreting and analyzing complex data sets.', 'Statistical Analysis, Data Visualization', 'Data Analyst Certification'),
('leah_contreras', 'E-learning specialist with a focus on creating engaging online courses.', 'Instructional Design, Learning Management Systems', 'Certified E-Learning Professional'),
('sallie_rubio', 'Network security expert with a background in cybersecurity.', 'Network Security, Ethical Hacking', 'Certified Information Systems Security Professional (CISSP)'),
('salma_park', 'Experienced ERP consultant with a track record of successful implementations.', 'ERP Systems, Project Management', 'Certified ERP Consultant');

-- Project Table
INSERT INTO project (num, candid, descr, url) VALUES
(1, 'anna_wright', 'Developed a scalable e-commerce platform', 'https://example.com/project1'),
(2, 'cody_curtis', 'Designed a mobile app for social networking', 'https://example.com/project2'),
(3, 'zayd_silva', 'Conducted data analysis for market trends', 'https://example.com/project3'),
(4, 'leah_contreras', 'Built a responsive e-learning platform', 'https://example.com/project4'),
(5, 'sallie_rubio', 'Implemented network security measures for a financial institution', 'https://example.com/project5'),
(6, 'salma_park', 'Led a successful ERP implementation for a multinational company', 'https://example.com/project6'),
(7, 'anna_wright', 'Contributed to an open-source machine learning library', 'https://example.com/project7');

-- Requires Table
INSERT INTO requires (subjectTitle, jobId) VALUES
('Programming Fundamentals', 1),
('Data Structures and Algorithms', 1),
('User Interface Design', 2),
('Database Management Systems', 2),
('Statistical Analysis', 3),
('Web Development', 4),
('Network Security', 5),
('Project Management', 6);

-- Subject Table
INSERT INTO subject (title, descr, belongsTo) VALUES
('Programming Fundamentals', 'Introduction to programming concepts', 'Programming Fundamentals'),
('Data Structures and Algorithms', 'Study of data organization and algorithms', 'Data Structures and Algorithms'),
('User Interface Design', 'Principles of UI/UX design', 'User Interface Design'),
('Database Management Systems', 'Fundamentals of database systems', 'Database Management Systems'),
('Statistical Analysis', 'Statistical methods and data analysis', 'Statistical Analysis'),
('Web Development', 'Building web applications', 'Web Development'),
('Network Security', 'Security protocols and measures', 'Network Security'),
('Project Management', 'Principles of project management', 'Project Management');

-- Job Table change evaluator names
INSERT INTO job (id, startDate, salary, position, edra, announceDate, submissionDate, evaluator) VALUES
(1, '2023-01-01', 80000, 'Software Engineer', 'Tech Solutions Ltd', '2022-12-01', '2023-01-15', 'evaluator1'),
(2, '2023-02-01', 90000, 'Graphic Designer', 'Design Innovators Inc', '2022-12-15', '2023-02-15', 'evaluator2'),
(3, '2023-03-01', 100000, 'Data Analyst', 'Data Analytics Corp', '2023-01-01', '2023-02-28', 'evaluator3'),
(4, '2023-04-01', 85000, 'Web Developer', 'Tech Solutions Ltd', '2023-01-15', '2023-03-15', 'evaluator4'),
(5, '2023-05-01', 95000, 'Network Security Specialist', 'Design Innovators Inc', '2023-02-01', '2023-03-31', 'evaluator5'),
(6, '2023-06-01', 110000, 'Project Manager', 'Data Analytics Corp', '2023-02-15', '2023-04-15', 'evaluator6');

-- Applies Table
INSERT INTO applies (candUsername, jobID) VALUES
('anna_wright', 1),
('cody_curtis', 2),
('zayd_silva', 3),
('leah_contreras', 4),
('sallie_rubio', 5),
('salma_park', 6),
('gavin_french', 1),
('jacqueline_sims', 2),
('luisa_dickson', 3),
('gertrude_stephens', 4),
('luqman_gibson', 5),
('catrin_harrell', 6);
