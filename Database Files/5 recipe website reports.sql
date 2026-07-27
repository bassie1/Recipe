--AS Great job!100%
use RecipeDB 
go 

/*
Our website development is underway! 
Below is the layout of the pages on our website, please provide the SQL to produce the necessary result sets.

Note: 
a) When the word 'specific' is used, pick one record (of the appropriate type, recipe, meal, etc.) for the query. 
    The way the website works is that a list of items are displayed and then the user picks one and navigates to the "details" page.
b) Whenever you have a record for a specific item include the name of the picture for that item. That is because the website will always show a picture of the item.
*/

/*
Home Page
    One result set with the number of recipes, meals, and cookbooks. Each row should have a column with the item name (Ex: Recipes) and a column with the count.
*/
select ItemName = 'Recipes', Count = count(r.RecipeName)
from Recipe r 
union select 'Meals', count(m.MealName)
from Meal m 
union select 'Cookbooks', count(c.CookbookName)
from Cookbook c

/*
Recipe list page:
    List of all Recipes that are either published or archived, published recipes should appear at the top. 
	Archived recipes should appear gray. Surround the archived recipe with <span style="color:gray">recipe name</span>
    In the resultset show the Recipe with its status, dates it was published and archived in mm/dd/yyyy format (blank if not archived), user, number of calories and number of ingredients.
    Tip: You'll need to use the convert function for the dates
*/

select  RecipeName =
    case 
    when r.RecipeStatus = 'archived' then concat('<span style="color:gray">', r.RecipeName, '</span>')
    else r.RecipeName
    end, 
    r.RecipeStatus, DatePublished = isnull(convert(varchar, r.DatePublished, 101), ''), DateArchived = isnull(convert(varchar, r.DateArchived, 101), ''), u.UserName, r.Calories, NumberOfIngredients = count(ri.IngredientId) 
from Recipe r 
join Users u 
on r.UsersId = u.UsersId
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId 
group by r.RecipeName, r.RecipeStatus, DatePublished, DateArchived, u.UserName, r.Calories
having r.RecipeStatus <> 'drafted'
order by r.RecipeStatus desc


/*
Recipe details page:
    Show for a specific recipe (three result sets):
        a) Recipe header: recipe name, number of calories, number of ingredients and number of steps.
        b) List of ingredients: show the measurement quantity, measurement type and ingredient in one column, sorted by sequence. Ex. 1 Teaspoon Salt  
        c) List of prep steps sorted by sequence.
*/
--a
select r.RecipeName, r.Calories, NumOfIngredients = count(distinct ri.IngredientId), NumOfSteps = count(distinct rd.RecipeDirectionsId), r.RecipeImage
from Recipe r 
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId 
join RecipeDirections rd 
on r.RecipeId = rd.RecipeId 
where r.RecipeName = 'Potato Latkes'
group by r.RecipeName, r.Calories, r.RecipeImage

 
--b
select IngredientList = concat(ri.Amount, ' ', m.MeasurementType, ' ', i.IngredientName)
from Ingredient i 
join RecipeIngredient ri 
on i.IngredientId = ri.IngredientId
left join Measurement m 
on ri.MeasurementId = m.MeasurementId 
join Recipe r 
on ri.RecipeId = r.RecipeId 
where r.RecipeName = 'Potato Latkes'
order by ri.IngredientSequence

--c
select r.RecipeName, rd.Direction
from RecipeDirections rd 
join Recipe r 
on rd.RecipeId = r.RecipeId
where r.RecipeName = 'Potato Latkes'
order by rd.DirectionSequence

/*
Meal list page:
    For all active meals, show the meal name, user that created the meal, number of calories for the meal, number of courses, and number of recipes per each meal, sorted by name of meal
*/
select m.MealName, u.UserName, NumOfCalories = sum(r.Calories), NumOfCourses = count(distinct mc.CourseId), NumOfRecipes = count(r.RecipeName)
from Users u 
join Meal m 
on u.UsersId = m.UserId
join MealCourse mc 
on m.MealId = mc.MealId
join MealCourseRecipe mcr 
on mc.MealcourseId = mcr.MealCourseId
join Recipe r 
on mcr.RecipeId = r.RecipeId
where m.MealActive = 1
group by m.MealName, m.MealActive, u.UserName
order by m.MealName

/*
Meal details page:
    Show for a specific meal:
        a) Meal header: meal name, user, date created.
        b) List of all recipes: Result set should have one column, including the course type, whether the dish is serverd as main/side (if it's the main course), and recipe name. 
			Format for main course: CourseType: Main/Side dish - Recipe Name. 
            Format for non-main course: CourseType: Recipe Name
            Main dishes of the main course should be bold, using the bold tags as shown below
                ex: 
                    Appetizer: Mixed Greens
                    <b>Main: Main dish - Onion Pastrami Chicken</b>
					Main: Side dish - Roasted cucumbers with mustard
*/
--a
select m.MealName, u.UserName, m.DateCreated, m.MealImage
from Meal m 
join Users u 
on m.UserId = u.UsersId
where m.MealName = 'Delicious Dinner'

