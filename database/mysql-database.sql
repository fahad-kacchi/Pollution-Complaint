create database pollution_complaint;
use pollution_complaint;

create table register_complaint(
name varchar(50) primary key,
address varchar(100),
city varchar(30),
emailid varchar(30),
register_date date,
pincode int,
write_to_us varchar(200),
register_flag varchar(20)
);