using b2c2casusb2d22.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace b2c2casusb2d22
{
    public partial class Profile : System.Web.UI.Page
    {
        Dal dal = new Dal();
        protected void Page_Load(object sender, EventArgs e)
        {
            // Laat de studentgegevens zien op basis van de student die geselecteert is in de gridview op de vorige pagina, waar hij in de session werd opgeslagen
            Student pickedStudent = (Student) Session["Student"];
            lblId.Text = pickedStudent.getId().ToString();
            lblName.Text = pickedStudent.getStudentNaam();
            lblName1.Text = pickedStudent.getStudentNaam();

            lblClass.Text = dal.getKlasFromStudent(pickedStudent.getId());

           
        }
    }
}