--b
select MealDetails = case 
    when c.CourseType = 'Main Course'  and mcr.MainDish = 1 then concat('<b>', c.CourseType, ': ',  'Main dish', ' - ', r.RecipeName, '</b>')
    when c.CourseType = 'Main Course' and mcr.MainDish = 0 then concat(c.CourseType, ': ', 'Side dish', ' - ', r.RecipeName)
    else concat(c.CourseType, ': ', r.RecipeName)
    end
from Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on mc.CourseId = c.CourseId
join MealCourseRecipe mcr 
on mc.MealCourseId = mcr.MealCourseId 
join Recipe r 
on mcr.RecipeId = r.RecipeId
where m.MealName = 'Delicious Dinner'

/*
Cookbook list page:
    Show all active cookbooks with author and number of recipes per book. Sorted by book name.
*/
select c.CookbookName, u.FirstName, u.LastName, RecipesPerBook = count(cr.RecipeId), c.CookbookImage
from Cookbook c 
join Users u 
on c.UserId = u.UsersId
join CookbookRecipe cr 
on c.CookbookId = cr.CookbookId
where c.CookbookActive = 1
group by c.CookbookName, u.FirstName, u.LastName, c.CookbookActive, c.CookbookImage
order by c.CookbookName

/*
Cookbook details page:
    Show for specific cookbook:
    a) Cookbook header: cookbook name, user, date created, price, number of recipes.
    b) List of all recipes in the correct order. Include recipe name, cuisine and number of ingredients and steps.  
        Note: User will click on recipe to see all ingredients and steps.
*/
--a
select c.CookbookName, u.UserName, c.DateCreated, c.Price, NumOfRecipes = count(cr.RecipeId), c.CookbookImage 
from Cookbook c 
join Users u 
on c.UserId = u.UsersId
join CookbookRecipe cr 
on c.CookbookId = cr.CookbookId
where c.CookbookName = 'Dairy Delectables'
group by c.CookbookName, u.UserName, c.DateCreated, c.Price, c.CookbookImage

--b) List of all recipes in the correct order. Include recipe name, cuisine and number of ingredients and steps.

select r.RecipeName, cu.CuisineType, NumOfIngredients = max(ri.IngredientSequence), NumOfSteps = max(rd.DirectionSequence)
from Cookbook c
join CookbookRecipe cr 
on c.CookbookId = cr.CookbookId
join Recipe r 
on cr.RecipeId = r.RecipeId
join Cuisine cu 
on r.CuisineId = cu.CuisineId
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId 
join RecipeDirections rd 
on r.RecipeId = rd.RecipeId
where c.CookbookName = 'Dairy Delectables'
group by r.RecipeName, cu.CuisineType, cr.RecipeSequence
order by cr.RecipeSequence


/*
April Fools Page:
    On April 1st we have a page with a joke cookbook. For that page provide the following.
    a) A list of all the recipes that are in all cookbooks. The recipe name should be the reverse of the real name with the first letter capitalized and all others lower case.
        There are matching pictures for those names, include the reversed picture names so that we can show the joke pictures.
        Note: ".jpg" file extension must be at the end of the reversed picture name EX: Recipe_Seikooc_pihc_etalocohc.jpg
    b) When the user clicks on any recipe they should see a spoof steps lists showing the step instructions for the LAST step of EACH recipe in the system. No sequence required.
        Hint: Use CTE
*/
--a
select c.CookbookName, 
    RecipeName = concat(upper(substring(reverse(r.RecipeName), 1, 1)), lower(substring(reverse(r.RecipeName), 2, len(r.RecipeName)))),
    RecipeImage = replace(concat ('recipe', '_',concat(upper(substring(reverse(r.RecipeName), 1, 1)), lower(substring(reverse(r.RecipeName), 2, len(r.RecipeName)))), '.jpg'), ' ', '_')
from Cookbook c 
join CookbookRecipe cr 
on c.CookbookId = cr.CookbookId 
join Recipe r 
on cr.RecipeId = r.RecipeId 

--b
;
with x as(
    select LastStep = max(rd.DirectionSequence), r.RecipeName
    from RecipeDirections rd 
    join Recipe r 
    on rd.RecipeId = r.RecipeId
    group by r.RecipeName
)
    select  rd.Direction
    from RecipeDirections rd
    join Recipe r 
    on rd.RecipeId = r.RecipeId
    join x 
    on x.RecipeName = r.RecipeName
    where rd.DirectionSequence = x.LastStep


