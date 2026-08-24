use RecipeDB
go

delete Recipe
delete Users
delete Cuisine
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