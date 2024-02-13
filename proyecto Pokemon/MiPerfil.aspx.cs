using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proyecto_Pokemon
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Enabled = false;
            try
            {
                

                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["trainee"]))
                    {
                        Trainee user = (Trainee)Session["trainee"];
                        txtEmail.Text = user.Email;
                        txtEmail.ReadOnly = true;
                        txtNombre.Text = user.Nombre;
                        txtApellido.Text = user.Apellido;
                        txtFechaNacimiento.Text = user.FechaNacimiento.ToString("yyyy-MM-dd");

                        if (!string.IsNullOrEmpty(user.ImagenPerfil))
                            ImagenNuevaPerfil.ImageUrl = "~/images/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString();
                    }
                    else
                    {
                        Session.Add("error", "Debes estar logueado para entrar");
                        Response.Redirect("Error.aspx", false);
                        
                    }

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;
                TraineeNegocio negocio = new TraineeNegocio();
                Trainee user = (Trainee)Session["trainee"];
                //Obtengo por cada persona que se loguee una imagen..
                //Escribir img..

                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./images/");
                    txtImagen.PostedFile.SaveAs(ruta + "PerfilUsuario-" + user.Id + ".jpg");
                    user.ImagenPerfil = "PerfilUsuario-" + user.Id + ".jpg";
                }



                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);

                negocio.Actualizar(user);

                //leer img..
                //Busco en la Master el control imgAvatar.
                Image img = (Image)Master.FindControl("imgAvatar");
                img.ImageUrl = "~/images/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString();
                ImagenNuevaPerfil.ImageUrl = "~/images/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString();


                Response.Redirect("Default.aspx", false);

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
          

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", false);
        }
    }
}