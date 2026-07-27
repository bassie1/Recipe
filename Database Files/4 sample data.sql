--AS Amazing job! 100% 
use RecipeDB
go 

delete RecipeIngredient 
delete RecipeDirections
delete MealCourseRecipe
delete MealCourse
delete CookbookRecipe
delete Cookbook
delete Measurement
delete Course
delete Recipe
delete Meal
delete Users
delete Cuisine
delete Ingredient
go 

--ingredient
insert Ingredient(IngredientName)
select 'sugar'
union select 'oil'
union select 'egg'
union select 'eggs'
union select 'flour'
union select 'vanilla sugar'
union select 'baking powder'
union select 'baking soda'
union select 'chocolate chips'
union select 'granny smith apples'
union select 'vanilla yogurt'
union select 'orange juice'
union select 'honey'
union select 'ice cubes'
union select 'club bread'
union select 'butter'
union select 'shredded cheese'
union select 'garlic'
union select 'black pepper'
union select 'salt'
union select 'vanilla pudding'
union select 'whipped cream cheese'
union select 'sour cream cheese'
union select 'onion'
union select 'green pepper'
union select 'red pepper'
union select 'mushrooms'
union select 'Rice Crispies'
union select 'peanut butter'
union select 'light corn syrup'
union select 'baking chocolate'
union select 'potatoes'
union select 'onion'
union select 'pasta'
union select 'pasta sauce'
union select 'lettuce'
union select 'tomato'
union select 'cucumber'
union select 'pickles'
union select 'lemon juice'
union select 'garlic powder'
union select 'onion powder'
go 

--Cuisine
insert Cuisine(CuisineType)
select 'American'
union select 'French'
union select 'English'
union select 'Jewish'
union select 'Italian'
union select 'Israeli'
go 

--Users
insert Users(FirstName, LastName, UserName)
select 'Reva', 'Einhorn', 'RE123'
union select 'Chana', 'Smith', 'CS435'
union select 'Mindy', 'Herszaft', 'MH564'
union select 'Boruch', 'Katzenstein', 'BK591'
union select 'Yehuda', 'Schwartz', 'YS945'
go 


--Recipe
;
with x as(
select 
    RecipeName = 'Chocolate Chip Cookies', CuisineType = 'American', UserName = 'RE123', Calories = 120, DateDrafted = '10/23/23', DatePublished = null, DateArchived = getdate()
union select 'Apple Yogurt Smoothie', 'French', 'MH564', 98, '10/23/23', '07/30/24', null
union select 'Cheese Bread', 'English', 'YS945', 123, '06/27/23', '09/23/24', getdate()
union select 'Butter Muffins', 'American', 'YS945', 89, '02/13/23', null, null
union select 'Fancy Scrambled Eggs', 'American', 'BK591', 76, '12/29/23', '10/10/24', getdate()
union select 'Peanut Chews', 'English', 'RE123', 134, '07/21/23', null, '09/16/24'
union select 'Potato Latkes', 'Jewish', 'RE123', 178, '11/14/23', '11/24/24', null
union select 'Cheesy Pasta', 'Italian', 'BK591', 145, '03/18/23', '04/21/24', '10/23/24'
union select 'Colorful Toss Salad', 'Israeli', 'YS945', 78, '10/04/23', '04/10/24', null
)
insert Recipe(CuisineId, UsersId, RecipeName, Calories, DateDrafted, DatePublished, DateArchived)
select c.CuisineId, u.UsersId, x.RecipeName, x.Calories, x.DateDrafted, x.DatePublished, x.DateArchived
from x 
join Cuisine c 
on x.CuisineType = c.CuisineType
join Users u 
on x.UserName = u.UserName
go 

--Course
insert Course(CourseType, CourseSequence)
select 'Appetizer', 1
union select 'Main Course', 2
union select 'Dessert', 3
go 

--Meal
;
with x as(
select UserName = 'CS435', MealName = 'Breakfast Bash',MealActive = 1, DateCreated = '10/10/24'
union select 'MH564', 'Light and Easy Supper', 1, '09/15/24'
union select 'YS945', 'Shabbos Party', 0, '07/29/24'
union select 'CS435', 'Delicious Dinner', 1, '11/11/24'
)
insert Meal(UserId, MealName, MealActive, DateCreated)
select u.UsersId, x.MealName, x.MealActive, x.DateCreated
from x 
join Users u 
on x.UserName = u.UserName
go 

--Measurement
insert Measurement(MeasurementType)
select 'cup'
union select 'cups'
union select 'tsp'
union select 'tbsp'
union select 'oz'
union select 'cloves'
union select 'pinch'
union select 'stick'
union select 'can'
union select 'sprinkle'
union select 'bag'
union select 'shake'
go 

