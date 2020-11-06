using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace b2c2casusb2d22
{
    public partial class Masterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void HomeBtn_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx");
        }

        protected void StudentCrBtn_Click(object sender, EventArgs e)
        {
            Server.Transfer("CRUD students.aspx");
        }

        protected void ClassCrudBtn_Click(object sender, EventArgs e)
        {
            Server.Transfer("CRUD classrooms.aspx");
        }

        protected void PlannerBtn_Click(object sender, EventArgs e)
        {
            Server.Transfer("Planner.aspx");
        }

        protected void StudentFilterBtn_Click(object sender, EventArgs e)
        {
            Server.Transfer("StudentList.aspx");
        }
    }
}