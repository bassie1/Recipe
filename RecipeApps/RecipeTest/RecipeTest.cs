using System.Data;

namespace RecipeTest
{
    public class RecipeTest
    {
        [SetUp]
        public void Setup()
        {
            DBManager.SetConnectionString("Server=tcp:devbk.database.windows.net,1433;Initial Catalog=RecipeDB;Persist Security Info=False;User ID=bkadmin;Password=Basyisroel1!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30");
        }

        [Test]
        public void LoadRecipe()
        {
            int recipeid = GetExistingRecipeId();
            Assume.That(recipeid > 0, "no recipes in DB, can't run test");
            TestContext.WriteLine("existing recipe with id = " + recipeid);
            TestContext.WriteLine("ensure that app loads recipe " + recipeid);
            DataTable dt = Recipe.Load(recipeid);
            int loadedid = 0;
            if (dt.Rows.Count > 0)
            {
                loadedid = (int)dt.Rows[0]["recipeid"];
            }
            Assert.IsTrue(loadedid == recipeid, loadedid + " <> " +recipeid);
            TestContext.WriteLine("Loaded recipe (" + loadedid + ")");
        }

        [Test]
        public void SearchRecipe()
        {
            string criteria = "a";
            int num = SQLUtility.GetFirstColumnFirstRowValue("select total = count(*) from recipe where recipename like '%" + criteria + "%'");
            Assume.That(num > 0, "There are no recipes that match the search for " + num);
            TestContext.WriteLine(num + " recipes that match " + criteria);
            TestContext.WriteLine("ensure that recipe search returns " + num + " rows");

            DataTable dt = Recipe.SearchRecipes(criteria);
            int results = dt.Rows.Count;
            Assert.IsTrue(results == num, "results of recipe search does not match num of recipes, " + results + " <> " + num);
            TestContext.WriteLine("Number of rows returned by recipe search is " + results);

        }

        [Test]
        public void InsertNewRecipe()
        {
            DataTable dt = SQLUtility.GetDataTable("select * from recipe where recipeid = 0");
            DataRow r = dt.Rows.Add();
            Assume.That(dt.Rows.Count == 1);
            int cuisineid = SQLUtility.GetFirstColumnFirstRowValue("select top 1 cuisineid from cuisine");
            Assume.That(cuisineid > 0, "can't run test, no cuisines in DB");

            int usersid = SQLUtility.GetFirstColumnFirstRowValue("select top 1 usersid from users");
            Assume.That(usersid > 0, "can't run test, no users in DB");

            int maxcalories = SQLUtility.GetFirstColumnFirstRowValue("select max(calories) from recipe");
            TestContext.WriteLine("insert recipe with calories = " + maxcalories);

            r["Cuisineid"] = cuisineid;
            r["Usersid"] = usersid;
            r["RecipeName"] = "Hot Pretzels " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            r["Calories"] = maxcalories;
            r["DateDrafted"] = "8/24/25";
            Recipe.Save(dt);

            int newid = SQLUtility.GetFirstColumnFirstRowValue("select * from recipe where calories = " + maxcalories);
            Assert.IsTrue(newid > 0, "recipe with calories = " + maxcalories + " is not found in DB");
            TestContext.WriteLine("recipe with " + maxcalories + " calories is found in DB with pk value = " + newid);
        }

        [Test]
        public void DeleteRecipe()
        {
            string sql = @" 
                select top 1 r.RecipeId, r.RecipeName
                from Recipe r
                left join CookbookRecipe cr 
                on cr.RecipeId = r.RecipeId
                left join MealCourseRecipe mcr
                on mcr.RecipeId = r.RecipeId
                where cr.CookbookRecipeId is null
                and mcr.MealCourseRecipeId is null
                order by r.RecipeId
                ";

            DataTable dt = SQLUtility.GetDataTable(sql);
            int recipeid = 0;
            string recipedesc = "";
            if (dt.Rows.Count > 0)
            {
                recipeid = (int)dt.Rows[0]["recipeid"];
                recipedesc = (string)dt.Rows[0]["recipename"];
            }
            Assume.That(recipeid > 0, "no recipes in DB, can't run test");
            TestContext.WriteLine("existing recipe with id = " + recipeid + " " + recipedesc);
            TestContext.WriteLine("ensure that app can delete " + recipeid);
            Recipe.Delete(dt);
            DataTable dtafterdelete = SQLUtility.GetDataTable("select * from recipe where recipeid = " + recipeid);
            Assert.IsTrue(dtafterdelete.Rows.Count == 0, "record with recipeid " + recipeid + " exists in DB");
            TestContext.WriteLine("record with recipeid " + recipeid + " does not exist in DB");
        }

        [Test]
        public void DeleteRecipesInCookbooks()
        {
            DataTable dt = SQLUtility.GetDataTable("select top 1 r.recipeid, r.recipename from recipe r join cookbookrecipe cr on r.recipeid = cr.recipeid");
            int recipeid = 0;
            string recipedesc = "";
            if (dt.Rows.Count > 0)
            {
                recipeid = (int)dt.Rows[0]["recipeid"];
                recipedesc = (string)dt.Rows[0]["recipename"];
            }
            Assume.That(recipeid > 0, "no recipes in cookbooks in DB, can't run test");
            TestContext.WriteLine("existing recipe in cookbook, with id = " + recipeid + " " + recipedesc);
            TestContext.WriteLine("ensure that app cannot delete " + recipeid);

            Exception ex = Assert.Throws<Exception>(() => Recipe.Delete(dt));

            TestContext.WriteLine(ex.Message);
        }