/*
For site administration page:
5 seperate reports
    a) List of how many recipes each user created per status. Show 0 if user has no recipes at all.
    b) List of how many recipes each user created and average amount of days that it took for the user's recipes to be published.
    c) For each user, show three columns: Total number of meals, Total Active meals, Total Inactive meals. Show 0 if none
        Hint: For active/inactive columns, use SUM function with CASE to only include in sum if active/inactive 
    d) For each user, show three columns: Total number of cookbooks, Total Active cookbooks, Total Inactive cookbooks. Show 0 if none
        Hint: For active/inactive columns, use SUM function with CASE to only include in sum if active/inactive 
    e) List of archived recipes that were never published, and how long it took for them to be archived.
*/
--a
select u.UserName, u.FirstName, u.LastName, r.RecipeStatus, NumOfRecipes = count(r.RecipeName)
from Users u 
left join Recipe r 
on u.UsersId = r.UsersId
group by u.UserName, u.FirstName, u.LastName, r.RecipeStatus

--b
select u.UserName, u.FirstName, u.LastName, NumOfRecipes = count(r.RecipeName), AvgDaysToPublish = avg(datediff(day, r.DateDrafted,  r.DatePublished))
from Users u 
join Recipe r 
on u.UsersId = r.UsersId
group by u.UserName, u.FirstName, u.LastName

--c) For each user, show three columns: Total number of meals, Total Active meals, Total Inactive meals. Show 0 if none
        --Hint: For active/inactive columns, use SUM function with CASE to only include in sum if active/inactive 
select u.UserName,  TotalMeals = count(m.MealName), 
    TotalActive = 
    sum(case when m.MealActive = 1 then 1
                when m.MealActive = 0 then 0
            end),
    TotalInactive = 
    sum(case when m.MealActive = 1 then 0
                when m.MealActive = 0 then 1
           end)
from Users u 
left join Meal m 
on u.UsersId = m.UserId 
group by u.UserName, m.MealActive

   -- d) For each user, show three columns: Total number of cookbooks, Total Active cookbooks, Total Inactive cookbooks. Show 0 if none
       -- Hint: For active/inactive columns, use SUM function with CASE to only include in sum if active/inactive 
select u.UserName,  TotalCookbooks = isnull(count(c.CookbookName), 0), 
    TotalActive = 
        sum(case when c.CookbookActive = 1 then 1
                        when c.CookbookActive = 0 then 0
                        end),
    TotalInactive = 
        sum(case when c.CookbookActive = 1 then 0
                        when c.CookbookActive = 0 then 1
                        end)
from Users u 
left join Cookbook c
on u.UsersId = c.UserId
group by u.UserName, c.CookbookActive   

--e) List of archived recipes that were never published, and how long it took for them to be archived.
select r.RecipeName, DaysToBeArchived = datediff(day, r.DateDrafted, r.DateArchived)
from Recipe r 
where r.RecipeStatus = 'archived' 
and r.DatePublished is null


/*
For user dashboard page:
    a) For a specific user, show one result set with the number of recipes, meals, and cookbooks. Each row should have a column with the item name (Ex: Recipes) and a column with the count.
        Tip: If you would like, you can use a CTE to get the User Id once instead of in each union select
    b) List of the user's recipes, display the status and the number of hours between the status it's in and the one before that. Omit recipes in drafted status.
    
    OPTIONAL CHALLENGE QUESTION
    c) Show a list of cuisines and the count of recipes the user has per cuisine, 0 if none
        Hint: Start by writing a CTE to give you cuisines for which the user does have recipes. 
*/
--a
;
with x as(
    select UserId = u.UsersId
    from Users u 
    where u.UserName = 'CS435'
)
select ItemName = 'Recipes', Count = count(r.RecipeName)
from Recipe r 
join x 
on x.UserId = r.UsersId 
union select 'Meals', count(m.MealName)
from Meal m 
join x 
on x.UserId = m.UserId
union select 'Cookbooks', count(c.CookbookName)
from Cookbook c 
join x 
on x.UserId = c.UserId

--b
select r.RecipeName, u.UserName, r.RecipeStatus, 
    HoursBetweenStatus = case when r.RecipeStatus = 'published' then datediff(hour, r.DateDrafted, r.DatePublished)
                              when r.RecipeStatus = 'archived' then datediff(hour, isnull(r.DatePublished, r.DateDrafted), r.DateArchived)
                              end
from Users u 
join Recipe r 
on u.UsersId = r.UsersId 
where r.RecipeStatus <> 'drafted'
and u.UserName = 'RE123'

-- OPTIONAL CHALLENGE QUESTION
    --c) Show a list of cuisines and the count of recipes the user has per cuisine, 0 if none
        --Hint: Start by writing a CTE to give you cuisines for which the user does have recipes.'        


