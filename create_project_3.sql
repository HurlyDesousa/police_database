/*************************************************************
* Author:				Toby Swart
* Date: 				2018-08-13
* Filename:				create_project_3.sql
* Description:			Creates the police database			
*
*************************************************************/


# Dropping and recreating the database
DROP DATABASE IF EXISTS police;
CREATE DATABASE police COLLATE utf8_general_ci;


# Selecting the database
USE police;

# Creating the station table
CREATE TABLE station(
 stat_id INT NOT NULL AUTO_INCREMENT,
 stat_name VARCHAR(50) NOT NULL,
 stat_address_line_1 VARCHAR(50) NOT NULL,
 stat_address_line_2 VARCHAR(50) NOT NULL,
 stat_callsign VARCHAR(50) NOT NULL,
 stat_telno VARCHAR(12) NOT NULL CHECK (station (stat_telno,'^0\d{9}|\d{10}$')),
 PRIMARY KEY (stat_id)
)ENGINE = InnoDB;


# Modifying the station table
ALTER TABLE station
ADD UNIQUE (stat_id, stat_name);

# Creating the official table
CREATE TABLE official(
 official_service_id INT NOT NULL AUTO_INCREMENT,
 official_name VARCHAR(50) NOT NULL,
 official_surname VARCHAR(50) NOT NULL,
 official_contact_info VARCHAR(50) NOT NULL,
 official_callsign VARCHAR(50) NOT NULL,
 official_rank VARCHAR(50) NOT NULL,
 stat_id INT,
 FOREIGN KEY (stat_id)
 REFERENCES station (stat_id),
 PRIMARY KEY (official_service_id)
)ENGINE = InnoDB;



# Creating the suspect table
CREATE TABLE suspect(
 suspect_id INT NOT NULL AUTO_INCREMENT,
 suspect_name VARCHAR(50) NOT NULL,
 suspect_surname VARCHAR(50) NOT NULL,
 suspect_address_line_1 VARCHAR(50) NOT NULL,
 suspect_address_line_2 VARCHAR(50) NOT NULL,
 suspect_contact_info VARCHAR(50) NOT NULL,
 stat_id INT,
 FOREIGN KEY (stat_id)
 REFERENCES station (stat_id),
 PRIMARY KEY (suspect_id)
)ENGINE = InnoDB;


# Adding indexes to the suspect table
CREATE INDEX suspect_name_suspect_surname_index ON suspect (suspect_name, suspect_surname);
CREATE INDEX suspect_address_line_1_unique ON suspect (suspect_address_line_1);
CREATE INDEX suspect_address_line_2_unique ON suspect (suspect_address_line_2);
CREATE UNIQUE INDEX suspect_contact_info_unique ON suspect (suspect_contact_info);



# Adding a trigger to the suspect table which will backup suspect data so it is not lost when updated
DELIMITER $$
CREATE TRIGGER before_suspect_update 
    BEFORE UPDATE ON suspect
    FOR EACH ROW 
BEGIN
    INSERT INTO suspect_audit
    SET action = 'update',
     suspect_name = OLD.suspect_name,
     suspect_surnamee = OLD.suspect_surname,
     suspect_address_line_1 = OLD.suspect_address_line_1,
	 suspect_address_line_2 = OLD.suspect_address_line_2,
     suspect_contact_info = OLD.suspect_contact_info,
        changedat = NOW(); 
END$$
DELIMITER ;
   

# Creating the offence table
CREATE TABLE offence(
 offence_id INT NOT NULL AUTO_INCREMENT,
 offence_name VARCHAR(50) NOT NULL,
 offence_date DATE NOT NULL,
 offence_time TIMESTAMP NOT NULL,
 offence_action_taken VARCHAR(50) NOT NULL,
 suspect_id INT,
 FOREIGN KEY (suspect_id)
 REFERENCES suspect (suspect_id),
 PRIMARY KEY (offence_id)
)ENGINE = InnoDB;


# Adding a trigger to the offence table which will backup offence data so it is not lost when updated

DELIMITER $$
CREATE TRIGGER before_offence_update 
    BEFORE UPDATE ON offence
    FOR EACH ROW 
