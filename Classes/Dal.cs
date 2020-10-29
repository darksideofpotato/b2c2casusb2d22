using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace b2c2casusb2d22.Classes
{
    public class Dal
    {
        static SqlConnection con;
        public SqlConnection databaseConnect()
        {
            string connectionString = @"Data Source=JUDITH-PC;Initial Catalog=AfstandslerenDB;Integrated Security=True";

            con = new SqlConnection(connectionString);

            con.Open();

            return con;
        }


        public DataTable fillDataGridPlanner()
        {
            SqlConnection con = databaseConnect();
            SqlCommand cmd = new SqlCommand("Select * FROM ViewPlanner ", con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return dt;

        }

        public DataTable fillLokalenPlannerOnChange(int lokaalId)
        {
            SqlConnection con = databaseConnect();
            SqlCommand cmd = new SqlCommand("Select * FROM ViewPlanner, Lokalen WHERE Lokalen.lokaalNaam = ViewPlanner.lokaalnaam AND lokaalId = @ID", con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.SelectCommand.Parameters.AddWithValue("@ID", lokaalId);
            da.Fill(dt);

            return dt;
        }
    }
}