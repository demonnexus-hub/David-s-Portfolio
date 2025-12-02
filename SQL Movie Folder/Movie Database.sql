

if exists (SELECT * from sys.databases WHERE NAME= 'Final_Project_Group4')
 CREATE DATABASE Final_Project_Group4
GO

use Final_Project_Group4
GO

--DOWN (FK)
    if EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        where CONSTRAINT_NAME ='fk_Actor_Most_Worked_With_Director' )
        Alter Table Actors DROP CONSTRAINT fk_Actor_Most_Worked_With_Director

    if EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        where CONSTRAINT_NAME ='fk_director_most_worked_with_Actor' )
        Alter Table Directors DROP CONSTRAINT fk_director_most_worked_with_Actor

    if EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        where CONSTRAINT_NAME ='fk_award_actor' )
        Alter Table Awards DROP CONSTRAINT fk_award_actor

    if EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        where CONSTRAINT_NAME ='fk_award_director' )
        Alter Table Awards DROP CONSTRAINT fk_award_director

    if EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        where CONSTRAINT_NAME ='fk_Composer_most_worked_with_actor' )
        Alter Table Composers DROP CONSTRAINT fk_Composer_most_worked_with_actor

    if EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        where CONSTRAINT_NAME ='fk_Composer_most_worked_with_director' )
        Alter Table Composers DROP CONSTRAINT fk_Composer_most_worked_with_director

    if EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        where CONSTRAINT_NAME ='fk_movie_composer')
        Alter Table Movies DROP CONSTRAINT fk_movie_composer

    if EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        where CONSTRAINT_NAME ='fk_release_year')
        Alter Table Movies DROP CONSTRAINT fk_release_year

    if EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        where CONSTRAINT_NAME ='fk_actor_number')
        Alter Table Movies DROP CONSTRAINT fk_actor_number

    if EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        where CONSTRAINT_NAME ='fk_director_number')
        Alter Table Movies DROP CONSTRAINT fk_director_number

    if EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        where CONSTRAINT_NAME ='fk_earnings_report_number')
        Alter Table Movies DROP CONSTRAINT fk_earnings_report_number
--Down (Tables)
    DROP TABLE IF EXISTS Actors
    GO

    DROP TABLE IF EXISTS Directors
    GO

    DROP TABLE IF EXISTS Awards
    GO

    DROP TABLE IF EXISTS earnings_report
    GO

    DROP TABLE IF EXISTS Composers
    GO

    DROP TABLE IF EXISTS Movies
    GO
--UP META DATA (TABLES)
    Create TABLE Movies(
        movie_id INT IDENTITY NOT NULL,
        movie_name VARCHAR(50) NOT NULL,
        genre VARCHAR (20) NOT NULL,
        earnings_report_number INT NULL,
        director_number INT NOT NULL,
        actor_number INT NOT NULL,
        movie_composer INT NOT NULL,
        release_year INT NOT NULL
        CONSTRAINT pk_movie_id
            Primary KEY (movie_id),
        CONSTRAINT u_movie_name unique (movie_name)
    )
    GO

    Create TABLE Composers(
        Composer_id INT Identity Not Null,
        First_name VARCHAR(50) Not Null,
        Last_name VARCHAR(50) Not Null,
        Number_of_films INT Null,
        Awards_won INT Null,
        Most_worked_with_director INT Not Null,
        Most_worked_with_actor INT Not NULL
        CONSTRAINT pk_composer_id
            PRIMARY KEY (Composer_id)
    )
    GO

    Create TABLE earnings_report (
    earnings_report_id INT IDENTITY NOT NULL,
    Opening_Night DECIMAL (10,2) NOT NULL DEFAULT 0.00,
    two_weeks DECIMAL (10,2) NOT NULL DEFAULT 0.00,
    All_Time DECIMAL (10,2) NOT NULL DEFAULT 0.00,
    Lead_Actor_Salary DECIMAL (10,2) NOT NULL DEFAULT 0.00,
    Director_Salary_Number INT NOT NULL, 
    Marketing_Expenses DECIMAL (10,2) NOT NULL DEFAULT 0.00,
    Sum_of_Expenses DECIMAL (10,2) NOT NULL DEFAULT 0.00,
    Net_Earnings DECIMAL (10,2) NOT NULL DEFAULT 0.00
        CONSTRAINT pk_earnings_report_id
        Primary Key (earnings_report_id)
    )
    GO

    CREATE TABLE Awards(
    Years INT NOT NULL,
    Actor INT NOT NULL,
    Director INT NOT NULL,
    Genre VARCHAR(50)
        CONSTRAINT pk_ID
        Primary Key (Years)
    )
    GO

    CREATE TABLE Directors (
        Director_Number INT PRIMARY KEY,
        Director_First_Name VARCHAR(50),
        Director_Last_Name VARCHAR(50),
        Alumni VARCHAR(50),
        Number_of_Films INT,
        Most_Worked_With_Actor INT
    );
    GO

    CREATE TABLE Actors (
        Actor_Number INT PRIMARY KEY,
        First_Name VARCHAR(50),
        Last_Name VARCHAR(50),
        Sex CHAR(1),
        Number_of_Films INT,
        Most_Worked_With_Director INT
    );
    GO