BEGIN
    INSERT INTO offence_audit
    SET action = 'update',
     offence_id = OLD.offence_id,
     offence_name = OLD.offence_name,
     offence_date = OLD.offence_date,
     offence_time = OLD.offence_time,
	 offence_action_taken = OLD.offence_action_taken,
        changedat = NOW(); 
END$$
DELIMITER ;


# Starting database population

# Inserting data into station table
INSERT INTO station (stat_name, stat_address_line_1, stat_address_line_2, stat_callsign, stat_telno)
VALUES ('Bridgeport Police', 'New Jersey', '1878 Prospect Street', 'BRAVO', '0724371185'),
	   ('Little Rock Police', 'Arkansas', '2470 Masonic Hill Road', 'CHARLIE', '0159773191'),
       ('Myrtle Beach Police', 'South Carolina', '3847 Camden Place', 'ECHO', '0411580243'),
       ('Huntington Police', 'West Virginia', '2153 Hall Valley Drive', 'ALPHA', '0474188663'),
       ('Albany Police', 'Georgia', '1434 Junkins Avenue', 'SIERRA', '0786619743'),
       ('Chesterton Police', 'Indiana', '945 Jadewood Drive', 'UNIFORM', '0581903116'),
       ('Salt Lake City Police', 'Utah', '1877 Austin Secret Lane', 'FOXTROT', '0376076406');

# Inserting data into official table
INSERT INTO official (official_name, official_surname, official_contact_info, official_callsign, official_rank, stat_id)
VALUES ('Rogelio', 'Hayes', '399913641', 'JULIET', 'Special Agent', '6'),
	   ('Mark', 'Larimore', '009094196', 'KILO', 'Agent', '2'),
	   ('Levi', 'Thompson', '990709470', 'LIMA', 'Probationary Agent', '3'),
	   ('Donald', 'Brewer', '574211551', 'MIKE', 'Special Agent', '4'),
	   ('Curtis', 'Lambert', '933108809', 'NOVEMBER', 'Supervisory Special Agent', '1'),
	   ('Wayne', 'Alderman', '420597327', 'OSCAR', 'Assistant Special Agent in Charge', '2'),
	   ('Shawn', 'White', '062889798', 'PAPA', 'Special Agent in Charge', '3'),
       ('Freddie', 'Truitt', '643904524', 'QUEBEC', 'Deputy Director', '4'),
	   ('Charlie', 'Martin', '840396026', 'ROMEO', 'Special Agent', '1'),
	   ('Garrett', 'Painter', '702067839', 'SIERRA', 'Supervisory Special Agent', '5'),
	   ('William', 'Miller', '751359776', 'TANGO', 'Assistant Special Agent in Charge', '3'),
	   ('Mark', 'Jay', '262162772', 'X-RAY', 'Special Agent in Charge', '1'),
       ('William', 'Murphy', '529297066', 'YANKEE', 'Deputy Director', '6'),
	   ('Nathaniel', 'McNeil', '124203993', 'ZULU', 'Director or Chief', '1');

# Inserting data into suspect table
INSERT INTO suspect (suspect_name, suspect_surname, suspect_address_line_1, suspect_address_line_2, suspect_contact_info, stat_id)
VALUES ('Jerry', 'Weir', 'Cleveland', '548 Sunny Glen Lane', '699706496', '1'),
	   ('Henry', 'Carpenter', 'Sisseton', '4129 Hartway Street', '536639853', '2'),
	   ('John', 'Mullen', 'Pittsburgh', '2777 Michigan Avenue', '357409943', '3'),
	   ('Larry', 'Putnam', 'Centralia', '2878 Carter Street', '715200205', '4'),
	   ('Meade', 'Jerald', 'Chicago', '3601 Patterson Fork Road', '827743971', '1'),
	   ('Bobby', 'Fuller', 'Gardena', '2099 Doctors Drive', '804445218', '3');



# Inserting data into offence table
INSERT INTO offence (offence_name, offence_date, offence_time, offence_action_taken, suspect_id)
VALUES ('Homicide', '2008-08-04', '13:34:43', 'Arrest', '2'),
       ('Parking Fine', '2018-04-03', '06:47:53', 'Fine', '4'),
       ('Asault', '2018-05-02', '13:35:45', 'Arrest', '5'),
       ('Fraud‎', '2017-06-02', '03:32:52', 'Fine', '4'),
       ('Forgery‎', '2017-03-08', '03:23:33', 'Fine', '1'),
       ('Kidnapping‎', '2008-03-07', '15:32:43', 'Arrest', '5'),
       ('Smuggling', '2006-12-02', '06:36:51', 'Arrest', '3'),
       ('Treason', '2007-03-01', '03:34:33', 'Arrest', '3'),
       ('Speeding Ticket', '2001-03-06', '03:24:33', 'Warrning', '6'),
	   ('Robbery', '2015-06-05', '09:04:42', 'Arrest', '6');



