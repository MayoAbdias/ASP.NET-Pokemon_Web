using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace proyecto_Pokemon
{
    public partial class DetallesPokemons : System.Web.UI.Page
    {
        public List<Pokemon> Favoritos
        {
            get
            {
                if (Session["Favoritos"] == null)
                {
                    Session["Favoritos"] = new List<Pokemon>();
                }
                return (List<Pokemon>)Session["Favoritos"];
            }
            set
            {
                Session["Favoritos"] = value;
            }
        }

        
        protected void Page_Load(object sender, EventArgs e)
        {
            PokemonNegocio pokeNeg = new PokemonNegocio();
           
            

            try
            {
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if(id != "" && !IsPostBack)
                {
                    Pokemon seleccionado = pokeNeg.listar(id)[0];


                    imgDetalle.ImageUrl = seleccionado.UrlImagen;

                    lblNombreTitulo.Text = seleccionado.Nombre;
                    lblNumero.Text = seleccionado.Numero.ToString();
                    lblDescripcion.Text = seleccionado.Descripcion;
                    lblTipo.Text = seleccionado.Tipo.Descripcion;
                    lblDebilidad.Text = seleccionado.Debilidad.Descripcion;
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnFav_Click(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["trainee"]))
            {
                string id = Request.QueryString["id"];
                PokemonNegocio negocio = new PokemonNegocio();
                List<Pokemon> listaFav = negocio.listar(id);
                Favoritos.Add(listaFav[0]);
                Response.Redirect("Favoritos.aspx", false);
            }
            else
            {
                Response.Redirect("Login.aspx",false);
            }
        }
    }
}