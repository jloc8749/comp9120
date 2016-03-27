--==??| DML for COMP9120 |???==--

-----------------------------------------------------------
—- Edit By Ronak Patel
-- Written by Brett Samuel
-- Version 1
-- Please note comments written throughout
-- The DDL is being done by another group member.

-----------------------------------------------------------

clear screen;

--- I worked off Jason's diagram, top, left to the right and then down and left.

create table Ticket (
  barcode integer,
  seatcode varchar(3),
  -- I have removed row_code as it is just seat code and row code combined
  event_name varchar (20),
  rount varchar(20),
  venue_name varchar(20),
  PRIMARY KEY (barcode),
  FOREIGN KEY (seat_code) REFERENCES Seat (seat_code),
  FOREIGN KEY (event_name, round) REFERENCES Event (event_name, round),
  FOREIGN KEY (venue_name) REFERENCES Venue (venue_name)
);

create table Venue (
  venue_name varchar(20),
  location varchar(20),
  --- note that I added a "d" to the end of disable
  disabled_access_info varchar(200),
  PRIMARY KEY (venue_name)
);

create table Event (
  event_name varchar (20),
  rount varchar(20),
  -- Add participating Countries
  participating_countries varchar(3),
  --note I removed countries. If we are going to include it then we ought to:
  -- 1. Call it "participating_countries".
  -- 2. Have a table with a list of possible countries and link to that.
  date_and_time varchar(20),
  --note I renamed "date	+	time" date_and_time
  --todo: find out if there is a date/time stamp in oracle SQL
  sport varchar(20),
  PRIMARY KEY (event_name, round)
  FOREIGN KEY (participating_countries) REFERENCES Participating_countries (iso),
);
create table Participating_countries (
  iso varchar (3),
  county_name varchar(20),
  -- Add participating Countries
  PRIMARY KEY (iso)
);

create table Seat (
  seatcode varchar(4),
  --row_code varchar(2), removed by Ronak Patel
  venue_name varchar(20),
  aisle varchar(2),
  gate char,
  seat_class varchar(20),
  PRIMARY KEY (seat_code),
  FOREIGN KEY (venue_name) REFERENCES Venue (venue_name)
);

create table Ticket_status (
  barcode integer,
  status varchar(20)
  -- this is meant to be an IsA relationship. I have no idea how to show this
  -- in code or in the relationship diagram but I can tell you we got it wrong.
  FOREIGN KEY (barcode) REFERENCES Ticket (barcode)
);

create table Spectator (
  id_type varchar(20),
  country varchar(45),
  o_state varchar(20),
  doc_id varchar(15),
  address varchar(100),
  full_name varchar(70),
  -- rename "name" to "full_name" as name is often a reserved word
  PRIMARY KEY (id_type, country, o_state, doc_id)
);
create table Transaction (
  --  Table Add by Ronak Patel
  transaction_number varchar(20),
  id_type varchar(20),
  country varchar(45),
  o_state varchar(20),
  doc_id varchar(15),
  address varchar(100),
  full_name varchar(70),
  -- rename "name" to "full_name" as name is often a reserved word
  PRIMARY KEY (transaction_number)
  FOREIGN KEY (id_type,country,o_state,doc_id) REFERENCES Spectator (id_type,country,o_state,doc_id),
);
create table Tickets_sold(
  --  Table Add by Ronak Patel
  transaction_number varchar(20),
  barcode integer,
 
  FOREIGN KEY (transaction_number) REFERENCES Transaction (transaction_number)
  FOREIGN KEY (barcode) REFERENCES Ticket (barcode)
);

-- I don't understand why we have seat_price, cost and ticket held tables 
-- so I have left them off. I suggest removing them from the diagrams???
