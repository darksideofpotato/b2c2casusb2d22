using System;
using System.Collections.Generic;
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

        protected void GVstu_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLchoice.SelectedValue == "1")
            {
                DVexpstu.Visible = true;
                DVintstu.Visible = false;
                DVsocialstu.Visible = false;
                DVvakstu.Visible = false;
            }
            else if (DDLchoice.SelectedValue == "2")
            {
                DVexpstu.Visible = false;
                DVintstu.Visible = true;
                DVsocialstu.Visible = false;
                DVvakstu.Visible = false;
            }
            else if (DDLchoice.SelectedValue == "3")
            {
                DVexpstu.Visible = false;
                DVintstu.Visible = false;
                DVsocialstu.Visible = true;
                DVvakstu.Visible = false;
            }
            else if (DDLchoice.SelectedValue == "4")
            {
                DVexpstu.Visible = false;
                DVintstu.Visible = false;
                DVsocialstu.Visible = false;
                DVvakstu.Visible = true;
            }
        }
    }
}