# Creating view vw_SuspectDetails 
 CREATE OR REPLACE VIEW vw_SuspectDetails
 AS
	SELECT suspect.suspect_name AS 'Suspect Name',
    suspect.suspect_surname AS 'Suspect Surame',
    offence.offence_action_taken AS 'Arest',
    offence.offence_date AS 'Date'
	
    FROM suspect
	INNER JOIN offence ON suspect.suspect_id = offence.suspect_id
	WHERE offence.offence_date >= '2007-11-25'
    HAVING offence.offence_action_taken = 'Arrest'
    ORDER BY offence.offence_action_taken;
    
SELECT * FROM vw_SuspectDetails;



# Creating view vw_PoliceStations

CREATE OR REPLACE VIEW vw_PoliceStations
AS
	SELECT station.stat_name AS 'Station Name'
    FROM station;
    
SELECT * FROM vw_PoliceStations;


# Creating view vw_OfficialDetails 

CREATE OR REPLACE VIEW vw_OfficialDetails
AS
	SELECT official.official_name AS 'Official Name',
    official.official_surname AS 'Official Surame',
    official.official_contact_info AS 'Official Contact Info',
    official.official_callsign AS 'Official Callsign',
    official.official_rank AS 'Official Rank',
    station.stat_name AS 'Station'
    FROM official
    INNER JOIN station ON official.stat_id = station.stat_id
    ORDER BY official.official_name;
    
    
SELECT * FROM vw_OfficialDetails;



# Creating stored Procedure sp_AddSuspect

# Switch delimiter to $$
DELIMITER $$


DROP PROCEDURE IF EXISTS police.sp_AddSuspect $$
CREATE PROCEDURE police.sp_AddSuspect ()
BEGIN	
	DECLARE exit_flag INT DEFAULT 0;
    
	DECLARE suspect_name VARCHAR(50);
    
    DECLARE suspect_surname VARCHAR(50);
    
	DECLARE suspect_address_line_1 VARCHAR(50);
    
	DECLARE suspect_address_line_2 VARCHAR(50);
    
    IF flag_exist = 0 THEN 
    
    SET suspect_name = 'John';
	SET suspect_surname = 'Doe';
	SET suspect_address_line_1 = 'Cape Town';
	SET suspect_address_line_2 = '2536 Green Road Hotel';
    END IF;

END $$




# Creating stored Procedure sp_AddOffence



DROP PROCEDURE IF EXISTS police.sp_AddOffence $$
CREATE PROCEDURE police.sp_AddOffence ()
BEGIN
	DECLARE offence_name VARCHAR(50);
    
    DECLARE offence_date VARCHAR(50);
    
	DECLARE offence_time VARCHAR(50);
    
	DECLARE offence_action_taken VARCHAR(50);
    
    
    SET offence_name = 'High Treason';
	SET offence_date = '2002-11-25';
	SET offence_time = '13:35:45';
	SET offence_action_taken = 'Death Penalty';
    
END $$



# Creating stored Procedure sp_PrintCover



DROP PROCEDURE IF EXISTS sp_PrintCover $$
CREATE PROCEDURE sp_PrintCover()
BEGIN
    DROP TEMPORARY TABLE IF EXISTS tmp_PrintCover;
    
    CREATE TEMPORARY TABLE tmp_PrintCover
    
    SELECT suspect_name, suspect_surname, suspect_address_line_1, suspect_address_line_2, suspect_contact_info, stat_id 
      FROM suspect
      
     ORDER BY suspect_name DESC;
    SELECT * 
    
      INTO OUTFILE '/tmp/suspect.txt'
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        LINES TERMINATED BY '\n'
        
      FROM tmp_PrintCover;
    SELECT * FROM tmp_PrintCover; 
    
END$$

# Switch delimiter back to ;
DELIMITER ;


