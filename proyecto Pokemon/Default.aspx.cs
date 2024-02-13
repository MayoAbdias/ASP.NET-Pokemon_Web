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
    public partial class Default : System.Web.UI.Page
    {
        public List<Pokemon> listaPokemon { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                listaPokemon = negocio.listarConSP();

                if (!IsPostBack)
                {
                    repRepetidor.DataSource = listaPokemon;
                    repRepetidor.DataBind();
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
           
           
        }

       

      
    }
}