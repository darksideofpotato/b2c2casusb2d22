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

        // Sommige functies hebben een try/catch erachter zitten, zodat het programma niet meteen crasht als er verkeerd/te snel op een knop wordt gedrukt
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

            //Dit label wordt gebruikt om het ID van een gekozen row even vast te houden. De gebruiker
            // hoeft deze niet te zien dus staat hij op invisible. 
            labelId.Visible = false;
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
            lblError.Text = "";

            try
            {
                // Een controle of de dag vóór de dag vandaag wordt ingesteld, dit mag namelijk niet.
                DateTime todaysDate = DateTime.Today;
                DateTime date = calendarPlanner.SelectedDate;

                if (date < todaysDate)
                {
                    lblError.Text = "You picked a date before today. Please pick a data in the future.";
                }
                else
                {
                    int lokaalId = Convert.ToInt32(dropDownSelectClassroom.SelectedValue);
                    int studentId = Convert.ToInt32(dropDownStudents.SelectedValue);

                    string newDate = calendarPlanner.SelectedDate.ToString("dd/MM/yyyy");
                    string time = dropDownTimes.SelectedValue.ToString();

                    LokaalPlanner newPlanning = new LokaalPlanner(0, lokaalId, newDate, time, studentId);

                    dal.addPlanning(newPlanning);
                }      
            }
            catch (Exception error)
            {
                lblError.Text = "Something went wrong, please check your inserted values";
            };
        }

        protected void gridViewPlanner_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            lblError.Text = "";
            // Wanneer de edit knop in de rij wordt ingedrukt, dan veranderen alle waardes op het scherm naar die van de gekozen afspraak.
            // zo kan eenvoudig een update functie worden uitgevoerd.
            if (e.CommandName == "editAppointment")
            {
                var rowIndex = int.Parse(e.CommandArgument.ToString());
                var selectedRow = ((GridView)sender).Rows[rowIndex];
                LokaalPlanner currentValues = dal.getAppointment(Convert.ToInt32(selectedRow.Cells[0].Text));

                labelId.Text = currentValues.getId().ToString();
                dropDownSelectClassroom.SelectedIndex = currentValues.getLokaal() - 1;
                calendarPlanner.SelectedDate = Convert.ToDateTime(currentValues.getDate());
                dropDownTimes.SelectedValue = currentValues.getTijdstip();
                dropDownStudents.SelectedIndex = currentValues.getStudent() - 1;

            }
            // Wanneer de deleteknop wordt ingedrukt, wordt de gekozen row verwijderd uit de database.
            else if (e.CommandName == "deleteAfspraak")
            {
                try
                {
                    var rowIndex = int.Parse(e.CommandArgument.ToString());
                    var selectedRow = ((GridView)sender).Rows[rowIndex];
                    int id = Convert.ToInt32(selectedRow.Cells[0].Text);

                    dal.deleteAppointment(id);
                }
                catch (Exception error)
                {
                    lblError.Text = "Something went wrong, please check your inserted values";
                };

            }
        }

        // Wanneer een entry is geselecteerd een aangepast, kan deze geupdate worden in de database met deze knop
        protected void buttonUpdateAppointment_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                // Een controle of de dag vóór de dag vandaag wordt ingesteld, dit mag namelijk niet.
                DateTime todaysDate = DateTime.Today;
                DateTime date = calendarPlanner.SelectedDate;

                if (date < todaysDate)
                {
                    lblError.Text = "You picked a date before today. Please pick a date in the future.";
                }
                else
                {
                    LokaalPlanner currentValues = dal.getAppointment(Convert.ToInt32(labelId.Text));
                    currentValues.setStudent(Convert.ToInt32(dropDownStudents.SelectedIndex) + 1);
                    currentValues.setDate(calendarPlanner.SelectedDate.ToString("dd/MM/yyyy"));
                    currentValues.setTime(dropDownTimes.SelectedValue.ToString());
                    currentValues.setLokaal(Convert.ToInt32(dropDownSelectClassroom.SelectedIndex) + 1);



                    dal.updateAppointment(currentValues);

                }
            }
            catch (Exception error)
            {
                lblError.Text = "Something went wrong, please check your inserted values";
            };

        }
    }
}