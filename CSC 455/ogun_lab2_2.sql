create table Customer (name varchar2(15),email varchar2(25) primary key,phone int,totalPurchase int);
create table Video (vID int primary key,name varchar2(20),year date,cost int,genre varchar2(10));
create table Actor (aID int primary key,name varchar2(15),dob date);
create table Price (priceCode int primary key,cost int);
create table Rents (email varchar2(25),vID int,priceCode int,rentalFee int,lateFee int, 
                    rentdate date,dueDate date, foreign key(email) references Customer(email), foreign key(vID) references Video(vID),
                    foreign key(priceCode) references Price(priceCode));
create table Performs (vID int,aID int, foreign key(vID) references Video(vID),foreign key(aID) references Actor(aID));