-- UP DATA
    INSERT INTO Movies 
        (movie_name,genre,earnings_report_number,director_number,actor_number,release_year,movie_composer)
        VALUES
        ('Star Wars: Episode VII - The Force Awakens','Science Fiction',30,22,2,2015,12),
        ('Avengers: Endgame','Superhero',4,38,30,2019,30),
        ('Spider-Man: No Way Home','Superhero',42,14,8,2021,22),
        ('Avatar','Science Fiction',28,11,37,2009,40),
        ('Top Gun: Maverick','Action',40,16,47,2022,37),
        ('Black Panther','Superhero',17,22,25,2018,33),
        ('Avatar: The Way of Water','Science Fiction',39,29,36,2022,46),
        ('Avengers: Infinity War','Superhero',2,5,20,2018,42),
        ('Titanic','Romance',21,4,5,1997,28),
        ('Jurassic World','Action',10,22,21,2015,20),
        ('Inside Out 2','Animated',31,29,43,2024,35),
        ('Deadpool & Wolverine','Superhero',24,14,32,2024,45),
        ('Barbie','Comedy',46,13,43,2023,23),
        ('The Avengers','Superhero',16,15,47,2012,6),
        ('Star Wars: Episode VIII - The Last Jedi','Science Fiction',9,29,25,2017,39),
        ('Incredibles 2','Animated',15,32,4,2018,44),
        ('The Super Mario Bros. Movie','Animated',38,45,17,2023,3),
        ('The Lion King Remake','Animated',26,33,16,2019,17),
        ('The Dark Knight','Superhero',13,42,44,2008,25),
        ('Rogue One: A Star Wars Story','Science Fiction',12,34,19,2016,24),
        ('Star Wars: Episode IX - The Rise of Skywalker','Science Fiction',14,23,45,2019,41),
        ('Beauty and the Beast','Musical',7,45,18,2017,14),
        ('Star Wars: Episode I - The Phantom Menace','Science Fiction',5,35,21,1999,38),
        ('Finding Dory','Animated',32,43,7,2016,36),
        ('Frozen II','Musical',29,38,22,2019,21),
        ('Wicked','Animated',18,36,29,2024,10),
        ('Star Wars: Episode IV - A New Hope','Science Fiction',3,28,14,1977,26),
        ('Moana 2','Musical',44,45,17,2024,19),
        ('Avengers: Age of Ultron','Superhero',8,46,23,2015,8),
        ('Black Panther: Wakanda Forever','Superhero',34,7,8,2022,13),
        ('The Dark Knight Rises','Superhero',45,19,20,2012,9),
        ('Shrek 2','Animated',23,26,33,2004,15),
        ('E.T. the Extra-Terrestrial','Science Fiction',19,25,34,1982,34),
        ('Toy Story 4','Animated',35,2,31,2019,31),
        ('Captain Marvel','Superhero',25,20,47,2019,32),
        ('The Lion King','Animated',37,30,22,1994,2),
        ('The Hunger Games: Catching Fire','Action',36,32,22,2013,5),
        ('A Minecraft Movie','Comedy',41,16,20,2025,43),
        ('Pirates of the Caribbean: Dead Mans Chest','Action',43,10,24,2006,11),
        ('Lilo & Stitch','Animated',20,34,30,2025,7),
        ('Jurassic World: Fallen Kingdom','Action',1,18,11,2018,47),
        ('Toy Story 3','Animated',33,38,17,2010,18),
        ('Star Wars: Episode III - Revenge of the Sith','Science Fiction',27,36,12,2005,1),
        ('Wonder Woman','Superhero',22,44,45,2017,29),
        ('Doctor Strange in the Multiverse of Madness','Superhero',6,25,27,2022,4),
        ('Iron Man 3','Superhero',47,21,22,2013,27),
        ('Captain America: Civil War','Superhero',11,19,14,2016,16)

    INSERT INTO Composers
        (First_name,Last_name,Number_of_films,Awards_won,Most_worked_with_actor,Most_worked_with_director)
        VALUES
        ('Ludwig','van',10,1,15,41),
        ('Wolfgang','Amadeus',10,2,37,26),
        ('Johann','Sebastian',9,0,24,13),
        ('Richard','Wagner',4,3,25,16),
        ('Joseph','Haydn',6,0,44,6),
        ('Johannes','Brahms',2,1,30,33),
        ('Franz','Schubert',3,0,29,46),
        ('Peter','Ilyich',2,1,9,38),
        ('George','Frideric',2,3,41,25),
        ('Igor','Stravinsky',5,3,28,34),
        ('Robert','Schumann',4,2,32,1),
        ('Frederic','Chopin',10,0,18,21),
        ('Felix','Mendelssohn',2,3,38,14),
        ('Claude','Debussy',10,3,6,12),
        ('Franz','Liszt',2,3,26,15),
        ('Antonin','Dvorak',7,1,7,31),
        ('Giuseppe','Verdi',9,2,20,9),
        ('Gustav','Mahler',5,1,43,23),
        ('Antonio','Vivaldi',1,2,3,22),
        ('Richard','Strauss',8,3,36,2),
        ('Serge','Prokofiev',6,3,21,37),
        ('Dmitri','Shostakovich',5,2,31,36),
        ('Bela','Bartok',9,0,27,47),
        ('Hector','Berlioz',8,1,19,30),
        ('Anton','Bruckner',5,1,14,18),
        ('Giovanni','Pierluigi',5,0,47,40),
        ('Claudio','Monteverdi',10,0,4,3),
        ('Jean','Sibelius',7,3,12,4),
        ('','Maurice',2,1,42,45),
        ('Ralph','Vaughan',10,1,35,7),
        ('Modest','Mussorgsky',8,0,17,27),
        ('Giacomo','Puccini',9,1,34,35),
        ('Henry','Purcell',7,1,13,19),
        ('Gioacchino','Rossini',7,0,23,44),
        ('Edward','Elgar',8,2,5,11),
        ('Sergei','Rachmaninoff',4,1,2,32),
        ('Camille','Saint-Saens',3,1,8,28),
        ('Josquin','Des',8,0,39,29),
        ('Nikolai','Rimsky-Korsakov',10,0,10,42),
        ('Carl','Maria',2,2,11,17),
        ('Jean-Philippe','Rameau',5,0,46,39),
        ('Jean-Baptiste','Lully',1,2,33,24),
        ('Gabriel','Faure',7,3,16,43),
        ('Edvard','Grieg',9,0,45,20),
        ('Christoph','Willibald',8,2,40,5),
        ('Richard','Dixon',10,2,22,10),
        ('Robert','Grayson',2,1,1,8)
        GO

    INSERT INTO earnings_report
    (Opening_Night, Two_Weeks, All_Time, Lead_Actor_Salary, Director_Salary_Number, Marketing_Expenses, 
    Sum_of_Expenses, Net_Earnings)
    VALUES
        (56.12, 368.37,1643.23,21.16,22,111.41,278.52,585.71),
        (238.69, 315.71,2937.41,25.54,38,145.66,364.15,545.19),
        (14.65,607.77,2929.31,47.45,14,90.96,227.4,265.62),
        (372.06,748.29,2485.84,2.1,11,49.3,123.25,247.16),
        (294.61,691.91,1052.91,27.48,16,173.81,434.52,979.02),
        (254.62,424.05,1781.68,23.91,22,23.83,59.57,88.3),
        (366.65,424.49,2544.21,11.37,29,200.4,501,910.43),
        (224.23,589.76,526.36,20.32,5,35.2,88,211.1),
        (22.74,60.3,101.27,27.45,4,223.56,558.9,1056.33),
        (378.44,1513.76,2194.95,14.17,22,218.55,546.38,1243.87),
        (396.18,464.67,2427.15,25.11,29,32.83,82.07,43.54),
        (195.81,783.24,1663.3,3.75,14,38.76,96.9,199.35),
        (131.06,284.89,2728.14,48.96,13,184.09,460.22,454.55),
        (166.15,239.09,2083.45,1.95,15,104,260,564.61),
        (193.72,328,2506.16,11.8,29,83.82,209.55,147.12),
        (24.96,301.77,1400.06,2.42,32,214.9,537.25,1322.41),
        (124.18,718.53,2222.16,23.8,45,123.61,309.02,347.07),
        (348.28,1393.12,2020.02,47.43,33,96.48,241.2,601.33),
        (243.63,460.63,835.69,33.08,42,144.73,361.82,541.27),
        (73.83,264.18,1658.69,8.62,34,196.47,491.17,391.78),
        (101.88,407.52,645.68,32.67,23,221.56,553.9,1059.24),
        (167.25,438.5,636.73,36.75,45,184.9,462.25,99.04),
        (304.58,1218.32,2714.24,31.72,35,53.45,133.62,294.14),
        (390.35,1561.4,2284.6,21.3,43,163.56,408.9,878.8),
        (62.34,92.93,1918.74,24.69,38,142.78,356.95,513.99),
        (303.63,1214.52,1761.05,12.43,36,216.09,540.23,1323.66),
        (62.71,532.15,1678.96,6.1,28,26.05,65.12,107.84),
        (390.76,1563.04,2020.1,22.5,45,54.87,137.17,121.8),
        (353.84,1415.36,2052.27,14.31,46,216.73,541.82,498.63),
        (128.22,359.28,353.11,40.09,7,189.05,472.62,725.9),
        (381.46,658.56,766.46,35.69,19,31.06,77.65,135.26),
        (262.06,1048.24,2991.11,14.01,26,43.32,108.3,268.25),
        (72.41,374.88,1342.72,6.72,25,76.42,191.05,446.28),
        (45.36,170.27,2710.21,4.57,2,144.31,360.77,290.85),
        (280.66,715.75,2641.1,12.88,20,66.51,166.28,327.37),
        (327.4,410.86,2504.39,14.77,30,199.87,499.68,1130.33),
        (395.47,1581.88,2447.05,28.83,32,199.89,499.72,955.44),
        (304.72,754.55,1578.81,32,16,243.6,609,974.15),
        (374.01,493.36,1475.62,32.13,10,218.6,546.5,704.66),
        (155.31,554.35,1490.92,19.8,34,207.83,519.58,833.57),
        (330.04,644.07,979.86,17.14,18,222.73,556.82,439.39),
        (290.68,1162.72,1266.47,46.78,38,152.69,381.72,553.72),
        (146.39,494.18,1119.49,9.06,36,109.2,273,370.87),
        (38.07,274.26,2880.18,22.46,44,174.8,437,872.53),
        (166.81,313.87,1240,14.11,25,53.36,133.4,156.37),
        (323.28,491.34,1069.05,27.63,21,202.54,506.35,440.07),
        (36.22,522.28,2664.35,17.64,19,149.45,373.62,730.21)
        GO

    INSERT INTO Awards
        ( Years, Actor, Director, Genre)
        VALUES
            (1977,44,43,'Science Fiction'),
            (1978,15,19,'Superhero'),
            (1979,17,26,'Superhero'),
            (1980,16,23,'Science Fiction'),
            (1981,19,39,'Action'),
            (1982,46,14,'Superhero'),
            (1983,3,16,'Science Fiction'),
            (1984,21,15,'Superhero'),
            (1985,41,47,'Romance'),
            (1986,45,34,'Action'),
            (1987,2,30,'Animated'),
            (1988,42,5,'Superhero'),
            (1989,47,7,'Comedy'),
            (1990,12,8,'Superhero'),
            (1991,23,17,'Science Fiction'),
            (1992,13,25,'Animated'),
            (1993,31,41,'Animated'),
            (1994,8,46,'Animated'),
            (1995,30,9,'Superhero'),
            (1996,25,6,'Science Fiction'),
            (1997,20,22,'Science Fiction'),
            (1998,39,40,'Musical'),
            (1999,33,11,'Science Fiction'),
            (2000,4,33,'Animated'),
            (2001,1,27,'Musical'),
            (2002,32,37,'Animated'),
            (2003,43,4,'Science Fiction'),
            (2004,9,29,'Musical'),
            (2005,35,21,'Superhero'),
            (2006,18,18,'Superhero'),
            (2007,14,24,'Superhero'),
            (2008,40,38,'Animated'),
            (2009,38,3,'Science Fiction'),
            (2010,24,20,'Animated'),
            (2011,36,13,'Superhero'),
            (2012,29,45,'Animated'),
            (2013,37,32,'Action'),
            (2014,34,1,'Comedy'),
            (2015,5,36,'Action'),
            (2016,7,2,'Animated'),
            (2017,28,10,'Action'),
            (2018,26,42,'Animated'),
            (2019,10,44,'Science Fiction'),
            (2020,6,12,'Superhero'),
            (2021,11,31,'Superhero'),
            (2022,27,35,'Superhero'),
            (2023,22,28,'Superhero')

    GO

        INSERT INTO Directors VALUES (1, 'Dennis', 'Dugan', NULL, 43, 21);
        INSERT INTO Directors VALUES (2, 'Robert', 'Luketic', NULL, 27, 1);
        INSERT INTO Directors VALUES (3, 'Daniel', 'Espinosa', NULL, 8, 10);
        INSERT INTO Directors VALUES (4, 'Cedric', 'Nicolas-Troyan', NULL, 15, 46);
        INSERT INTO Directors VALUES (5, 'Alice', 'Waddington', NULL, 47, 11);
        INSERT INTO Directors VALUES (6, 'Greg', 'Mottola', NULL, 14, 12);
        INSERT INTO Directors VALUES (7, 'Jonathan', 'Levine', NULL, 19, 7);
        INSERT INTO Directors VALUES (8, 'David', 'Dobkin', NULL, 33, 14);
        INSERT INTO Directors VALUES (9, 'David', 'Fincher', NULL, 11, 28);
        INSERT INTO Directors VALUES (10, 'Jaume', 'Collet-Serra', NULL, 15, 3);
        INSERT INTO Directors VALUES (11, 'Nisha', 'Ganatra', NULL, 47, 5);
        INSERT INTO Directors VALUES (12, 'Gavin', 'O’Connor', NULL, 22, 6);
        INSERT INTO Directors VALUES (13, 'John', 'Hughes', NULL, 19, 7);
        INSERT INTO Directors VALUES (14, 'Peyton', 'Reed', NULL, 33, 8);
        INSERT INTO Directors VALUES (15, 'Steven', 'Brill', NULL, 43, 1);
        INSERT INTO Directors VALUES (16, 'Jonathan', 'Demme', NULL, 12, 19);
        INSERT INTO Directors VALUES (17, 'Garry', 'Marshall', NULL, 22, 20);
        INSERT INTO Directors VALUES (18, 'Harold', 'Ramis', NULL, 20, 16);
        INSERT INTO Directors VALUES (19, 'Michael', 'Showalter', NULL, 19, 13);
        INSERT INTO Directors VALUES (20, 'Mike', 'Nichols', NULL, 22, 17);
        INSERT INTO Directors VALUES (21, 'Frank', 'Coraci', NULL, 43, 1);
        INSERT INTO Directors VALUES (22, 'Peter', 'Weir', NULL, 22, 20);
        INSERT INTO Directors VALUES (23, 'Jay', 'Roach', NULL, 16, 26);
        INSERT INTO Directors VALUES (24, 'Ivan', 'Reitman', NULL, 25, 31);
        INSERT INTO Directors VALUES (25, 'David', 'O. Russell', NULL, 16, 28);
        INSERT INTO Directors VALUES (26, 'Todd', 'Phillips', NULL, 16, 23);
        INSERT INTO Directors VALUES (27, 'Adam', 'Shankman', NULL, 22, 20);
        INSERT INTO Directors VALUES (28, 'Spike', 'Lee', NULL, 16, 25);
        INSERT INTO Directors VALUES (29, 'Ridley', 'Scott', NULL, 12, 36);
        INSERT INTO Directors VALUES (30, 'Ben', 'Stiller', NULL, 22, 33);
        INSERT INTO Directors VALUES (31, 'Richard', 'Donner', NULL, 25, 24);
        INSERT INTO Directors VALUES (32, 'Nancy', 'Meyers', NULL, 22, 20);
        INSERT INTO Directors VALUES (33, 'Shawn', 'Levy', NULL, 22, 30);
        INSERT INTO Directors VALUES (34, 'Martin', 'Scorsese', NULL, 11, 37);
        INSERT INTO Directors VALUES (35, 'Antoine', 'Fuqua', NULL, 8, 3);
        INSERT INTO Directors VALUES (36, 'James', 'Cameron', NULL, 12, 29);
        INSERT INTO Directors VALUES (37, 'Robert', 'De Niro', NULL, 11, 34);
        INSERT INTO Directors VALUES (38, 'Steven', 'Spielberg', NULL, 12, 36);
        INSERT INTO Directors VALUES (39, 'Francis', 'Lawrence', NULL, 27, 2);
        INSERT INTO Directors VALUES (40, 'Tim', 'Burton', NULL, 19, 42);
        INSERT INTO Directors VALUES (41, 'Woody', 'Allen', NULL, 19, 42);
        INSERT INTO Directors VALUES (42, 'Johnny', 'Depp', NULL, 19, 40);
        INSERT INTO Directors VALUES (43, 'Christopher', 'Nolan', NULL, 12, 46);
        INSERT INTO Directors VALUES (44, 'Quentin', 'Tarantino', NULL, 12, 46);
        INSERT INTO Directors VALUES (45, 'Patty', 'Jenkins', NULL, 19, 46);
        INSERT INTO Directors VALUES (46, 'Zack', 'Snyder', NULL, 15, 4);
        INSERT INTO Directors VALUES (47, 'Peter', 'Jackson', NULL, 12, 46);
        GO


        INSERT INTO Actors VALUES (1, 'Adam', 'Sandler', 'M', 43, 15);
        INSERT INTO Actors VALUES (2, 'Liam', 'Hemsworth', 'M', 27, 39);
        INSERT INTO Actors VALUES (3, 'Denzel', 'Washington', 'M', 8, 35);
        INSERT INTO Actors VALUES (4, 'Mary', 'Elizabeth', 'F', 15, 46);
        INSERT INTO Actors VALUES (5, 'Emma', 'Roberts', 'F', 47, 12);
        INSERT INTO Actors VALUES (6, 'Ben', 'Affleck', 'M', 22, 12);
        INSERT INTO Actors VALUES (7, 'Charlize', 'Theron', 'F', 19, 13);
        INSERT INTO Actors VALUES (8, 'Rachel', 'McAdams', 'F', 33, 14);
        INSERT INTO Actors VALUES (9, 'Jesse', 'Eisenberg', 'M', 11, 28);
        INSERT INTO Actors VALUES (10, 'Ryan', 'Reynolds', 'M', 8, 3);
        INSERT INTO Actors VALUES (11, 'Zoe', 'Kravitz', 'F', 47, 5);
        INSERT INTO Actors VALUES (12, 'Kristen', 'Wiig', 'F', 14, 6);
        INSERT INTO Actors VALUES (13, 'Mila', 'Kunis', 'F', 19, 7);
        INSERT INTO Actors VALUES (14, 'Owen', 'Wilson', 'M', 33, 8);
        INSERT INTO Actors VALUES (15, 'Kevin', 'James', 'M', 43, 1);
        INSERT INTO Actors VALUES (16, 'Bill', 'Murray', 'M', 20, 18);
        INSERT INTO Actors VALUES (17, 'Julia', 'Roberts', 'F', 22, 20);
        INSERT INTO Actors VALUES (18, 'Sigourney', 'Weaver', 'F', 20, 16);
        INSERT INTO Actors VALUES (19, 'Anne', 'Hathaway', 'F', 19, 13);
        INSERT INTO Actors VALUES (20, 'Meryl', 'Streep', 'F', 22, 17);
        INSERT INTO Actors VALUES (21, 'Chris', 'Rock', 'M', 43, 1);
        INSERT INTO Actors VALUES (22, 'Robin', 'Williams', 'M', 22, 20);
        INSERT INTO Actors VALUES (23, 'Zach', 'Galifianakis', 'M', 16, 26);
        INSERT INTO Actors VALUES (24, 'Dan', 'Aykroyd', 'M', 25, 31);
        INSERT INTO Actors VALUES (25, 'Mark', 'Wahlberg', 'M', 16, 28);
        INSERT INTO Actors VALUES (26, 'Will', 'Ferrell', 'M', 16, 23);
        INSERT INTO Actors VALUES (27, 'Jennifer', 'Lopez', 'F', 22, 20);
        INSERT INTO Actors VALUES (28, 'Bradley', 'Cooper', 'M', 16, 25);
        INSERT INTO Actors VALUES (29, 'Russell', 'Crowe', 'M', 12, 36);
        INSERT INTO Actors VALUES (30, 'Ben', 'Stiller', 'M', 22, 33);
        INSERT INTO Actors VALUES (31, 'Mel', 'Gibson', 'M', 25, 24);
        INSERT INTO Actors VALUES (32, 'Diane', 'Keaton', 'F', 22, 20);
        INSERT INTO Actors VALUES (33, 'Vince', 'Vaughn', 'M', 22, 30);
        INSERT INTO Actors VALUES (34, 'Leonardo', 'DiCaprio', 'M', 11, 37);
        INSERT INTO Actors VALUES (35, 'Ethan', 'Hawke', 'M', 8, 3);
        INSERT INTO Actors VALUES (36, 'Sam', 'Worthington', 'M', 12, 29);
        INSERT INTO Actors VALUES (37, 'Robert', 'De Niro', 'M', 11, 34);
        INSERT INTO Actors VALUES (38, 'Tom', 'Hanks', 'M', 12, 36);
        INSERT INTO Actors VALUES (39, 'Jennifer', 'Lawrence', 'F', 27, 2);
        INSERT INTO Actors VALUES (40, 'Helena', 'Bonham Carter', 'F', 19, 42);
        INSERT INTO Actors VALUES (41, 'Scarlett', 'Johansson', 'F', 19, 42);
        INSERT INTO Actors VALUES (42, 'Johnny', 'Depp', 'M', 19, 40);
        INSERT INTO Actors VALUES (43, 'Christian', 'Bale', 'M', 12, 46);
        INSERT INTO Actors VALUES (44, 'Samuel', 'L. Jackson', 'M', 12, 46);
        INSERT INTO Actors VALUES (45, 'Gal', 'Gadot', 'F', 19, 46);
        INSERT INTO Actors VALUES (46, 'Henry', 'Cavill', 'M', 15, 4);
        INSERT INTO Actors VALUES (47, 'Orlando', 'Bloom', 'M', 12, 46);
        GO
