create or alter procedure dbo.RecipeGet(@RecipeId int = 0, @All bit = 0, @RecipeName varchar (100) = '')
as
begin 
	select r.RecipeId, r.RecipeName, r.Calories, r.RecipeImage, r.DateDrafted, r.DatePublished, r.DateArchived, r.RecipeStatus
	from Recipe r
	where r.RecipeId = @RecipeId
	or @All = 1
	or (@RecipeName <> '' and r.RecipeName like '%' + @RecipeName + '%')
end
go 

exec RecipeGet

exec RecipeGet @All = 1

exec RecipeGet @RecipeName = ''
exec RecipeGet @RecipeName = 'f'

declare @RecipeId int
select top 1 @RecipeId = r.RecipeId from Recipe r
exec RecipeGet @RecipeId = @RecipeId