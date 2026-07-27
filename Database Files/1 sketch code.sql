--AS When checking a int, we wouldn't check that its not blank as it can't be. We would check if its greater then 0. Please make sure you do it correctly when you make the tables.
    --Same thing by date, it can't be blank. You can check that its not in the future etc.
/*
Recipe
    recipeId
        not null, primary key
    cuisineId
        not null, foreign key
    recipeName
        varchar(80), not null, not blank, unique
    calories
        int, not null, >0
    recipeimage
        varchar(100), not null, not blank
        RecipeImage as replace(concat ("recipe", recipename_, "jpg"), ' ', "_")
    --AS When making a computed column, you don't need a datatype or basic constraints
    recipestatus
        varchar (10), not null, not blank
        recipeStatus = case
            when datedrafted is not null and date published is null and date archived is null then "drafted"
            else "archived"
          when date drafted is not null and date published is not null and date archived is null then "published"
    date drafted
        date, not null, not in future, < date published, archived 
    date published
        datetime, null, not in future, > date drafted, < date archived
    --AS Keep in mind that sometimes the recipe is archived and never published
    date archived 
        date, null, not in future, > date drafted and archived
    user Id
        not null, foreign key



cuisine
    cuisineId
        not null, identity primary key
    cuisineType
        not null, varchar(35), not blank, unique

            
Ingredients
    ingredientId
        not null, primary key
    ingredient name
        varchar(100), not null, not blank, unique
    ingredientimage
        varchar(100), not null, not blank
        IngredientImage as replace(concat ("ingredient", ingredientname_, "jpg"), ' ', "_")


Measurement
    measurement id
        not null, identity primary key
    measurement type
        not null, varchar(20), not blank, unique

RecipeIngredient
    recipeIngredient id 
        not null, primary key
    recipe Id
        foreign key, not null
    ingredientId
        foreign key, not null
    IngredientSequence
        int, not null, not blank, unique
    measurementId
        foreign key, not null
    amount
        decimal, not null, not blank
    multi column constraint
        recipe id and ingredient id is unique

RecipeDirections
    --AS Missing a PK
    recipe id
        not null, foreign key
    direction
        varchar(300), not null, not blank
    DirectionSequence
        int not null, not blank
    constraint recipe id and sequence are unique

Meals
    --AS Missing date created and image for meal
    meal id
        not null, primary key
    meal name
        varchar(100), not null, not blank, unique
    active 
        bit, not null, not blank
    date created
        not null, date, not in futute
    meal image
        varchar(100), not null, not blank
        MealImage as replace(concat ("meal", mealname_, "jpg"), ' ', "_")
    user id
        not null, foreign key, not blank

Course
    courseId
        not null, primary key
    course type
        varchar(25), not null, unique
    --AS Seq should be unique
    sequence
        int, not null, not blank

MealCourse
    mealcourseId
        not null primary key
    mealId
        not null, foreign key
    course id
        not null foreign key
    constraint meal and course is unique

MealCourseRecipe
    meal course recipeId
        not null, primary key
    mealcourseId
        not null, foreign key
    recipe id 
        not null, foreign key
    MainDish  
        bit, not null, not blank
    --AS You can make sure recipe is not repeated twice IN THE SAME MEALCOURSE

User
    userID
        not null, primary key
    first name
        varchar(35), not null, not blank
    last name 
        varchar(35), not null, not blank
    user name
        varchar(50), not null, not blank
            constraint username is unique

Cookbook
    cookbookId
        not null, primary key
    CookbookName
        varchar(100), not null, not blank, unique
    Price
        decimal, not null
    active
       bit, not null, not blank
    userId
        not null, foreign key
    datecreated
        not null, not blank, date
    cookbook image
        varchar(100), not null, not blank
        CookbookImage as replace(concat ("cookbook", cookbookname_, "jpg"), ' ', "_")

    
CookbookRecipe
        cookbookRecipeId
            not null, primary key
        cookbookId
            not null, foreign key
        recipeId
            not null, foreign key
        recipeSequence
            int, not null, not blank
        constraint cookbook and recipe are unique
        constraint cookbook and recipe sequence unique

*/