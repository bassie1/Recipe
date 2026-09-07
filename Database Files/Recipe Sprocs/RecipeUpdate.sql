create or alter proc dbo.RecipeUpdate(
	@RecipeId int  output,
	@CuisineId int,
	@UsersId int,
	@RecipeName varchar (100),
	@Calories int,
	@DateDrafted date,
	@DatePublished date,
	@DateArchived date,
	@Message varchar (500) = '' output

)

as
begin
	declare @return int 

	select @RecipeId = isnull(@RecipeId, 0)

	if @RecipeId = 0
	begin

		insert Recipe(CuisineId, UsersId, RecipeName, Calories, DateDrafted, DatePublished, DateArchived)
		values (@CuisineId, @UsersId, @RecipeName, @Calories, @DateDrafted, @DatePublished, @DateArchived)
		select @RecipeId = SCOPE_IDENTITY()
	end
	else 
	begin
		update Recipe
		set
			CuisineId = @CuisineId, 
			UsersId = @UsersId, 
			RecipeName = @RecipeName, 
			Calories = @Calories, 
			DateDrafted = @DateDrafted, 
			DatePublished = @DatePublished, 
			DateArchived = @DateArchived
		where RecipeId = @RecipeId
	end

	return @return

end
go

