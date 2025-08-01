CREATE TABLE Manufacturers (
	Code int PRIMARY KEY NOT NULL,
	Name varchar(50) NOT NULL 
)

CREATE TABLE Products (
	Code int PRIMARY KEY NOT NULL,
	Name Varchar (100) NOT NULL ,
	Price int NOT NULL ,
	Manufacturer int NOT NULL 
		CONSTRAINT fk_Manufacturers_Code REFERENCES Manufacturers(Code)
)


INSERT INTO Manufacturers(Code,Name) VALUES (1,'Sony'),(2,'Creative Labs'),(3,'Hewlett-Packard'),(4,'Iomega'),(5,'Fujitsu'),(6,'Winchester')
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5),(2,'Memory',120,6),(3,'ZIP drive',150,4),(4,'Floppy disk',5,6),(5,'Monitor',240,1),
(6,'DVD drive',180,2),(7,'CD drive',90,2),(8,'Printer',270,3),(9,'Toner cartridge',66,3),(10,'DVD burner',180,2)

select * from Products

------1
select name
from Products

-----2
select name, Price
from Products

------3
select name, Price
from Products
where Price <= 200

-------4
select name, Price
from Products
where Price between 60 and 120

-------5
select name, Price * 100 as  price_cents
from Products
------6
select AVG (Price) as Avrage_price
from Products

------7
select manufacturer,AVG (Price) as Avrage_price
from Products
where Manufacturer =2
group by Manufacturer

------8
select count(*)
from Products
where Price >=180
-------9
select name , price
from Products
where Price >=180
order by Price desc , name asc

-------10
select *
from Products A
left join Manufacturers B
on A.Code= B.Code
------11
select A.Name,Price,
       B.name
from Products A
left join Manufacturers B
on A.Code= B.Code
-------12
select avg(price), Manufacturer
from Products

group by Manufacturer
-------13
select avg(price)  as avg_price,
      B.Name

from Products A
inner join Manufacturers B
on A.code= B.Code
group by B.Name 

---------14
select avg(price)  as avg_price,
      B.Name

from Products A
inner join Manufacturers B
on A.code= B.Code
where Price >=150
group by B.Name 
 --------15
 select top 3 name,Price
 from Products
order by price asc
---------16
select top 7 A.Name,
       b.Price,
	   B.Name
from Manufacturers A
inner join Products B
on A.Code= B.Manufacturer
order by Price desc

------17
insert into Products (Code,Name,Price,Manufacturer)
values (11,'Loudspeakers',70,2)
-------18
 update Products
set name = 'Laser Printer'
where code = 8
select * from Products
-----19
select name , Price,Price * 0.9 as discount
from Products

-------20
select name , Price,Price * 0.9 as discount
from Products
where Price >=120

select * from Manufacturers
select * from Products

--------Cte table i want to get product count and price for spacific manufacturers only 'creative Labs' and 'Hewlett-Packard'

;with CTE_Manufactures as
(
select Name,Code
from Manufacturers
where Name='Creative Labs' or Name='Hewlett-Packard'
)
,CTE_product as
(
select count(Name) as Product_count ,Price,Manufacturer
from Products
group by Price,Manufacturer
)
select A.Name,
       sum(B.Product_count) as Product_Count,
	   sum(B.Price) as Tota_Price
	   
from CTE_Manufactures A
join CTE_product B
on A.Code=B.Manufacturer
group by A.Name


CREATE TABLE Warehouses (
   Code int PRIMARY KEY NOT NULL,
   Location varchar(100) NOT NULL ,
   Capacity int NOT NULL 
 )
 
 CREATE TABLE Boxes (
   Code varchar(100) PRIMARY KEY NOT NULL,
   Contents varchar(100) NOT NULL ,
   Value int NOT NULL ,
   Warehouse int NOT NULL, 
   CONSTRAINT fk_Warehouses_Code FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 )
  INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

  --------1
 select * from Warehouses
 --------2
 select *
 from Boxes
 where Value >150
 --------3
 select  distinct Contents
 from Boxes
 ---------4
 select avg(value) as avg_box
 from Boxes

 ---------5
select AVg(value) as avg_value
from Boxes
group by Warehouse

-------6
select AVg(value) as avg_value
from Boxes
group by Warehouse
having AVG(value)>150
----------7
select A.Code,
B.Location
from Boxes A
left join Warehouses B
on A.Warehouse= B.Code

---------8
select Warehouse,count(*) as count_
from Boxes
group by Warehouse

select * from Boxes

-------9
select Code ,Capacity
from Warehouses
where Capacity < (select count(Code) from Boxes )

--------10
select A.Code
       
from Boxes A
left join Warehouses B
on A.Warehouse= B.Code
where Location = 'Chicago'
---------11
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(6,'New York',3);
-------12
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('H5RT','Papers',200,2);
------13
select Value *0.85
from Boxes
-------temp table
select * 
into #Boxes_Values
from Boxes
--------14 
delete #Boxes_Values
where Value <100

select * from #Boxes_Values

-----Create a Permanant table
select * 
into Updated_values
from #Boxes_Values
---------15
create index index_Warehouse on Boxes (warehouse)

select * from Boxes
select * from Warehouses

-------Cte_table as each location wise contents count with Total_Price And Rank
;with Cte_table as
(
select Location,Capacity,Code
from Warehouses
)
,Cte_table2 as
(
select count(Contents) as Contents_Count,Value,Warehouse
from Boxes
group by Value,Warehouse
)

,CTE_rank_table as
(
select Value,Warehouse,
Rank() over (order by value desc) as customer_rank
from Cte_table2
)

select A.Location,
       sum(B.Contents_Count) as Contents_Count,
	   sum(B.Value) as Total_Price,
	   Rank() over (order by sum(B.Value) asc) as customer_rank
	   
from Cte_table A
join Cte_table2 B
on A.Code=B.Warehouse
join CTE_rank_table c
on A.Code=c.Warehouse
group by A.Location
order by Total_Price






