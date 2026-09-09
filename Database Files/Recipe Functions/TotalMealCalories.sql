create or alter function dbo.TotalMealCalories(@MealId int)
returns varchar(110)

as
begin
	declare @value varchar (110) = ''

	select @value = concat(m.MealName, ' ', sum(r.Calories))
	from Meal m 
	left join MealCourse mc
	on mc.MealId = m.MealId
	left join MealCourseRecipe mcr
	on mcr.MealCourseId = mc.MealCourseId
	left join Recipe r 
	on r.RecipeId = mcr.RecipeId
	where m.MealId = @MealId
	group by m.MealName

	return @value

end
go

select TotalMealCalories = dbo.TotalMealCalories(m.MealId)
from Meal m