--UP META DATA (FK CONSTRAINTS)
    ALTER TABLE Movies
        Add CONSTRAINT fk_earnings_report_number FOREIGN KEY (earnings_report_number) REFERENCES earnings_report(earnings_report_id);
    ALTER TABLE Movies
        Add CONSTRAINT fk_director_number FOREIGN KEY (director_number) REFERENCES Directors(Director_Number);   
    ALTER TABLE Movies  
        ADD CONSTRAINT fk_actor_number FOREIGN KEY (actor_number) REFERENCES Actors(actor_number)
    ALTER TABLE Movies with NOCHECK
        ADD CONSTRAINT fk_release_year FOREIGN Key (release_year) REFERENCES Awards(Years)
    ALTER TABLE Movies 
        ADD CONSTRAINT fk_movie_composer FOREIGN KEY (movie_composer) REFERENCES Composers(Composer_id)
    Alter TABLE Composers
        ADD CONSTRAINT fk_Composer_most_worked_with_director FOREIGN KEY (Most_worked_with_director) REFERENCES Directors(director_number)
    Alter TABLE Composers
        ADD CONSTRAINT fk_Composer_most_worked_with_actor FOREIGN KEY (Most_worked_with_actor)  REFERENCES Actors(Actor_Number)
    ALTER TABLE Awards
        ADD CONSTRAINT fk_award_director FOREIGN KEY (Director) REFERENCES Directors(director_number)
    ALTER TABLE Awards
        ADD CONSTRAINT fk_award_actor FOREIGN KEY (Actor) REFERENCES Actors(Actor_Number)
    Alter TABLE Directors
        ADD CONSTRAINT fk_director_most_worked_with_Actor FOREIGN KEY (Most_Worked_With_Actor) REFERENCES Actors(Actor_Number)
    Alter table Actors
        ADD CONSTRAINT fk_Actor_Most_Worked_With_Director FOREIGN KEY (Most_Worked_With_Director) REFERENCES Directors(Director_Number)
