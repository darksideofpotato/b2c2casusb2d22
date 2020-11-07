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
            
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if(GVclassroom.SelectedRow == null)
            {
                DVclassrooms.Visible = false;
            }
            else
            {
                DVclassrooms.Visible = true;
            }
        }

        protected void GVclassroom_SelectedIndexChanged(object sender, EventArgs e)
        {
            DVclassrooms.Visible = true;
        }

        protected void DVclassrooms_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GVclassroom.DataBind();
            GVclassroom.SelectRow(-1);
        }

        protected void DVclassrooms_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GVclassroom.DataBind();
            GVclassroom.SelectRow(-1);
        }

        protected void DVclassrooms_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GVclassroom.DataBind();
            GVclassroom.SelectRow(-1);
        }
    }
}