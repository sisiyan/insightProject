use airQualityWeather;

create table testTable (
	id int NOT NULL AUTO_INCREMENT,
	state_name varchar(20) NOT NULL,
    county_name varchar(20) NOT NULL,
	latitude decimal NOT NULL,
    longitude decimal NOT NULL,
    Date_GMT varchar(20) NOT NULL,
    Time_GMT varchar(20) NOT NULL,
    SO2 float NULL,
    CO float NULL,
    PM10_mass float NULL,
    winds float NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Units (
unit_id int NOT NULL AUTO_INCREMENT,
parameter_name varchar(32) NOT NULL,
unit varchar(32) NOT NULL,
PRIMARY KEY (unit_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE Gases_Weather_Join (
gases_record_id int NOT NULL AUTO_INCREMENT,
state_name varchar(20) NOT NULL,
county_name varchar(20) NOT NULL,
latitude float(8,6) NOT NULL,
longitude float(8,5) NOT NULL,
date_GMT DATE NOT NULL,
time_GMT timestamp NOT NULL,
pressure double NULL,
relative_humidity double NULL,
temperature double NULL,
winds double NULL,
CO double NULL,
CO_MDL double NULL,
SO2 double NULL,
SO2_MDL double NULL,
NO2 double NULL,
NO2_MDL double NULL,
ozone double NULL,
ozone_MDL double NULL,
GMT_year int NOT NULL,
GMT_month int NOT NULL,
GMT_day int NOT NULL,
PRIMARY KEY (gases_record_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE Gases_Weather_Join (
gases_record_id int NOT NULL AUTO_INCREMENT,
state_name varchar(20) NOT NULL,
county_name varchar(20) NOT NULL,
latitude float(8,6) NOT NULL,
longitude float(8,5) NOT NULL,
date_GMT DATE NOT NULL,
time_GMT int NOT NULL,
pressure double NULL,
relative_humidity double NULL,
temperature double NULL,
winds double NULL,
CO double NULL,
CO_MDL double NULL,
SO2 double NULL,
SO2_MDL double NULL,
NO2 double NULL,
NO2_MDL double NULL,
ozone double NULL,
ozone_MDL double NULL,
GMT_year int NOT NULL,
GMT_month int NOT NULL,
GMT_day int NOT NULL,
PRIMARY KEY (gases_record_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE INDEX idx_gases_record_id
ON Gases_Weather_Join (gases_record_id);
CREATE INDEX idx_state_county
ON Gases_Weather_Join (state_name, county_name);
CREATE INDEX idx_date
ON Gases_Weather_Join (date_GMT);
CREATE INDEX idx_time
ON Gases_Weather_Join (time_GMT);
CREATE INDEX idx_year
ON Gases_Weather_Join (GMT_year);
CREATE INDEX idx_month
ON Gases_Weather_Join (GMT_month);



CREATE TABLE Particulates_Weather_Join (
particulates_record_id int NOT NULL AUTO_INCREMENT,
state_name varchar(20) NOT NULL,
county_name varchar(20) NOT NULL,
latitude float(8,6) NOT NULL,
longitude float(8,5) NOT NULL,
date_GMT DATE NOT NULL,
time_GMT int NOT NULL,
pressure double NULL,
relative_humidity double NULL,
temperature double NULL,
winds double NULL,
PM10_mass double NULL,
PM10_mass_MDL double NULL,
PM2point5_FRM double NULL,
PM2point5_FRM_MDL double NULL,
PM2point5_nonFRM double NULL,
PM2point5_nonFRM_MDL double NULL,
GMT_year int NOT NULL,
GMT_month int NOT NULL,
GMT_day int NOT NULL,
PRIMARY KEY (particulates_record_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE Gases_Weather_Join_Daily (
gases_rec_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
state_name varchar(20) NOT NULL,
county_name varchar(40) NOT NULL,
latitude float(8,6) NOT NULL,
longitude float(8,5) NOT NULL,
date_GMT DATE NOT NULL,
pressure_avg double NULL,
relative_humidity_avg double NULL,
temperature_avg double NULL,
winds_avg double NULL,
CO_avg double NULL,
SO2_avg double NULL,
NO2_avg double NULL,
ozone_avg double NULL,
GMT_year int NOT NULL,
GMT_month int NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE Particulates_Weather_Join_Daily (
particulates_rec_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
state_name varchar(20) NOT NULL,
county_name varchar(40) NOT NULL,
latitude float(8,6) NOT NULL,
longitude float(8,5) NOT NULL,
date_GMT DATE NOT NULL,
pressure_avg double NULL,
relative_humidity_avg double NULL,
temperature_avg double NULL,
winds_avg double NULL,
PM10_mass_avg double NULL,
PM2point5_FRM_avg double NULL,
PM2point5_nonFRM_avg double NULL,
GMT_year int NOT NULL,
GMT_month int NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