--Verify
    SELECT *
        FROM Movies
    SELECT *
        FROM Composers

    SELECT *
        FROM Awards

    SELECT *
        FROM earnings_report

    SELECT *
        FROM Directors


--Triggers--
    IF OBJECT_ID('dbo.vw_MovieInfo', 'V') IS NOT NULL
        DROP VIEW dbo.vw_MovieInfo;
    GO

    CREATE VIEW dbo.vw_MovieInfo
    AS
    SELECT
        m.movie_id,
        m.movie_name AS movie_title,

        -- Combine director name
        d.Director_First_Name + ' ' + d.Director_Last_Name AS director_name,

        -- Combine actor name
        a.First_Name + ' ' + a.Last_Name AS actor_name,

        -- Combine composer name
        c.First_Name + ' ' + c.Last_Name AS composer_name,

        -- Movie earnings (from earnings_report)
        e.Net_Earnings,
        m.movie_name + ' — $' + CAST(e.Net_Earnings AS VARCHAR(20)) AS movie_and_earnings
    FROM dbo.Movies m
    JOIN dbo.Directors d ON d.Director_Number = m.director_number
    JOIN dbo.Actors a    ON a.Actor_Number    = m.actor_number
    JOIN dbo.Composers c ON c.Composer_id     = m.movie_composer
    JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number;
    GO

    GO
    Drop TRIGGER IF EXISTS T_insert_Directors
    GO
    CREATE or alter TRIGGER t_insert_Directors 
        ON Directors
            instead of 
            Insert
        AS BEGIN 
            DECLARE @maxdirector INT;
        SELECT @maxdirector= MAX (Director_Number)+1 FROM Directors;
            iNSERT into Directors
                (Director_Number)
            VALUES (@maxdirector)
    END;
    GO
    DRop TRIGGER IF EXISTS T_insert_Actor
    GO
    CREATE or alter TRIGGER T_insert_Actor
        ON Actors
            instead of 
            Insert
        AS BEGIN 
            DECLARE @maxactor INT;
        SELECT @maxactor= MAX (Actor_Number)+1 FROM Actors;
            iNSERT into Actors
                (Actor_Number)
            VALUES (@maxactor)
    END;


