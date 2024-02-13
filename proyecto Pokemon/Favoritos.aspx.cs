using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proyecto_Pokemon
{
    public partial class Favorito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dgvFavoritos.DataSource = Session["Favoritos"];
                dgvFavoritos.DataBind();
            }

               
           
        }

        protected void dgvFavoritos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pokemon Favorito = new Pokemon();
            string id = dgvFavoritos.SelectedDataKey.Value.ToString();
            List<Pokemon> lista = (List<Pokemon>)Session["Favoritos"];

            lista.RemoveAll(x => x.Id == int.Parse(id));

            dgvFavoritos.DataSource = Session["Favoritos"];
            dgvFavoritos.DataBind();
        }
    }
}