--JHADFKHBEAF--
CREATE TABLE Passengers(
pass_id INTEGER,
full_name VARCHAR(35),
gender CHAR(1),
dob VARCHAR(10)
);
CONSTRAINT Passenger PRIMARY KEY (pass_id);


CREATE TABLE Flight(
flight_id VARCHAR(30),
plane VARCHAR(30),
departs TIME,
origin VARCHAR(30),
destination VARCHAR(30)
);
CONSTRAINT Flight PRIMARY KEY (flight_id);
CONSTRAINT Flight FOREIGN KEY (plane) REFERENCES Plane(plane_id);


CREATE TABLE Reservation(
pass_id VARCHAR(30),
flight_id VARCHAR(30),

CONSTRAINT Res_PK PRIMARY KEY (pass_id,flight_id);
);


CREATE TABLE Plane(
plane_id VARCHAR(30),
category VARCHAR(30),
capacity INTEGER
);