--Views--
    IF OBJECT_ID('dbo.vw_MovieInfo', 'V') IS NOT NULL
        DROP VIEW dbo.vw_MovieInfo;
    GO

    CREATE VIEW dbo.vw_MovieInfo
    AS
    SELECT
        m.movie_id,
        m.movie_name AS movie_title,

        -- Combine director name
        d.director_first_name + ' ' + d.director_last_name AS director_name,

        -- Combine actor name
        a.First_Name + ' ' + a.Last_Name AS actor_name,

        -- Combine composer name
        c.First_name + ' ' + c.Last_name AS composer_name,

        -- Movie earnings 
        m.earnings_report_number,
        m.movie_name + ' — $' + CAST(m.earnings_report_number AS VARCHAR(20)) AS movie_and_earnings
        FROM Movies m
        JOIN Actors a on m.actor_number=a.Actor_Number
        JOIN Directors d on d.Director_number=m.director_number
        Join Composers c on c.Composer_id=m.movie_composer

    GO


    Drop VIEW if exists  director_name
    GO
    CREATE or alter VIEW director_name AS
    SELECT Director_First_Name + ' '+ Director_Last_Name  AS D_name, Director_Number
    FROM Directors
    GO


    GO
    Drop VIEW if exists  Actor_name
    GO
    CREATE or alter VIEW Actor_name AS
    SELECT Actors.First_Name + ' '+ Actors.Last_Name  AS A_name, Actor_Number
    FROM Actors
    GO

