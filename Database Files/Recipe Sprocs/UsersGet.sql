create or alter procedure dbo.UsersGet(@UsersId int = 0, @All bit = 0, @UserName varchar (100) = '')
as
begin 
	select u.UsersId, u.FirstName, u.LastName, u.UserName
	from Users u
	where u.UsersId = @UsersId
	or @All = 1
	or (@UserName <> '' and u.UserName like '%' + @UserName + '%')
end
go 

exec UsersGet

exec UsersGet @All = 1

exec UsersGet @UserName = ''
exec UsersGet @UserName = 'e'

declare @UsersId int
select top 1 @UsersId = u.UsersId from Users u
exec UsersGet @UsersId = @UsersId