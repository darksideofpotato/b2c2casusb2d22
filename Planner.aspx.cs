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
        Dal dal = new Dal();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = dal.fillDataGridPlanner();
            gridViewPlanner.DataSource = dt;
            gridViewPlanner.DataBind();
        }

        protected void dropDownLokaal_SelectedIndexChanged(object sender, EventArgs e)
        {
            int lokaalId = Convert.ToInt32(dropDownLokaal.SelectedValue);
            DataTable dt = dal.fillLokalenPlannerOnChange(lokaalId);

            gridViewPlanner.DataSource = dt;
            gridViewPlanner.DataBind();
        }

        protected void buttonAddToPlanner_Click(object sender, EventArgs e)
        {
                
           
            int lokaalId = Convert.ToInt32(dropDownLokaal.SelectedValue);
            int studentId = Convert.ToInt32(dropDownStudents.SelectedValue);
            string date = calendarPlanner.SelectedDate.ToString("dd/MM/yyyy");
            string time = dropDownTimes.SelectedValue.ToString();

            LokaalPlanner newPlanning = new LokaalPlanner(0, lokaalId, date, time, studentId);

            dal.addPlanning(newPlanning);
        }

        protected void calendarPlanner_SelectionChanged(object sender, EventArgs e)
        {

        }
    }
}