--indexes--

    DROP INDEX IF EXISTS IX_Actors_MostWorkedDir ON Actors;
    GO
    CREATE INDEX IX_Actors_MostWorkedDir
    ON Actors (Most_Worked_With_Director);
    GO

    DROP INDEX IF EXISTS IX_Directors_MostWorkedAct ON Directors;
    GO
    CREATE INDEX IX_Directors_MostWorkedAct
    ON Directors (Most_Worked_With_Actor);
    GO


    Drop INDEX If EXISTS idx_genre on Movies
    Go
    Create Index idx_genre
    on Movies (genre)

    Drop INDEX IF EXISTS idx_sex on Actors
    GO
    Create INDEX idx_sex
    on Actors (Sex)

--aggregates--
    select m.movie_name, m.genre, 
    e.Net_Earnings, AVG(e.Net_Earnings) AS average_earnings, avg(e.Net_Earnings) OVER (partition by m.genre) as  average_earnings_by_genre,
    e.Sum_of_Expenses, AVG(e.Sum_of_Expenses) as average_expenses, AVG(e.Sum_of_Expenses) over (PARTITION by m.genre) as average_expenses_by_major
    FROM Movies m
        JOIN earnings_report e on m.earnings_report_number= e.earnings_report_id
    GROUP BY m.movie_name, m.genre, e.Net_Earnings, e.Sum_of_Expenses
    GO

    select a.A_name ,m.genre,COUNT(*) As number_of_movies
    FROM Movies m
    JOIN Actor_name a on m.actor_number=a.Actor_Number
    group by a.A_name,m.genre
    GO


    select d.D_name ,m.genre,COUNT(*) As number_of_movies
    FROM Movies m
    JOIN director_name d on m.director_number=d.Director_Number
    group by d.D_name,m.genre
    GO


