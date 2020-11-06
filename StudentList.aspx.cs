using b2c2casusb2d22.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace b2c2casusb2d22
{
    public partial class StudentList : System.Web.UI.Page
    {
        Dal dal = new Dal();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridViewStudenten_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gridViewStudenten_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Wanneer er op de 'profile' knop geklikt wordt, krijgt de gebruiker het profiel van de gekozen gebruiker te zien
            if (e.CommandName == "checkProfile")
            {
                var rowIndex = int.Parse(e.CommandArgument.ToString());
                var selectedRow = ((GridView)sender).Rows[rowIndex];
                Student pickedStudent = dal.getStudent(Convert.ToInt32(selectedRow.Cells[0].Text));

                Session["Student"] = pickedStudent;
                Server.Transfer("Profile.aspx");
            }
        }

        // de onderstaande dropdown indexchanges handelen het filteren van de studenten
        protected void ddlKlas_SelectedIndexChanged(object sender, EventArgs e)
        {
            int courseId = Convert.ToInt32(ddlKlas.SelectedValue);
            DataTable dt = dal.fillStudentOnChange("class", courseId);

            gridViewStudenten.DataSourceID = "";
            gridViewStudenten.DataSource = dt;
            gridViewStudenten.DataBind();
            
        }

        protected void ddlExpertise_SelectedIndexChanged(object sender, EventArgs e)
        {
            int classId = Convert.ToInt32(ddlExpertise.SelectedValue);
            DataTable dt = dal.fillStudentOnChange("expertise", classId);

            gridViewStudenten.DataSourceID = "";
            gridViewStudenten.DataSource = dt;
            gridViewStudenten.DataBind();
        }

        protected void ddlInteresse_SelectedIndexChanged(object sender, EventArgs e)
        {
            int classId = Convert.ToInt32(ddlExpertise.SelectedValue);
            DataTable dt = dal.fillStudentOnChange("interests", classId);

            gridViewStudenten.DataSourceID = "";
            gridViewStudenten.DataSource = dt;
            gridViewStudenten.DataBind();
        }

        protected void ddlVak_SelectedIndexChanged(object sender, EventArgs e)
        {
            int classId = Convert.ToInt32(ddlExpertise.SelectedValue);
            DataTable dt = dal.fillStudentOnChange("course", classId);

            gridViewStudenten.DataSourceID = "";
            gridViewStudenten.DataSource = dt;
            gridViewStudenten.DataBind();
        }
    }
}