        [Test]
        public void ChangeExistingRecipeCalories()
        {
            int recipeid = GetExistingRecipeId();
            Assume.That(recipeid > 0, "no recipes in DB, can't run test");
            int calories = SQLUtility.GetFirstColumnFirstRowValue("select calories from recipe where recipeid = " + recipeid);
            TestContext.WriteLine("calories for recipeid " + recipeid + " is " + calories);
            calories = calories + 10;
            TestContext.WriteLine("change calories to " + calories);

            DataTable dt = Recipe.Load(recipeid);
            dt.Rows[0]["calories"] = calories;
            Recipe.Save(dt);

            int newcalories = SQLUtility.GetFirstColumnFirstRowValue("select calories from recipe where recipeid = " + recipeid);
            Assert.IsTrue(newcalories == calories, "calories for recipe (" + recipeid + ") = " + newcalories);
            TestContext.WriteLine("calories for recipe (" + recipeid + ") = " + calories);
        }

        [Test]
        public void ChangeExistingRecipeToInvalidRecipeName()
        {
            int recipeid = GetExistingRecipeId();
            Assume.That(recipeid > 0, "no recipes in DB, can't run test");
            string recipename = GetFirstColumnFirstRowValueAsString("select top 1 recipename from recipe where recipeid <> " + recipeid);
            string currentrecipename = GetFirstColumnFirstRowValueAsString("select top 1 recipename from recipe where recipeid = " + recipeid);
            Assume.That(recipename != "", "cannot run test because there is no other recipe in the table");
            TestContext.WriteLine("change recipeid " + recipeid + " from " + currentrecipename + " to " + recipename + " which is the name of a different recipe");

            DataTable dt = Recipe.Load(recipeid);
            dt.Rows[0]["recipename"] = recipename;
            Exception ex = Assert.Throws<Exception>(() => Recipe.Save(dt));
            TestContext.WriteLine(ex.Message);
        }

        [Test]
        public void ChangeExistingRecipeToInvalidDateDrafted()
        {
            int recipeid = GetExistingRecipeId();
            string newdateddrafted = "01/23/00";
            Assume.That(recipeid > 0, "no recipes in DB, can't run test");
            string datedrafted = GetFirstColumnFirstRowValueAsString("select datedrafted from recipe where recipeid = " + recipeid);

            TestContext.WriteLine("datedrafted for recipeid " + recipeid + " is " + datedrafted);
            datedrafted = newdateddrafted;
            TestContext.WriteLine("change datedrafted to " + newdateddrafted);

            DataTable dt = Recipe.Load(recipeid);
            dt.Rows[0]["datedrafted"] = datedrafted;
            Exception ex = Assert.Throws<Exception>(() => Recipe.Save(dt));
            TestContext.WriteLine(ex.Message);
        }

        [Test]
        public void GetListOfCuisines()
        {
            DataTable dtcuisinecount = SQLUtility.GetDataTable("select total = count (*) from cuisine");
            int cuisinecount = (int)dtcuisinecount.Rows[0]["total"];
            TestContext.WriteLine("Num of cuisines in DB = " + cuisinecount);
            TestContext.WriteLine("Ensure num of rows returned by app matches " + cuisinecount);
            DataTable dt = Recipe.GetCuisineList();

            Assert.IsTrue(dt.Rows.Count == cuisinecount, "num of rows returned by app (" + dt.Rows.Count + ") <> " + cuisinecount);
            TestContext.WriteLine("Number of rows in cuisines returned by app = " + dt.Rows.Count);
        }

        [Test]
        public void GetListOfUsers()
        {
            DataTable dtuserscount = SQLUtility.GetDataTable("select total = count (*) from users");
            int userscount = (int)dtuserscount.Rows[0]["total"];
            TestContext.WriteLine("Num of users in DB = " + userscount);
            TestContext.WriteLine("Ensure that num of rows return by app matches " + userscount);

            DataTable dt = Recipe.GetUsersList();

            Assert.IsTrue(dt.Rows.Count == userscount, "num of rows returned by app (" + dt.Rows.Count + ") <> " + userscount);
            
            TestContext.WriteLine("Number of rows in users returned by app = " + dt.Rows.Count);
        }

        private int GetExistingRecipeId()
        {
            return SQLUtility.GetFirstColumnFirstRowValue("select top 1 recipeid from recipe");
        }

        public static string GetFirstColumnFirstRowValueAsString(string sql)
        {
            string s = "";

            DataTable dt = SQLUtility.GetDataTable(sql);
            if (dt.Rows.Count > 0 && dt.Columns.Count > 0)
            {
                if (dt.Rows[0][0] != DBNull.Value)
                {
                    s = dt.Rows[0][0].ToString();
                }
            }
            return s;
        }
    }
}