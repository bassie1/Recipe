using System;
using System.Collections.Generic;
using System.Data;
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
            string sql = "select RecipeId, RecipeName from recipe r where r.recipename like '%" + recipename + "%'";
            DataTable dt = SQLUtility.GetDataTable(sql);
            return dt;
        }

        public static DataTable Load(int recipeid)
        {
            string sql = "select r.RecipeId, r.RecipeName, r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived, r.RecipeStatus from recipe r where r.RecipeId = " + recipeid.ToString();
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
                    $"RecipeId = '{r["RecipeId"]}', ",
                    $"RecipeName = '{r["RecipeName"]}',",
                    $"Calories = '{r["Calories"]}',",
                    $"DateDrafted = '{r["DateDrafted"]}'");
            }

            else
            {
                sql = "inset recipe(RecipeId, RecipeName, Calories, DateDrafted, DatePublished, DateArchived, RecipeStatus";
                sql += $"select '{r["RecipeId"]}', {r["RecipeName"]}', {r["Calories"]}', {r["DateDrafted"]}', {r["DatePublished"]}', {r["DateArchived"]}', {r["RecipeStatus"]}";
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