-- Functions --
--Simplified table view of movies
    GO
    CREATE OR ALTER FUNCTION dbo.ifn_MoviesSimple()
    RETURNS TABLE
    AS
    RETURN
    (
        SELECT
            m.movie_id,
            m.movie_name,
            m.genre,
            m.release_year,
            d.Director_Number,
            CONCAT(d.Director_First_Name, ' ', d.Director_Last_Name) AS Director_Name,
            a.Actor_Number,
            CONCAT(a.First_Name, ' ', a.Last_Name)                    AS Actor_Name,
            c.Composer_id,
            CONCAT(c.First_Name, ' ', c.Last_Name)                    AS Composer_Name,
            e.Net_Earnings,
            e.Sum_of_Expenses,
            CASE WHEN e.Sum_of_Expenses = 0 THEN NULL
                ELSE CAST(e.Net_Earnings / e.Sum_of_Expenses AS DECIMAL(12,4))
            END AS ROI
        FROM dbo.Movies m
        JOIN dbo.Directors d ON d.Director_Number = m.director_number
        JOIN dbo.Actors    a ON a.Actor_Number    = m.actor_number
        JOIN dbo.Composers c ON c.Composer_id     = m.movie_composer
        JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
    );
    GO

--Predicted outcome--

    CREATE OR ALTER FUNCTION dbo.ifn_PredictedOutcome
    (
        @Genre            VARCHAR(20)     = NULL,
        @Director_Number  INT             = NULL,
        @Actor_Number     INT             = NULL,
        @Composer_Id      INT             = NULL
    )
    RETURNS TABLE
    AS
    RETURN
    (
        WITH base AS
        (
            SELECT
                -- Averages by each “signal”
                (SELECT AVG(e.Net_Earnings)
                FROM dbo.Movies m
                JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
                WHERE @Genre IS NOT NULL AND m.genre = @Genre) AS avg_genre_earn,

                (SELECT AVG(e.Sum_of_Expenses)
                FROM dbo.Movies m
                JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
                WHERE @Genre IS NOT NULL AND m.genre = @Genre) AS avg_genre_exp,

                (SELECT AVG(e.Net_Earnings)
                FROM dbo.Movies m
                JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
                WHERE @Director_Number IS NOT NULL AND m.director_number = @Director_Number) AS avg_dir_earn,

                (SELECT AVG(e.Sum_of_Expenses)
                FROM dbo.Movies m
                JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
                WHERE @Director_Number IS NOT NULL AND m.director_number = @Director_Number) AS avg_dir_exp,

                (SELECT AVG(e.Net_Earnings)
                FROM dbo.Movies m
                JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
                WHERE @Actor_Number IS NOT NULL AND m.actor_number = @Actor_Number) AS avg_actor_earn,

                (SELECT AVG(e.Sum_of_Expenses)
                FROM dbo.Movies m
                JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
                WHERE @Actor_Number IS NOT NULL AND m.actor_number = @Actor_Number) AS avg_actor_exp,

                (SELECT AVG(e.Net_Earnings)
                FROM dbo.Movies m
                JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
                WHERE @Composer_Id IS NOT NULL AND m.movie_composer = @Composer_Id) AS avg_comp_earn,

                (SELECT AVG(e.Sum_of_Expenses)
                FROM dbo.Movies m
                JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
                WHERE @Composer_Id IS NOT NULL AND m.movie_composer = @Composer_Id) AS avg_comp_exp
        )
        SELECT
            CAST(ROUND(
                0.40 * ISNULL(avg_genre_earn, 0) +
                0.20 * ISNULL(avg_dir_earn,   0) +
                0.20 * ISNULL(avg_actor_earn, 0) +
                0.20 * ISNULL(avg_comp_earn,  0), 2) AS DECIMAL(12,2)) AS Predicted_Earnings,

            CAST(ROUND(
                0.40 * ISNULL(avg_genre_exp,  0) +
                0.20 * ISNULL(avg_dir_exp,    0) +
                0.20 * ISNULL(avg_actor_exp,  0) +
                0.20 * ISNULL(avg_comp_exp,   0), 2) AS DECIMAL(12,2)) AS Predicted_Expenses,

            CASE
                WHEN
                    (0.40 * ISNULL(avg_genre_exp,0) +
                    0.20 * ISNULL(avg_dir_exp,0) +
                    0.20 * ISNULL(avg_actor_exp,0) +
                    0.20 * ISNULL(avg_comp_exp,0)) = 0
                THEN NULL
                ELSE CAST(ROUND(
                    (0.40 * ISNULL(avg_genre_earn,0) +
                    0.20 * ISNULL(avg_dir_earn,0) +
                    0.20 * ISNULL(avg_actor_earn,0) +
                    0.20 * ISNULL(avg_comp_earn,0))
                    /
                    NULLIF((0.40 * ISNULL(avg_genre_exp,0) +
                            0.20 * ISNULL(avg_dir_exp,0) +
                            0.20 * ISNULL(avg_actor_exp,0) +
                            0.20 * ISNULL(avg_comp_exp,0)), 0)
                ,4) AS DECIMAL(12,4))
            END AS Predicted_ROI
        FROM base
    );
    GO

