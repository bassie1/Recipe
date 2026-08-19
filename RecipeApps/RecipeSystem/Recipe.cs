using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace RecipeSystem
{
    public class Recipe
    {
        public static DataTable SearchRecipes(string recipename)
        {
            string sql = "select RecipeId, RecipeName from recipe r join Cuisine c on r.CuisineId = c.CuisineId join Users u on r.UsersId = u.UsersId where r.recipename like '%" + recipename + "%'";
            DataTable dt = SQLUtility.GetDataTable(sql);
            return dt;
        }

        public static DataTable Load(int recipeid)
        {
            string sql = "select r.RecipeId, r.RecipeName, c.CuisineType, u.UserName, r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived, r.RecipeStatus from recipe r join Cuisine c on r.cuisineId = c.CuisineId join Users u on r.UsersId = u.UsersId where r.RecipeId = " + recipeid.ToString();
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
                    $"Cuisine = '{r["Cuisine"]}',",
                    $"UserName = '{r["UserName"]}',",
                    $"DateDrafted = '{r["DateDrafted"]}'"); ;
            }

            else
            {
                sql = "insert recipe(RecipeId, RecipeName, Calories, DateDrafted, RecipeStatus";
                sql += $"select '{r["RecipeId"]}', {r["RecipeName"]}', {r["Calories"]}', {r["DateDrafted"]}', {r["RecipeStatus"]}";
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
