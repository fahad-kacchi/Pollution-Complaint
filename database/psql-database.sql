create database pollution_complaint;
\c pollution_complaint;

create table register_complaint(
reg_id varchar(10) primary key,
name varchar(50),
address varchar(100),
city varchar(30),
emailid varchar(30),
register_date date,
pincode int,
write_to_us varchar(200),
register_flag varchar(20),
photo varchar(200),
type_of_pollution varchar(20)
);

create table police_station_record(
ps_id varchar(10) primary key,
ps_name varchar(50),
ps_address varchar(100),
ps_city varchar(30),
ps_pincode varchar(7),
contact_no varchar(12)
);

create table reply(
reply_id varchar(10) primary key,
reply_message varchar(200),
reg_id varchar(10) references register_complaint on delete cascade on update cascade
);

'Work status : In Progress / Completed / Rejected'
