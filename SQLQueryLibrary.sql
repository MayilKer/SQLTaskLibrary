Create database Store
use store
Create table Brand
(
  ID int primary key identity,
  Name nvarchar(25) not null
)
alter table brand
exec sp_rename 'Brand','Brands'
Create table Notebooks 
(
  Notebook_ID int primary key identity,
  Notebook_Name nvarchar(25) not null,
  Notebook_Price int  default 0,
  Brand_ID int references Brands(ID)
)
aLTER TABLE NOTEBOOKS
alter column Notebook_Price money not null
Create table Phones
(
  Phone_ID int primary key identity,
  Phone_Name nvarchar(25) not null,
  Phone_Price money default 0,
  Brand_ID int references Brands(ID)
)
INSERT INTO Brands(Name)
values('Apple'),
('Samsung'),
('Sony'),
('Xiaomi')
Insert into Notebooks(Notebook_Name,Notebook_Price,Brand_ID)
VALUES('MacBook AIR',1800,1),
('MacBook Pro',4999,1),
('GalaxyBookS',1200,2),
('VaioFit',2300,3),
('Mi Pro',1895,4),
('MX250',2595,4),
('350E7C',1050,2)
Insert into Phones(Phone_Name,Phone_Price,Brand_ID)
values('Iphone 13',2629.99,1),
('Iphone 11',1549.99,1),
('Galaxy A52',899,2),
('Galaxy Z Flip 3',2499,2),
('Galaxy S21',1899,2),
('Xperia Pro-I',3059.99,3),
('Xperia 5',1700,3),
('POCO F3',899,4),
('MI 11 Lite',899,4),
('POCO X3',649,4),
('Iphine 12 Mini',1819.99,1),
('Iphone 11',1549.99,1)
--1
Select Notebook_Name,b.Name as 'BrandNAME',Notebook_Price from Notebooks n inner Join Brands b on n.Brand_ID = b.ID
--2
Select Phone_Name,b.Name as 'BrandNAME',Phone_Price from Phones p inner Join Brands b on p.Brand_ID = b.ID
--3
Select * from Brands b join Notebooks n on b.ID = n.Brand_ID where b.Name like '%s%'
--4
Select * from Notebooks where Notebook_Price BETWEEN 2000  AND 5000 OR Notebook_Price > 5000
--5
Select * from Phones where Phone_Price between 1000 and 1500  or Phone_Price > 1500
--6
Select n.Notebook_Name, Count(n.Notebook_Name)  as say from Notebooks n group by n.Notebook_Name
--7
Select *from Notebooks n inner Join Brands b on n.Brand_ID = b.ID
intersect
Select * from Phones p inner Join Brands b on p.Brand_ID = b.ID
Select b.Name as BradName,n.Notebook_Name,n.Notebook_Price,n.Notebook_ID,Phone_Name,Phone_Price,Phone_ID from Brands b inner Join Notebooks n on n.Brand_ID = b.ID inner join Phones on Phone_ID = b.ID
Select b.Name as BradName,n.Notebook_Name,n.Notebook_Price,n.Notebook_ID,Phone_Name,Phone_Price,Phone_ID from Brands b inner Join Notebooks n on n.Brand_ID = b.ID inner join Phones on Phone_ID = b.ID
where n.Notebook_Price > 100 and Phone_Price > 1000
--8
Select b.Name,Count(b.ID)  as [say] from Brands b join Notebooks n on  n.Brand_ID = b.ID group by b.Name
--9
Select b.Name,Count(b.ID)  as [say] from Brands b join Phones p on  p.Brand_ID = b.ID group by b.Name
--14
Select b.Name,Count(b.ID)as [say],SUM(p.Phone_Price) as [TotalPrice]   from Brands b join Phones p on  p.Brand_ID = b.ID group by b.Name
--15
Select b.Name,Count(b.ID)  as [say],SUM(n.Notebook_Price) as [TotalPrice] from Brands b join Notebooks n on  n.Brand_ID = b.ID group by b.Name
Select * from Notebooks n join Brands b on b.ID = n.Brand_ID
union
Select * from Phones p join Brands b on b.ID = p.Brand_ID

Select * from Phones p join Brands b on b.ID = p.Brand_ID where p.Phone_Price > 1000
union all
Select * from Notebooks n join Brands b on b.ID = n.Brand_ID where n.Notebook_Price > 1000
