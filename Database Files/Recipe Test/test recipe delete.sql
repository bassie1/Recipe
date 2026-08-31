set nocount on

declare @recipeid int

select top 1 @recipeid = r.RecipeId
from Recipe r
join RecipeIngredient ri 
on ri.RecipeId = r.RecipeId
join Ingredient i 
on ri.IngredientId = i.IngredientId
join RecipeDirections rd 
on rd.RecipeId = r.RecipeId
order by r.RecipeId

select 'recipe', r.RecipeId, r.RecipeName from Recipe r where r.RecipeId = @recipeid
union select 'ingredient', i.IngredientId, i.IngredientName from RecipeIngredient ri join Ingredient i on ri.IngredientId = i.IngredientId where ri.RecipeId = @recipeid
union select 'recipedirections', rd.RecipeDirectionsId, rd.Direction from RecipeDirections rd where rd.RecipeId = @recipeid

exec RecipeDelete @RecipeId = @recipeid

select 'recipe', r.RecipeId, r.RecipeName from Recipe r where r.RecipeId = @recipeid
union select 'ingredient', i.IngredientId, i.IngredientName from RecipeIngredient ri join Ingredient i on ri.IngredientId = i.IngredientId where ri.RecipeId = @recipeid
union select 'recipedirections', rd.RecipeDirectionsId, rd.Direction from RecipeDirections rd where rd.RecipeId = @recipeid