--Cookbook
; 
with x as(
select CookbookName = 'Treats for Two', CookbookActive = 1, Price = 30, DateCreated = getdate(), UserName = 'RE123'
union select 'Baker''s Collection', 1, 28, getdate(), 'CS435'
union select 'Quick and Easy', 0, 25, getdate(), 'MH564'
union select 'Dairy Delectables',  1, 32, getdate(),'MH564' 
)
insert Cookbook(UserId, CookbookName, CookbookActive, Price, DateCreated)
select u.UsersId, x.CookbookName, x.CookbookActive, x.Price, x.DateCreated
from x 
join Users u
on x.UserName = u.UserName
go 

--CookbookRecipe
; 
with x as(
    select CookbookName = 'Treats for Two', RecipeName = 'Chocolate Chip Cookies', RecipeSequence = 1
    union select 'Treats for Two', 'Apple Yogurt Smoothie', 2
    union select 'Treats for Two', 'Cheese Bread', 3
    union select 'Treats for Two', 'Butter Muffins', 4
    union select 'Baker''s Collection', 'Chocolate Chip Cookies', 1
    union select 'Baker''s Collection', 'Butter Muffins', 2
    union select 'Baker''s Collection', 'Peanut Chews', 3
    union select 'Quick and Easy', 'Potato Latkes', 1
    union select 'Quick and Easy', 'Cheesy Pasta', 2
    union select 'Quick and Easy', 'Colorful Toss Salad', 3
    union select 'Quick and Easy', 'Cheese Bread', 4
    union select 'Quick and Easy', 'Apple Yogurt Smoothie', 5
    union select 'Dairy Delectables', 'Butter Muffins', 1
    union select 'Dairy Delectables', 'Cheese Bread', 2
    union select 'Dairy Delectables', 'Fancy Scrambled Eggs', 3
    union select 'Dairy Delectables', 'Apple Yogurt Smoothie', 4
    union select 'Dairy Delectables', 'Cheesy Pasta', 5
)
insert CookbookRecipe(CookbookId, RecipeId, RecipeSequence)
select  c.CookbookId, r.RecipeId, x.RecipeSequence
from x 
join Recipe r 
on x.RecipeName = r.RecipeName
join Cookbook c 
on x.CookbookName = c.CookbookName
go 

--MealCourse
;
with x as(
    select MealName = 'Breakfast Bash', CourseType = 'Main Course'
    union select 'Breakfast Bash', 'Appetizer'
    union select 'Light and Easy Supper', 'Appetizer'
    union select 'Light and Easy Supper', 'Main Course'
    union select 'Light and Easy Supper', 'Dessert'
    union select 'Shabbos Party', 'Dessert'
    union select 'Delicious Dinner', 'Appetizer'
    union select 'Delicious Dinner', 'Main Course'
    )
insert MealCourse(MealId, CourseId)
select m.MealId, cr.CourseId
from x
join Meal m 
on x.MealName = m.MealName
join Course cr 
on x.CourseType = cr.CourseType

--MealCourseRecipe
;
with x as(
    select MealName = 'Breakfast Bash', RecipeName = 'Cheese Bread', CourseType ='Main Course', MainDish = 1
    union select 'Breakfast Bash', 'Butter Muffins', 'Main Course', 0
    union select 'Breakfast Bash', 'Apple Yogurt Smoothie', 'Appetizer', 0
    union select 'Light and Easy Supper', 'Colorful Toss Salad', 'Appetizer', 0
    union select 'Light and Easy Supper', 'Fancy Scrambled Eggs', 'Main Course', 1
    union select 'Light and Easy Supper', 'Cheesy Pasta', 'Main Course', 0
    union select 'LIght and Easy Supper', 'Peanut Chews', 'Dessert', 0
    union select 'Shabbos Party', 'Chocolate Chip Cookies', 'Dessert', 0
    union select 'Shabbos Party', 'Peanut Chews', 'Dessert', 0
    union select 'Delicious Dinner', 'Apple Yogurt Smoothie', 'Appetizer', 0
    union select 'Delicious Dinner', 'Potato Latkes', 'Main Course', 1
    union select 'Delicious Dinner', 'Colorful Toss Salad', 'Main Course', 0
)
insert MealCourseRecipe(MealCourseId, RecipeId, MainDish)
select mc.MealCourseId, r.RecipeId, x.MainDish 
from x 
join Meal m 
on x.MealName = m.MealName
join course c 
on x.CourseType = c.CourseType 
join MealCourse mc 
on c.CourseId = mc.CourseId 
and m.MealId = mc.MealId
join Recipe r 
on x.recipeName = r.RecipeName

