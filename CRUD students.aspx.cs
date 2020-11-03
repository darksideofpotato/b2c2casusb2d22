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
    public partial class CRUD_students : System.Web.UI.Page
    {
        Dal dal = new Dal();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvStudenten_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dllChoice.SelectedValue == "1")
            {
                dvExpStudent.Visible = true;
                dvIntStudent.Visible = false;
                dvSocialStudent.Visible = false;
                dvVakStudent.Visible = false;
                dvStudent.Visible = false;
            }
            else if (dllChoice.SelectedValue == "2")
            {
                dvExpStudent.Visible = false;
                dvIntStudent.Visible = true;
                dvSocialStudent.Visible = false;
                dvVakStudent.Visible = false;
                dvStudent.Visible = false;
            }
            else if (dllChoice.SelectedValue == "3")
            {
                dvExpStudent.Visible = false;
                dvIntStudent.Visible = false;
                dvSocialStudent.Visible = true;
                dvVakStudent.Visible = false;
                dvStudent.Visible = false;
            }
            else if (dllChoice.SelectedValue == "4")
            {
                dvExpStudent.Visible = false;
                dvIntStudent.Visible = false;
                dvSocialStudent.Visible = false;
                dvVakStudent.Visible = true;
                dvStudent.Visible = false;
            }
            else if (dllChoice.SelectedValue == "5")
            {
                dvExpStudent.Visible = false;
                dvIntStudent.Visible = false;
                dvSocialStudent.Visible = false;
                dvVakStudent.Visible = false;
                dvStudent.Visible = true;
            }
        }

        protected void gvStudenten_RowCommand(object sender, GridViewCommandEventArgs e)
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

        protected void dropDownSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            int courseId = Convert.ToInt32(dropDownSort.SelectedValue);
            DataTable dt = dal.fillStudentOnChange("course", courseId);

            gvStudenten.DataSourceID = ""; 
            gvStudenten.DataSource = dt;
            gvStudenten.DataBind();
        }

        protected void dropDownSort2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int classId = Convert.ToInt32(dropDownSort2.SelectedValue);
            DataTable dt = dal.fillStudentOnChange("class", classId);

            gvStudenten.DataSourceID = "";
            gvStudenten.DataSource = dt;
            gvStudenten.DataBind();
        }

        protected void dllChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            dvExpStudent.Visible = false;
            dvIntStudent.Visible = false;
            dvSocialStudent.Visible = false;
            dvVakStudent.Visible = false;
            dvStudent.Visible = false;
        }
    }
}