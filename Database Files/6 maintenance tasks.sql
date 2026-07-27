--AS Great job! 
--Note: some of these scripts are needed for specific items, when the instructions say "specific" pick one item in your data and specify it in the where clause using a unique value that identifies it, do not use the primary key.

--1) Sometimes when a staff member is fired. We need to eradicate everything from that user in our system. Write the SQL to delete a specific user and all the user's related records.
delete mcr 
from MealCourseRecipe mcr  
join Recipe r 
on mcr.RecipeId = r.RecipeId
join Users u 
on r.UsersId = u.UsersId
where u.UserName = 'RE123' 

delete rd 
from RecipeDirections rd 
join Recipe r 
on rd.RecipeId = r.RecipeId 
join Users u 
on r.UsersId = u.UsersId 
where u.UserName = 'RE123'

delete ri 
from RecipeIngredient ri 
join Recipe r 
on ri.RecipeId = r.RecipeId  
join Users u 
on r.UsersId = u.UsersId 
where u.UserName = 'RE123'

delete cr 
from CookbookRecipe cr  
join Recipe r 
on cr.RecipeId = r.RecipeId
join Users u 
on r.UsersId = u.UsersId 
where u.UserName = 'RE123'

delete r 
from Recipe r 
join Users u 
on r.UsersId = u.UsersId 
where u.UserName = 'RE123'

delete mcr 
from MealCourseRecipe mcr 
join MealCourse mc 
on mcr.MealCourseId = mc.MealCourseId 
join Meal m 
on mc.MealId = m.MealId 
join Users u 
on m.UserId = u.UsersId
where u.UserName = 'RE123'

delete mc 
from MealCourse mc 
join Meal m 
on mc.MealId = m.MealId 
join Users u 
on m.UserId = u.UsersId 
where u.UserName = 'RE123'

delete m 
from Meal m 
join Users u 
on m.UserId = u.UsersId 
where u.UserName = 'RE123'

delete cr 
from CookbookRecipe cr 
join Cookbook c 
on cr.CookbookId = c.CookbookId  
join Users u 
on c.UserId = u.UsersId 
where u.UserName = 'RE123'

delete c 
from Cookbook c 
join Users u 
on c.UserId = u.UsersId 
where u.UserName = 'RE123'

delete u 
--select * 
from Users u 
left join Recipe r 
on u.UsersId = r.UsersId 
left join meal m 
on u.UsersId = m.UserId 
left join Cookbook c 
on u.UsersId = c.UserId
where u.UserName = 'RE123'


--2) Sometimes we want to clone a recipe as a starting point and then edit it. For example we have a complex recipe (steps and ingredients) and want to make a modified version. Write the SQL that clones a specific recipe, add " - clone" to its name.
insert Recipe(CuisineId, UsersId, RecipeName, Calories, DateDrafted, DatePublished, DateArchived)
select r.CuisineId, r.UsersId, concat(r.RecipeName, ' - clone'), r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived
from Recipe r 
where r.RecipeName like 'Cheesy Pasta'

insert RecipeDirections(RecipeId, Direction, DirectionSequence)
select (select r.recipeId from Recipe r where r.RecipeName = 'Cheesy Pasta - clone' ), rd.Direction, rd.DirectionSequence
from Recipe r 
join RecipeDirections rd 
on r.RecipeId = rd.RecipeId
where r.RecipeName = 'Cheesy Pasta'

insert RecipeIngredient(RecipeId, Amount, IngredientId, IngredientSequence, MeasurementId)
select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheesy Pasta - clone'), ri.Amount, ri.IngredientId, ri.IngredientSequence, ri.MeasurementId
from Recipe r 
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId 
where r.RecipeName = 'Cheesy Pasta'

/*
3) We offer users an option to auto-create a recipe book containing all of their recipes. 
Write a SQL script that creates the book for a specific user and fills it with their recipes.
The name of the book should be Recipes by Firstname Lastname. 
The price should be the number of recipes multiplied by $1.33
Sequence the book by recipe name.

Tip: To get a unique sequential number for each row in the result set use the ROW_NUMBER() function. See Microsoft Docs.
	 The following can be a column in your select statement: Sequence = ROW_NUMBER() over (order by colum name) , replace column name with the name of the column that the row number should be sorted
*/
insert Cookbook(UserId, CookbookName, CookbookActive, Price, DateCreated)
select u.UsersId, concat('Recipes by ', u.FirstName, ' ', u.LastName), 1, (count(r.RecipeName)* 1.33), GETDATE() 
from Users u 
join Recipe r 
on u.UsersId = r.UsersId
where u.UserName = 'YS945'
group by u.FirstName, u.LastName, u.UsersId

