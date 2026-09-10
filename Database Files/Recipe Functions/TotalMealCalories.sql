create or alter function dbo.TotalMealCalories(@MealId int)
returns int

as
begin
	declare @value int = 0

	select @value = sum(r.Calories)
	from Meal m 
	left join MealCourse mc
	on mc.MealId = m.MealId
	left join MealCourseRecipe mcr
	on mcr.MealCourseId = mc.MealCourseId
	left join Recipe r 
	on r.RecipeId = mcr.RecipeId
	where m.MealId = @MealId

	return @value

end
go

select m.MealName, TotalMealCalories = dbo.TotalMealCalories(m.MealId)
from Meal m