--Top 3 directors in a genre--

    CREATE OR ALTER FUNCTION dbo.ifn_Top3DirectorsByGenre
    (
        @Genre VARCHAR(20)
    )
    RETURNS TABLE
    AS
    RETURN
    (
        WITH stats AS
        (
            SELECT
                d.Director_Number,
                CONCAT(d.Director_First_Name, ' ', d.Director_Last_Name) AS Director_Name,
                COUNT(*)                           AS Movies_Count,
                AVG(e.Net_Earnings)                AS Avg_Earnings,
                ROW_NUMBER() OVER (ORDER BY AVG(e.Net_Earnings) DESC) AS rn
            FROM dbo.Movies m
            JOIN dbo.Directors d ON d.Director_Number = m.director_number
            JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
            WHERE m.genre = @Genre
            GROUP BY d.Director_Number, d.Director_First_Name, d.Director_Last_Name
        )
        SELECT Director_Number, Director_Name, Movies_Count, Avg_Earnings
        FROM stats
        WHERE rn <= 3
    );
    GO

--Top 3 actors in a genre--

    CREATE OR ALTER FUNCTION dbo.ifn_Top3ActorsByGenre
    (
        @Genre VARCHAR(20)
    )
    RETURNS TABLE
    AS
    RETURN
    (
        WITH stats AS
        (
            SELECT
                a.Actor_Number,
                CONCAT(a.First_Name, ' ', a.Last_Name) AS Actor_Name,
                COUNT(*)                  AS Movies_Count,
                AVG(e.Net_Earnings)       AS Avg_Earnings,
                ROW_NUMBER() OVER (ORDER BY AVG(e.Net_Earnings) DESC) AS rn
            FROM dbo.Movies m
            JOIN dbo.Actors a ON a.Actor_Number = m.actor_number
            JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
            WHERE m.genre = @Genre
            GROUP BY a.Actor_Number, a.First_Name, a.Last_Name
        )
        SELECT Actor_Number, Actor_Name, Movies_Count, Avg_Earnings
        FROM stats
        WHERE rn <= 3
    );
    GO

--Top 3 composers in a genre--

    CREATE OR ALTER FUNCTION dbo.ifn_Top3ComposersByGenre
    (
        @Genre VARCHAR(20)
    )
    RETURNS TABLE
    AS
    RETURN
    (
        WITH stats AS
        (
            SELECT
                c.Composer_id,
                CONCAT(c.First_Name, ' ', c.Last_Name) AS Composer_Name,
                COUNT(*)                  AS Movies_Count,
                AVG(e.Net_Earnings)       AS Avg_Earnings,
                ROW_NUMBER() OVER (ORDER BY AVG(e.Net_Earnings) DESC) AS rn
            FROM dbo.Movies m
            JOIN dbo.Composers c ON c.Composer_id = m.movie_composer
            JOIN dbo.earnings_report e ON e.earnings_report_id = m.earnings_report_number
            WHERE m.genre = @Genre
            GROUP BY c.Composer_id, c.First_Name, c.Last_Name
        )
        SELECT Composer_id, Composer_Name, Movies_Count, Avg_Earnings
        FROM stats
        WHERE rn <= 3
    );
    GO


--Procedure--
--output price of director average--
IF OBJECT_ID('dbo.usp_GetDirectorAverageSalary', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_GetDirectorAverageSalary;
GO
 
CREATE PROCEDURE dbo.usp_GetDirectorAverageSalary
    @Director_Number INT = NULL,
    @Genre           VARCHAR(20) = NULL,
    @FromYear        INT = NULL,
    @ToYear          INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
 
    ;WITH salary AS
    (
        SELECT
            m.director_number,
            CAST(e.Director_Salary_Number AS DECIMAL(10,2)) AS Director_Price
        FROM dbo.Movies m
        JOIN dbo.earnings_report e
          ON e.earnings_report_id = m.earnings_report_number
        WHERE (@Genre IS NULL OR m.genre = @Genre)
          AND (@FromYear IS NULL OR m.release_year >= @FromYear)
          AND (@ToYear   IS NULL OR m.release_year <= @ToYear)
          AND (@Director_Number IS NULL OR m.director_number = @Director_Number)
    )
    SELECT
        d.Director_Number,
        CONCAT(d.Director_First_Name, ' ', d.Director_Last_Name) AS Director_Name,
        COUNT(*) AS Movies_Count,
        CAST(AVG(s.Director_Price) AS DECIMAL(12,2)) AS Average_Director_Price
    FROM salary s
    JOIN dbo.Directors d
      ON d.Director_Number = s.director_number
    GROUP BY d.Director_Number, d.Director_First_Name, d.Director_Last_Name
    ORDER BY Average_Director_Price DESC, Director_Name;
END;
GO