;
with x as(
	select CookbookId = c.CookbookId, RecipeId = r.RecipeId, RecipeName = r.RecipeName, RecipeSequence = ROW_NUMBER() over (order by r.RecipeName)
	from Recipe r 
	join Users u 
	on r.UsersId = u.UsersId 
	join Cookbook c 
	on u.UsersId = c.UserId
	where u.UserName = 'YS945'
	and c.CookbookName like 'Recipes by%'
)
insert CookbookRecipe(CookbookId, RecipeId, RecipeSequence)
select x.CookbookId, x.recipeId, x.RecipeSequence
from x

/*
4) Sometimes the calorie count of of an ingredient changes and we need to change the calorie total for all recipes that use that ingredient.
Our staff nutritionist will specify the amount to change per measurement type, and of course multiply the amount by the quantity of the ingredient.
For example, the calorie count for butter went down by 2 per ounce, and 10 per stick of butter. 
Write an update statement that changes the number of calories of a recipe for a specific ingredient. 
The statement should include at least two measurement types, like the example above. 
*/
--oil went down 2 calories per tablespoon and 32 per cup
update r 
set Calories = case 
				when m.MeasurementType = 'cup' then (r.calories -(ri.Amount * 32))
				when m.MeasurementType = 'tbsp' then (r.calories -(ri.Amount * 2))
				end
from Recipe r 
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
join Ingredient i 
on ri.IngredientId = i.IngredientId
join Measurement m 
on ri.MeasurementId = m.MeasurementId
where i.IngredientName = 'oil'


/*
5) We need to send out alerts to users that have recipes sitting in draft longer the average amount of time that recipes have taken to be published.
Produce a result set that has 4 columns (Data values in brackets should be replaced with actual data)
	User First Name, 
	User Last Name, 
	email address (first initial + lastname@heartyhearth.com),
	Alert: 
		Your recipe [recipe name] is sitting in draft for [X] hours.
		That is [Z] hours more than the average [Y] hours all other recipes took to be published.
*/

;
with x as(
	select Avg = avg(datediff(hour, r.DateDrafted, r.DatePublished))
	from Recipe r 
)
	select FirstName = u.FirstName, LastName = u.LastName, EmailAddress = lower(concat(substring(u.FirstName, 1, 1), u.LastName, '@heartyhearth.com')),
			Alert = concat('Your recipe ', r.RecipeName, ' is sitting in draft for ', 
		(datediff(hour, r.DateDrafted, getdate())), ' hours. That is ',
		((datediff(hour, r.DateDrafted, getdate())) - x.Avg), 
		' hours more than the average ', x.Avg, ' hours all other recipes took to be published.' )
		from Recipe r
		join Users u 
		on r.UsersId = u.UsersId
		cross join x
		where r.RecipeStatus = 'drafted'
		and (datediff(hour, r.DateDrafted, getdate())) > x.Avg


/*
6) We want to send out marketing emails for books. Produce a result set with one row and one column "Email Body" as specified below.
The email should have a unique guid link to follow, which should be shown in the format specified. 

Email Body:
Order cookbooks from HeartyHearth.com! We have [X] books for sale, average price is [Y]. You can order them all and receive a 25% discount, for a total of [Z].
Click <a href = "www.heartyhearth.com/order/[GUID]">here</a> to order.
*/
select EmailBody = concat('Order cookbooks from HeartyHearth.com! We have ', count(c.CookbookName), ' books for sale, average price is ', 
	 str((avg(c.Price)),5,2), '. You can order them all and receive a 25% discount, for a total of ', str(((sum(c.Price)) *.75), 5, 2), '. Click <a href = "www.heartyhearth.com/order/', newId(), '">here</a> to order.')
		from Cookbook c 
		
