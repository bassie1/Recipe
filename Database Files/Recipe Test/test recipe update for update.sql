declare @Message varchar(500) = '', @return int, @CuisineId int, @UsersId int, @RecipeId int,
	@RecipeName varchar(100),
	@Calories int,
	@DateDrafted date,
	@DatePublished date,
	@DateArchived date

select top 1 
	@RecipeId = r.RecipeId,
	@CuisineId = r.CuisineId,
	@UsersId = r.UsersId,
	@RecipeName = RecipeName,
	@Calories = Calories,
	@DateDrafted = DateDrafted,
	@DatePublished = DatePublished,
	@DateArchived = DateArchived
from Recipe r


select @RecipeName = REVERSE(@RecipeName)

exec @return = RecipeUpdate
	@RecipeId = @RecipeId output,
	@CuisineId = @CuisineId, 
	@UsersId = @UsersId, 
	@RecipeName = @RecipeName, 
	@Calories = @Calories, 
	@DateDrafted = @DateDrafted, 
	@DatePublished = @DatePublished, 
	@DateArchived = @DateArchived, 
	@Message = @message output

select @return, @Message, @RecipeId

select top 1 * from Recipe r
where r.RecipeId = @RecipeId