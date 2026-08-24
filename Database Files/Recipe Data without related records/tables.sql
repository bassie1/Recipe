use recipeDB
go 

drop table if exists recipe
drop table if exists Users 
drop table if exists cuisine
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