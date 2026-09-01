create or alter procedure dbo.RecipeDelete(
@RecipeId int,
@Message varchar(500) = '' output
)
as 
begin
	declare @return int = 0

	if not exists(select * from Recipe r where r.RecipeId = @RecipeId and (datediff(day, r.DateArchived, getdate()) >= 30 or r.RecipeStatus = 'drafted'))
	begin
		select @return = 1, @Message = 'Can only delete recipe that is drafted or archived for at least 30 days'
		goto finished
	end

	begin try
		begin tran
		delete RecipeDirections where RecipeId = @RecipeId
		delete RecipeIngredient where RecipeId = @RecipeId
		delete Recipe where RecipeId = @RecipeId
		commit
	end try
	begin catch
		rollback;
		throw
	end catch

	finished:
	return @return
end
go