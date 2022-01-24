Create database Library
use Library
Create table Books
(
  Books_ID int primary key identity,
  Book_Name nvarchar(100) constraint Col Check(Len(Book_Name) > 2 and Len(Book_Name) < 100),
  Page_Count int  Check (Page_Count >= 10)
)
Create table Author
(
  Author_ID int primary key identity,
  Author_Name nvarchar(25) not null,
  Author_SurName nvarchar(25)
)
Alter table Books
Add B_Author_ID int references Author(Author_ID)
Insert into Author(Author_Name,Author_SurName)
values('Lev','Tolstoy'),
('Alexander','Pushkin'),
('Fyodor','Dostoyevsky')
insert into Books(Book_Name,Page_Count,B_Author_ID)
values('War and Peace',1225,1),
('Crime and Punishment',576,3),
('Eugene Onegin',304,2)
Select b.Book_Name,b.Page_Count,(a.Author_Name + ' ' + a.Author_SurName) as FullName from Books b join Author a on b.B_Author_ID = a.Author_ID

