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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Zorgt ervoor dat alleen het gekozen element zichtbaar is, en de rest ge-hide wordt.
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

        //Zorgt ervoor dat alle elementen ge-hide worden
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