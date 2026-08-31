--AS Amazing job!! 
--use recipeDB
go 




drop table if exists RecipeIngredient
drop table if exists RecipeDirections
drop table if exists MealCourseRecipe
drop table if exists MealCourse
drop table if exists CookbookRecipe
drop table if exists Cookbook
drop table if exists measurement
drop table if exists Meal
drop table if exists Course 
drop table if exists recipe
drop table if exists Users 
drop table if exists cuisine
drop table if exists Ingredient
go 

create table dbo.Ingredient(
    IngredientId int not null identity primary key,
    IngredientName varchar(100) not null
        constraint ck_Ingredient_ingredient_name_cannot_be_blank check(IngredientName > ''),
        constraint u_Ingredient_ingredient_name unique(IngredientName),
    IngredientImage as replace(concat('ingredient', '_', ingredientname, '.', 'jpg'), ' ', '_') persisted
)
go 

create table dbo.Cuisine (
    CuisineId int not null identity primary key,
    CuisineType varchar(100) not null 
        constraint ck_Cuisine_cuisine_type_cannot_be_blank check(CuisineType > ''),
        constraint u_Cuisine_cuisine_type unique(CuisineType)
)
go 

create table dbo.Users(
    UsersId int not null identity primary key,
    FirstName varchar(35) not null 
        constraint ck_Users_first_name_cannot_be_blank check(FirstName > ''),
    LastName varchar(35) not null 
        constraint ck_Users_last_name_cannot_be_blank check(LastName > ''),
    UserName varchar(50) not null 
        constraint ck_Users_user_name_cannot_be_blank check(UserName > ''),
        constraint u_Users_user_name unique(UserName)
)
go 

create table dbo.Recipe (
    RecipeId int not null identity primary key,
    CuisineId int not null 
        constraint f_Cuisine_Recipe foreign key references Cuisine(CuisineId),
    UsersId int not null  
        constraint f_Users_Recipe foreign key references Users(UsersId),
    RecipeName varchar(100) not null 
        constraint ck_Recipe_recipe_name_cannot_be_blank check (RecipeName > ''),
        constraint u_Recipe_recipe_name unique(RecipeName),
    Calories int not null 
        constraint ck_Recipe_calories_cannot_be_negative check(Calories > 0),
    RecipeImage as replace(concat ('recipe', '_', recipeName, '.', 'jpg'), ' ', '_') persisted,
    DateDrafted date not null 
        constraint ck_Recipe_date_drafted_must_be_after_the_start_of_website check(DateDrafted between '01/23/22' and getdate()),
    DatePublished date null 
        constraint ck_Recipe_date_published_cannot_be_in_the_future check(DatePublished <= getdate()),
    DateArchived date null 
        constraint ck_Recipe_date_archived_cannot_be_in_the_future check(DateArchived <= getdate()),
    RecipeStatus as case 
        when DateDrafted is not null and DatePublished is null and DateArchived is null then 'drafted'
        when DateDrafted is not null and DatePublished is not null and DateArchived is null then 'published'
        else 'archived' 
        end persisted,
    constraint ck_Recipe_date_drafted_must_be_before_date_published check(DateDrafted < DatePublished),
    constraint ck_Recipe_date_drafted_must_be_before_archived check(DateDrafted < DateArchived),
    constraint ck_Recipe_date_published_must_be_before_date_archived check(DatePublished < DateArchived),
)
go 

create table dbo.Course(
    CourseId int not null identity primary key,
    CourseType varchar(30) not null 
        constraint ck_Course_course_type_cannot_be_blank check(CourseType > ''),
        constraint u_Course_course_type unique(CourseType),
    CourseSequence int not null 
        constraint ck_Course_course_sequence_must_be_greater_than_zero check(CourseSequence > 0),
        constraint u_Course_course_sequence unique(CourseSequence)
)
go 

create table dbo.Meal(
    MealId int not null identity primary key,
    UsersId int not null  
        constraint f_Users_Meal foreign key references Users(UsersId),
    MealName varchar(100) not null 
        constraint ck_Meal_meal_name_cannot_be_blank check(MealName > ''),
        constraint u_Meal_meal_name unique(MealName),
    MealActive bit not null,
    DateCreated date not null 
        constraint ck_Meal_date_created_must_be_after_start_of_website check(DateCreated between '01/23/22' and getdate()),
    MealImage as replace(concat ('meal', '_', MealName, '.', 'jpg'), ' ', '_') persisted
)
go 

