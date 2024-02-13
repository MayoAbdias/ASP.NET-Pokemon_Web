using Dominio;
using Negocio;
using Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proyecto_Pokemon
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            try
            {
                Trainee user = new Trainee();
                TraineeNegocio traineeNeg = new TraineeNegocio();
                EmailServices emailServices = new EmailServices();

                user.Email = txtEmail.Text;
                user.Pass = txtPass.Text;

                user.Id = traineeNeg.insetarNuevo(user);
                Session.Add("trainee", user);

                emailServices.armarCorreo(user.Email, "Te damos la bienvenida trainee", "Hola que bueno que te sumaste a nuestro grupo de Trainees");
                emailServices.enviarEmail();

                Response.Redirect("Default.aspx",false);
                
                
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}