--Recipe Directions
; 
with x as(
    select RecipeName = 'Chocolate Chip Cookies', Direction = 'combine sugar, oil and eggs in a bowl', DirectionSequence = 1
    union select 'Chocolate Chip Cookies', 'mix well', 2
    union select 'Chocolate Chip Cookies', 'add flour, vanilla sugar, baking powder and baking soda', 3
    union select 'Chocolate Chip Cookies', 'beat for 5 minutes', 4
    union select 'Chocolate Chip Cookies', 'add chocolate chips', 5
    union select 'Chocolate Chip Cookies', 'freeze for 1-2 hours', 6
    union select 'Chocolate Chip Cookies', 'roll into balls and place spread out on a cookie sheet', 7
    union select 'Chocolate Chip Cookies', 'bake on 350 for 10 min.', 8
    union select 'Apple Yogurt Smoothie', 'Peel the apples and dice', 1
    union select 'Apple Yogurt Smoothie', 'Combine all ingredients in bowl except for apples and ice cubes', 2
    union select 'Apple Yogurt Smoothie', 'mix until smooth', 3
    union select 'Apple Yogurt Smoothie', 'add apples and ice cubes', 4
    union select 'Apple Yogurt Smoothie', 'pour into glasses', 5
    union select 'Cheese Bread', 'Slit bread every 3/4 inch', 1
    union select 'Cheese Bread', 'Combine all ingredients in bowl', 2
    union select 'Cheese Bread', 'fill slits with cheese mixture', 3
    union select 'Cheese Bread', 'wrap bread into a foil and bake for 30 minutes', 4
    union select 'Butter Muffins', 'Cream butter with sugars', 1
    union select 'Butter Muffins', 'Add eggs and mix well', 2
    union select 'Butter Muffins', 'Slowly add rest of ingredients and mix well', 3
    union select 'Butter Muffins', 'fill muffin pans 3/4 full and bake for 30 minutes', 4
    union select 'Fancy Scrambled Eggs', 'heat butter in frying pan', 1
    union select 'Fancy Scrambled Eggs', 'saute onion and peppers until soft', 2
    union select 'Fancy Scrambled Eggs', 'add mushrooms, saute', 3
    union select 'Fancy Scrambled Eggs', 'whisk eggs', 4
    union select 'Fancy Scrambled Eggs', 'add eggs and cheese and mix until ready', 5
    union select 'Peanut Chews', 'Melt peanut butter, sugar, corn syrup', 1
    union select 'Peanut Chews', 'Add cereal and mix to coat', 2
    union select 'Peanut Chews', 'Spread into a pan', 3
    union select 'Peanut Chews', 'Melt chocolate and drizzle over peanut chews', 4
    union select 'Potato Latkes', 'Grate peeled potato and onion', 1
    union select 'Potato Latkes', 'Add remaining ingredients besides the oil', 2
    union select 'Potato Latkes', 'Place spoonfuls in hot oil', 3
    union select 'Potato Latkes', 'Fry on each side until golden brown', 4
    union select 'Cheesy Pasta', 'Cook pasta according to package instructions', 1
    union select 'Cheesy Pasta', 'Add shredded cheese and pasta sauce', 2
    union select 'Cheesy Pasta', 'Mix over low heat until cheese is melted', 3
    union select 'Colorful Toss Salad', 'Cut all vegetables into small pieces', 1
    union select 'Colorful Toss Salad', 'Combine in a bowl', 2
    union select 'Colorful Toss Salad', 'Add lettuce', 3
    union select 'Colorful Toss Salad', 'Add dressing ingredients and mix well', 4
)
insert RecipeDirections(RecipeId, Direction, DirectionSequence)
select r.RecipeId, x.Direction, x.DirectionSequence
from x 
join Recipe r 
on x.RecipeName = r.RecipeName
go 

