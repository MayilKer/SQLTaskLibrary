Create database Library
use Library
Create table Books
(
  Books_ID int primary key identity,
  Book_Name nvarchar(100) constraint Col Check(Len(Book_Name) > 2 and Len(Book_Name) < 100),
  Page_Count int  Check (Page_Count >= 10)
)
Alter table Books
Add Books_ID int primary key identity
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


Create view usv_LibraryFullInfo
AS
Select b.Book_Name,b.Page_Count,(a.Author_Name + ' ' + a.Author_SurName) as FullName from Books b join Author a on b.B_Author_ID = a.Author_ID
select * from usv_LibraryFullInfo
Create view usv_Library
AS
Select b.Book_Name,b.Page_Count,b.Books_ID,a.Author_ID,(a.Author_Name + ' ' + a.Author_SurName) as FullName from Books b join Author a on b.B_Author_ID = a.Author_ID
Create procedure usv_SearchByBookNameOrAuthorName
@stringvalue nvarchar(50)
as
begin
Select b.Book_Name,b.Page_Count,b.Books_ID,a.Author_ID,(a.Author_Name + ' ' + a.Author_SurName) as FullName from Books b join Author a on b.B_Author_ID = a.Author_ID where a.Author_Name like '%' + @stringvalue + '%' or  b.Book_Name like '%' + @stringvalue + '%'
end
exec usv_SearchByBookNameOrAuthorName 'Lev'
Create procedure  usv_DeleteAuthorkByID
@ID int
as
begin
Delete from Author where Author_ID = @ID
end
Create procedure usv_InsretIntoAuthor
(@Name nvarchar(25),@Surname nvarchar(25))
as
begin
Insert into Author(Author_Name,Author_SurName)
values(@Name,@Surname)
end
exec usv_InsretIntoAuthor 'Semed','Vurgun'
Create procedure usv_UpdateById
(@NewName nvarchar(25),@NewSurName nvarchar(25),@ID int)
as
begin
update Author SET Author_Name = @NewName,Author_SurName = @NewSurName where Author_ID = @ID
end