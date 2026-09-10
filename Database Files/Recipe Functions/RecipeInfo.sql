create or alter function dbo.RecipeInfo(@RecipeId int)
returns varchar (240)
as
begin
	declare @value varchar (240) = ''

	select @value = concat(
		r.RecipeName, 
		' (', c.CuisineType, ') ', 'has ', 
		(count (distinct ri.RecipeIngredientId)), 
		' ingredients and ', 
		(count (distinct rd.RecipeDirectionsId)), 
		' steps.')
	from Recipe r 
	left join Cuisine c 
	on c.CuisineId = r.CuisineId
	left join RecipeIngredient ri 
	on ri.RecipeId = r.RecipeId
	left join RecipeDirections rd 
	on rd.RecipeId = r.RecipeId
	where r.RecipeId = @RecipeId
	group by r.RecipeName, r.RecipeId, c.CuisineType

	return @value
end
go

select RecipeInfo = dbo.RecipeInfo(r.RecipeId), r.*
from Recipe r
