using System.Data;
using System.Diagnostics;
using CPUFramework;

namespace RecipeSystem
{
    public class Recipe
    {
        public static DataTable SearchRecipes(string recipename)
        {
            string sql = "select RecipeId, RecipeName from recipe r join Cuisine c on r.CuisineId = c.CuisineId join Users u on r.UsersId = u.UsersId where r.recipename like '%" + recipename + "%'";
            return SQLUtility.GetDataTable(sql);
        }

        public static DataTable Load(int recipeid)
        {
            string sql = "select r.RecipeId, r.CuisineId, r.UsersId, r.RecipeName, c.CuisineType, u.UserName, r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived, r.RecipeStatus from recipe r join Cuisine c on r.cuisineId = c.CuisineId join Users u on r.UsersId = u.UsersId where r.RecipeId = " + recipeid.ToString();
            return SQLUtility.GetDataTable(sql);
        }

        public static DataTable GetCuisineList()
        {
            string sql = "select c.CuisineId, c.CuisineType from Cuisine c";
            return SQLUtility.GetDataTable(sql);
        }

        public static DataTable GetUsersList()
        {
            string sql = "select u.UsersId, u.UserName from Users u";
            return SQLUtility.GetDataTable(sql);
        }

        public static void Save(DataTable dtrecipe)
        {
            SQLUtility.DebugPrintDataTable(dtrecipe);
            DataRow r = dtrecipe.Rows[0];
            int id = (int)r["RecipeId"];
            string sql = "";

            if (id > 0)
            {
                sql = string.Join(Environment.NewLine, $"update recipe set",
                    $"CuisineId = '{r["CuisineId"]}', ",
                    $"UsersId = '{r["UsersId"]}', ",
                    $"RecipeName = '{r["RecipeName"]}',",
                    $"Calories = '{r["Calories"]}',",
                    $"DateDrafted = '{r["DateDrafted"]}'",
                    $"where RecipeId = '{r["RecipeId"]}'"); 
            }

            else
            {
                sql = "insert recipe(CuisineId, UsersId, RecipeName, Calories, DateDrafted)";
                sql += $"select '{r["CuisineId"]}', '{r["UsersId"]}', '{r["RecipeName"]}', '{r["Calories"]}', '{r["DateDrafted"]}'";
            }

            Debug.Print("-------");
            SQLUtility.ExecuteSQL(sql);
        }

        public static void Delete(DataTable dtrecipe)
        {
            int id = (int)dtrecipe.Rows[0]["RecipeId"];
            string sql = "delete recipe where RecipeId = " + id;
            SQLUtility.ExecuteSQL(sql);

        }

    }

}
