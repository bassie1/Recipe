declare @Message varchar(500) = '', @return int, @CuisineId int, @UsersId int, @RecipeId int

select top 1 @CuisineId = CuisineId from Cuisine
select top 1 @UsersId = UsersId from Users

exec @return = RecipeUpdate
	@RecipeId = @RecipeId output,
	@CuisineId = @CuisineId,
	@UsersId = @UsersId,
	@RecipeName = 'Hot Cocoa',
	@Calories = 123,
	@DateDrafted = '1/7/2026',
	@DatePublished = null,
	@DateArchived = null,
	@Message = @message output

select @return, @Message, @RecipeId

select * from Recipe r 
where r.RecipeId = @RecipeId

delete Recipe where RecipeId = @RecipeId