create table dbo.Measurement(
    MeasurementId int not null identity primary key,
    MeasurementType varchar(20) null 
        constraint u_Measurement_measurement_type unique(MeasurementType)
)
go 

create table dbo.Cookbook(
    CookbookId int not null identity primary key,
    UsersId int not null 
        constraint f_Users_Cookbook foreign key references Users(UsersId),
    CookbookName varchar(100) not null 
        constraint ck_Cookbook_cookbook_name_cannot_be_blank check(CookbookName > ''),
        constraint u_Cookbook_cookbook_name unique(CookbookName),
    CookbookActive bit not null,
    Price decimal (5,2) not null 
        constraint ck_Cookbook_price_must_be_greater_than_zero check(Price > 0),
    DateCreated date not null 
        constraint ck_Cookbook_date_created_must_be_after_start_of_website check(DateCreated between '01/23/22' and getdate()),
    CookbookImage as replace(concat ('cookbook', '_', cookbookname, '.', 'jpg'), ' ', '_') persisted
)
go 

create table dbo.CookbookRecipe(
    CookbookRecipeId int not null identity primary key,
    CookbookId int not null 
        constraint f_Cookbook_CookbookRecipe foreign key references Cookbook(CookbookId),
    RecipeId int not null 
        constraint f_Recipe_CookbookRecipe foreign key references Recipe(RecipeId),
    RecipeSequence int not null 
        constraint ck_CookbookRecipe_recipe_sequence_is_greater_than_zero check(RecipeSequence > 0),
    constraint u_CookbookRecipe_cookbookId_and_RecipeId unique(CookbookId, RecipeId),
    constraint u_CookbookRecipe_cookbookId_and_recipe_sequence unique(CookbookId, RecipeSequence)
)
go 

create table dbo.MealCourse(
    MealCourseId int not null identity primary key,
    MealId int not null 
        constraint f_Meal_MealCourse foreign key references Meal(MealId),
    CourseId int not null 
        constraint f_Course_MealCourse foreign key references Course(CourseId),
    constraint u_MealCourse_mealId_and_courseId unique(MealId, CourseId)
)
go 

create table dbo.MealCourseRecipe(
    MealCourseRecipeId int not null identity primary key,
    MealCourseId int not null 
        constraint f_MealCourse_MealCourseRecipe foreign key references MealCourse(MealCourseId),
    RecipeId int not null 
        constraint f_Recipe_MealCourseRecipe foreign key references Recipe(RecipeId),
    MainDish bit not null,
    constraint u_MealCourseRecipe_MealCourseId_RecipeId unique(MealCourseId, RecipeId)
)
go 

create table dbo.RecipeDirections(
    RecipeDirectionsId int not null identity primary key,
    RecipeId int not null 
        constraint f_Recipe_RecipeDirections foreign key references Recipe(RecipeId),
    Direction varchar(300) not null 
        constraint ck_RecipeDirections_direction_cannot_be_blank check(Direction > ''),
    DirectionSequence int not null 
        constraint ck_RecipeDirections_direction_sequence_must_be_greater_than_zero check(DirectionSequence > 0),
        constraint u_RecipeDirections_RecipeId_and_DirectionSequence unique(RecipeId, DirectionSequence)
)
go 

create table dbo.RecipeIngredient(
    RecipeIngredientId int not null identity primary key,
    RecipeId int not null 
        constraint f_Recipe_RecipeIngredient foreign key references Recipe(RecipeId),
    IngredientId int not null 
        constraint f_Ingredient_RecipeIngredient foreign key references Ingredient(IngredientId),
    MeasurementId int null 
        constraint f_Measurement_RecipeIngredient foreign key references Measurement(MeasurementId),
    IngredientSequence int not null 
        constraint ck_RecipeIngredient_ingredient_sequence_must_be_greater_than_zero check(IngredientSequence > 0),
    Amount decimal (4,2) null 
        constraint ck_RecipeIngredient_amount_must_be_greater_than_zero check(Amount > 0),
    constraint u_RecipeIngredient_RecipeId_IngredientSequence unique(RecipeId, IngredientSequence)
)
go 