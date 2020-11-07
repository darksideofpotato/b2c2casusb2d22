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
        // Een static variabele van de connectie, zodat hij in de functies niet zeurt dat hij niet bestaat
        static SqlConnection con;

        // Het connecten met de database via de connectiestring. Even aanpassen naar je eigen connectiestring dus ;)
        public SqlConnection databaseConnect()
        {
            string connectionString = @"Data Source=DESKTOP-QK10AQ0;Initial Catalog=AfstandslerenDB;Integrated Security=True"; // <----- Deze aanpassen naar eigen connectionstring

            con = new SqlConnection(connectionString);

            con.Open();

            return con;
        }


        // De datatable van alle afspraken in de viewplanner. Kan zo in de gridview worden gebind
        public DataTable fillDataGridPlanner()
        {
            SqlConnection con = databaseConnect();
            SqlCommand cmd = new SqlCommand("Select * FROM ViewPlanner ", con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return dt;

        }

        // Andere datatable op basis van het gekozen lokaal waar op gefilterd wordt.
        // Wanneer de gebruiker kiest voor de optie 'All', dan wordt het id '0' meegegeven (een database record kan niet het id 0 hebben)
        // dus zorgt hij ervoor dat wanneer dit id wordt meegegeven, alle afspraken weer weergeven worden
        public DataTable fillLokalenPlannerOnChange(int lokaalId)
        {
            SqlConnection con = databaseConnect();

            if (lokaalId == 0)
            {
               SqlCommand cmd = new SqlCommand("Select * FROM ViewPlanner ", con);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                return dt;
            }
            else 
            { 
                SqlCommand cmd = new SqlCommand("Select * FROM ViewPlanner, Lokalen WHERE Lokalen.lokaalNaam = ViewPlanner.lokaalnaam AND lokaalId = @ID", con);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.SelectCommand.Parameters.AddWithValue("@ID", lokaalId);
                da.Fill(dt);

                return dt;
            }
                    
        }

        // Het toevoegen van een nieuwe afspraak aan de database op basis van een object dat wordt meegegeven
        public void addPlanning(LokaalPlanner newPlanner)
        {
            SqlConnection con = databaseConnect();
            SqlCommand cmd = new SqlCommand("insert into LokaalPlanner(lokaalId,datum,tijdstip,studentId) values (@lokaalId," +
                "@datum,@tijdstip,@studentId)", con);

            cmd.Parameters.AddWithValue("@lokaalId", newPlanner.getLokaal());
            cmd.Parameters.AddWithValue("@datum", newPlanner.getDate());
            cmd.Parameters.AddWithValue("@tijdstip", newPlanner.getTijdstip());
            cmd.Parameters.AddWithValue("@studentId", newPlanner.getStudent());

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

        //Geeft het object student op basis van een gegeven ID
        public Student getStudent(int Id)
        {
            SqlConnection con = databaseConnect();
            string cmd = "Select * FROM Studenten WHERE studentId = @ID";

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
            Student pickedStudent = new Student(Convert.ToInt32(Convert.ToInt32(objectList[0])), objectList[1], objectList[2], Convert.ToInt32(objectList[3]));

            return pickedStudent;
        }

        // Geeft de naam van een klas terug op basis van een studentnummer
        public string getKlasFromStudent(int studentId)
        {
            SqlConnection con = databaseConnect();
            string cmd = "Select klasNaam FROM Klassen, Studenten WHERE Studenten.studentId = @ID";

            SqlDataAdapter ad = new SqlDataAdapter(cmd, con);
            ad.SelectCommand.Parameters.AddWithValue("@ID", studentId);
            DataTable dt = new DataTable();
            ad.Fill(dt);

            foreach (DataRow row in dt.Rows)
            {
                string klasNaam = row["klasNaam"].ToString();
                return klasNaam;
            }

            return "This student is not assigned to a class";
        }

        
    }
}