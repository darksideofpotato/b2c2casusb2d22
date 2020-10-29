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
    }
}