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

        public void addPlanning(LokaalPlanner newPlanner)
        {
            SqlConnection con = databaseConnect();
            SqlCommand cmd = new SqlCommand("insert into LokaalPlanner(lokaalId,datum,tijdstip,studentId) values (@lokaalId," +
                "@datum,@tijdstip,@studentId)", con);

            cmd.Parameters.AddWithValue("@lokaalId", newPlanner.getLokaal());
            cmd.Parameters.AddWithValue("@datum", newPlanner.getDate());
            cmd.Parameters.AddWithValue("@tijdstip", newPlanner.getTijdstip());
            cmd.Parameters.AddWithValue("@studentId", newPlanner.getStudent());

            System.Diagnostics.Debug.WriteLine(newPlanner.getLokaal());
            System.Diagnostics.Debug.WriteLine(newPlanner.getDate());
            System.Diagnostics.Debug.WriteLine(newPlanner.getTijdstip());
            System.Diagnostics.Debug.WriteLine(newPlanner.getStudent());

            cmd.ExecuteNonQuery();
            con.Close();
        }

        //Geeft alle informatie van een afspraak terug op basis van het gegeven id. 
        public LokaalPlanner getAppointment(int Id)
        {
            SqlConnection con = databaseConnect();
            string cmd = "Select * FROM lokaalPlanner WHERE lokaalplannerId = @ID";

            SqlDataAdapter ad = new SqlDataAdapter(cmd, con);
            ad.SelectCommand.Parameters.AddWithValue("@ID", Id);
            DataTable dt = new DataTable();
            ad.Fill(dt);

            List<string> objectList = new List<string>();

            foreach (DataColumn col in dt.Columns)
            {
                foreach (DataRow row in dt.Rows)
                {
                    objectList.Add(row[col.ColumnName].ToString());
                }
            }

            LokaalPlanner currentAppointment = new LokaalPlanner(Convert.ToInt32(objectList[0]), Convert.ToInt32(objectList[1]), objectList[2], objectList[3],
                Convert.ToInt32(objectList[4]));

            return currentAppointment;
        }

        //Update een afspraak op basis van het LokaalPlanner object dat is meegegeven
        public void updateAppointment(LokaalPlanner appointment)
        {
            SqlConnection con = databaseConnect();
            SqlCommand cmd = new SqlCommand("UPDATE LokaalPlanner SET lokaalId = @lokaalId, datum = @datum, tijdstip = @tijdstip," +
                "studentId = @studentId WHERE lokaalplannerId = @ID", con);

            cmd.Parameters.AddWithValue("@ID", appointment.getId());
            cmd.Parameters.AddWithValue("@lokaalId", appointment.getLokaal());
            cmd.Parameters.AddWithValue("@datum", appointment.getDate());
            cmd.Parameters.AddWithValue("@tijdstip", appointment.getTijdstip());
            cmd.Parameters.AddWithValue("@studentId", appointment.getStudent());

            System.Diagnostics.Debug.WriteLine(appointment.getLokaal());

            cmd.ExecuteNonQuery();
            con.Close();
        }

        //Verwijderd een afspraak op basis van het LokaalPlanner object dat is meegegeven
        public void deleteAppointment(int Id)
        {
            SqlConnection con = databaseConnect();
            SqlCommand cmd = new SqlCommand("DELETE FROM LokaalPlanner WHERE lokaalplannerId = @ID", con);

            cmd.Parameters.AddWithValue("@ID", Id);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}