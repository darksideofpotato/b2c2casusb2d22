using b2c2casusb2d22.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace b2c2casusb2d22
{
    public partial class Planner : System.Web.UI.Page
    {
        // Maken van een object van de class dal, zodat de databaseconnectie en methodes gebruikt kunnen worden
        Dal dal = new Dal();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Het vullen van de datagridview met informatie. Conflicte met de selectedindexchanged
            //als ik het via databound deed dus dan maar handmatig

            DataTable dt = dal.fillDataGridPlanner();
            gridViewPlanner.DataSource = dt;
            gridViewPlanner.DataBind();
        }

        protected void dropDownLokaal_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Het wijzigen van de afspraken op basis van de selectedindexchanged
            int lokaalId = Convert.ToInt32(dropDownLokaal.SelectedValue);
            DataTable dt = dal.fillLokalenPlannerOnChange(lokaalId);

            gridViewPlanner.DataSource = dt;
            gridViewPlanner.DataBind();
        }

        protected void buttonAddToPlanner_Click(object sender, EventArgs e)
        {           
           // Het toevoegen van een afspraak op basis van de ingevulde waardes (lokaal, datum in kalender, tijd en student)
            int lokaalId = Convert.ToInt32(dropDownLokaal.SelectedValue);
            int studentId = Convert.ToInt32(dropDownStudents.SelectedValue);
            string date = calendarPlanner.SelectedDate.ToString("dd/MM/yyyy");
            string time = dropDownTimes.SelectedValue.ToString();

            LokaalPlanner newPlanning = new LokaalPlanner(0, lokaalId, date, time, studentId);

            dal.addPlanning(newPlanning);
        }

        protected void gridViewPlanner_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Wanneer de edit knop in de rij wordt ingedrukt, dan veranderen alle waardes op het scherm naar die van de gekozen afspraak.
            // zo kan eenvoudig een update functie worden uitgevoerd.
            if (e.CommandName == "editAppointment")
            {
                var rowIndex = int.Parse(e.CommandArgument.ToString());
                var selectedRow = ((GridView)sender).Rows[rowIndex];
                LokaalPlanner currentValues = dal.getAppointment(Convert.ToInt32(selectedRow.Cells[0].Text));

                labelId.Text = currentValues.getId().ToString();
                dropDownLokaal.SelectedIndex = currentValues.getLokaal() - 1;
                calendarPlanner.SelectedDate = Convert.ToDateTime(currentValues.getDate());
                dropDownTimes.SelectedValue = currentValues.getTijdstip();
                dropDownStudents.SelectedIndex = currentValues.getStudent() - 1;

            }
            // Wanneer de deleteknop wordt ingedrukt, wordt de gekozen row verwijderd uit de database.
            else if (e.CommandName == "deleteAfspraak")
            {
                //var rowIndex = int.Parse(e.CommandArgument.ToString());
                //var selectedRow = ((GridView)sender).Rows[rowIndex];
                //int id = Convert.ToInt32(selectedRow.Cells[0].Text);

                //dal.deleteAppointment(id);

            }
        }

        protected void calendarPlanner_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void buttonUpdateAppointment_Click(object sender, EventArgs e)
        {
            LokaalPlanner currentValues = dal.getAppointment(Convert.ToInt32(labelId.Text));

            currentValues.setStudent(Convert.ToInt32(dropDownStudents.SelectedIndex) + 1);
            currentValues.setDate(calendarPlanner.SelectedDate.ToString());
            currentValues.setTime(dropDownTimes.SelectedValue.ToString());
            currentValues.setLokaal(Convert.ToInt32(dropDownLokaal.SelectedIndex) + 1);

            System.Diagnostics.Debug.WriteLine(dropDownLokaal.SelectedIndex);

            dal.updateLokaalPlanner(currentValues);

        }
    }
}