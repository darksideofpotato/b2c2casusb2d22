using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace b2c2casusb2d22
{
    public partial class CRUD_classrooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DVclassrooms.Visible = false;
        }

        protected void GVclassroom_SelectedIndexChanged(object sender, EventArgs e)
        {
            DVclassrooms.Visible = true;
        }
    }
}