--RecipeIngredient
;
with x as(
    select RecipeName = 'Chocolate Chip Cookies', IngredientName = 'Sugar', MeasurementType = 'cup', IngredientSequence = 1, Amount = 1
    union select 'Chocolate Chip Cookies', 'oil', 'cup', 2, .5
    union select 'Chocolate Chip Cookies', 'eggs', null, 3, 3
    union select 'Chocolate Chip Cookies', 'flour', 'cups', 4, 2
    union select 'Chocolate Chip Cookies', 'vanilla sugar', 'tsp', 5, 1
    union select 'Chocolate Chip Cookies', 'baking powder', 'tsp', 6, 2
    union select 'Chocolate Chip Cookies', 'baking soda', 'tsp', 7, .5
    union select 'Chocolate Chip Cookies', 'chocolate chips', 'cup', 8, 1
    union select 'Apple Yogurt Smoothie', 'granny smith apples', null, 1, 3 
    union select 'Apple Yogurt Smoothie', 'vanilla yogurt', 'cups', 2, 2
    union select 'Apple Yogurt Smoothie', 'sugar', 'tsp', 3, 2
    union select 'Apple Yogurt Smoothie', 'orange juice', 'cup', 4, .5
    union select 'Apple Yogurt Smoothie', 'honey', 'tbsp', 5, 2 
    union select 'Apple Yogurt Smoothie', 'ice cubes', null, 6, 5
    union select 'Cheese Bread', 'club bread', null, 1, 1
    union select 'Cheese Bread', 'butter', 'oz', 2, 4
    union select 'Cheese Bread', 'shredded cheese', 'oz', 3, 8
    union select 'Cheese Bread', 'garlic', 'cloves', 4, 2
    union select 'Cheese Bread', 'black pepper', 'tsp', 5, .25
    union select 'Cheese Bread', 'salt', 'pinch', 6, 1
    union select 'Butter Muffins', 'butter', 'stick', 1, 1
    union select 'Butter Muffins', 'sugar', 'cups', 2, 3
    union select 'Butter Muffins', 'vanilla pudding', 'tbsp', 3, 2
    union select 'Butter Muffins', 'eggs', null, 4, 4
    union select 'Butter Muffins', 'whipped cream cheese', 'oz', 5, 8
    union select 'Butter Muffins', 'sour cream cheese', 'oz', 6, 8
    union select 'Butter Muffins', 'flour', 'cup', 7, 1
    union select 'Butter Muffins', 'baking powder', 'tsp', 8, 2
    union select 'Fancy Scrambled Eggs', 'eggs', null, 1, 4
    union select 'Fancy Scrambled Eggs', 'butter', 'tbsp', 2, 1
    union select 'Fancy Scrambled Eggs', 'onion', null, 3, .5
    union select 'Fancy Scrambled Eggs', 'green pepper', null, 4, 1
    union select 'Fancy Scrambled Eggs', 'red pepper', null, 5, 1
    union select 'Fancy Scrambled Eggs', 'mushrooms', 'can', 6, 1
    union select 'Fancy Scrambled Eggs', 'salt', 'pinch', 7, null
    union select 'Fancy Scrambled Eggs', 'black pepper', 'pinch', 8, 1
    union select 'Fancy Scrambled Eggs', 'shredded cheese', 'sprinkle', 9, 1 
    union select 'Peanut Chews', 'Rice Crispies', 'cups', 1, 4
    union select 'Peanut Chews', 'peanut butter', 'cup', 2, 1
    union select 'Peanut Chews', 'sugar', 'cup', 3, 1
    union select 'Peanut Chews', 'light corn syrup', 'cup', 4, 1
    union select 'Peanut Chews', 'baking chocolate', 'oz', 5, 6
    union select 'Potato Latkes', 'potatoes', null, 1, 3
    union select 'Potato Latkes', 'onion', null, 2, 1
    union select 'Potato Latkes', 'egg', null, 3, 1
    union select 'Potato Latkes', 'flour', 'tbsp', 4, 2
    union select 'Potato Latkes', 'salt', 'tsp', 5, .5
    union select 'Potato Latkes', 'black pepper', 'pinch', 6, 1 
    union select 'Potato Latkes', 'oil', 'tbsp', 7, 2
    union select 'Cheesy Pasta', 'pasta', 'bag', 1, 1
    union select 'Cheesy Pasta', 'shredded cheese', 'cups', 2, 1.5
    union select 'Cheesy Pasta', 'pasta sauce', 'cups', 3, 2
    union select 'Colorful Toss Salad', 'lettuce', 'bag', 1, .5
    union select 'Colorful Toss Salad', 'green pepper', null, 2, 1
    union select 'Colorful Toss Salad', 'tomato', null, 3, 1
    union select 'Colorful Toss Salad', 'cucumber', null, 4, 2
    union select 'Colorful Toss Salad', 'pickles', null, 5, 2
    union select 'Colorful Toss Salad', 'oil', 'tbsp', 6, 1
    union select 'Colorful Toss Salad', 'lemon juice', 'tsp', 7, 2
    union select 'Colorful Toss Salad', 'salt', 'tsp', 8, .5
    union select 'Colorful Toss Salad', 'black pepper', 'shake', 9, 1
    union select 'Colorful Toss Salad', 'garlic powder', 'shake', 10, 1
    union select 'Colorful Toss Salad', 'onion powder', 'shake', 11, 1
)   
insert RecipeIngredient(RecipeId, Amount, MeasurementId, IngredientId, IngredientSequence)
select r.RecipeId, x.Amount, m.MeasurementId, i.IngredientId, x.IngredientSequence
from x 
join Recipe r 
on x.recipeName = r.RecipeName
left join Measurement m 
on x.MeasurementType = m.MeasurementType 
join Ingredient i 
on x.IngredientName = i.IngredientName