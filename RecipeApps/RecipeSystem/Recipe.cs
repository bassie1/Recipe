using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using CPUFramework;

namespace RecipeSystem
{
    public class Recipe
    {
        public static DataTable SearchRecipes(string recipename)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSqlCommand("RecipeGet");
            cmd.Parameters["@RecipeName"].Value = recipename;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }

        public static DataTable Load(int recipeid)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSqlCommand("RecipeGet");
            cmd.Parameters["@RecipeId"].Value = recipeid;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }

        public static DataTable GetCuisineList()
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSqlCommand("CuisineGet");
            cmd.Parameters["@All"].Value = 1;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }

        public static DataTable GetUsersList()
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSqlCommand("UsersGet");
            cmd.Parameters["@All"].Value = 1;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
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
