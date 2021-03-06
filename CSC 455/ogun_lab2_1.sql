DROP TABLE CONCERTS;DROP TABLE ARENAS;DROP TABLE PERFORMERS;DROP TABLE PERFORMANCETYPES;
create table PerformanceTypes(PerformanceTypeName varchar2(20), Primary Key(PerformanceTypeName));
create table Performers(PerformerID int primary key, FirstName varchar2(10), LastName varchar2(15) , 
              Address varchar2(30), PerformanceTypeName varchar2(10), foreign key(PerformanceTypeName) references PerformanceTypes (PerformanceTypeName));
create table Arenas(ArenaID int primary key, ArenaName varchar2(10), City varchar2(10), Capacity int);
create table Concerts(PerformerID int, ArenaID int , ConcertDate date, foreign key(PerformerID) references Performers(PerformerID), 
              foreign key(ArenaID) references Arenas(ArenaID));insert into PerformanceTypes values('Singer');
insert into PerformanceTypes values('Dancer');
insert into PerformanceTypes values('Comedian');ALTER TABLE Performers add DateOfbirth date;
insert into Performers values (1, 'John', 'Dow','Annapolis MD','Singer',NULL);
insert into Performers values (2, 'Jones', 'Wod','Annapolis, MD','Painter',NULL);
insert into Performers values (2, 'Matt', 'Smith','Baltimore, MD','Dancer',NULL);
insert into Performers values (3, 'Jane', 'Brown','New York, NY','Dancer',NULL);
insert into Performers values (4, 'Jennifer', 'Shade','Seattle, WA','Dancer',NULL);
UPDATE Performers SET DateOfbirth = TO_DATE('1990-03-02','yyyy-mm-dd') WHERE PerformerID = 1;
DELETE FROM Performers WHERE FirstName='Matt' And LastName='Smith';
DELETE FROM PerformanceTypes WHERE PerformanceTypeName = 'SINGER';update PERFORMANCETYPES set PERFORMANCETYPENAME = 'DANCE PERFORMER' where PERFORMANCETYPENAME = 'DANCER';
insert into Arenas values (1,'Zoo','Lincoln',12345);insert into Arenas values (2,'CDM','Chicago',67890);
insert into Arenas values (3,'UIC','Rosemont',12309);
insert into Concerts values(1,1, TO_DATE('11-13-2017','mm-dd-YY'));
insert into Concerts values(2,1, TO_DATE('11-01-2001','mm-dd-YY'));
insert into Concerts values(1,2, TO_DATE('11-13-2018','mm-dd-YY'));
insert into Concerts values(3,2, TO_DATE('10-01-2018','mm-dd-YY'));
insert into Dancers values (2, 'Matt', 'Smith','Baltimore, MD','Dancer',NULL);
insert into Dancers values (3, 'Jane', 'Brown','New York, NY','Dancer',NULL);
insert into Dancers values (4, 'Jennifer', 'Shade','Seattle, WA','Dancer',NULL);