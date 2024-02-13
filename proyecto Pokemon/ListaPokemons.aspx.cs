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
    public partial class Lista_Pokemons : System.Web.UI.Page
    {
        public bool filtroAvanzado {  get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Seguridad.esAdmin(Session["trainee"]))
                {
                    Session.Add("error", "Se requiere ser Admin para acceder a esta pagina");
                    Response.Redirect("Error.aspx",false);
                }
                //filtroAvanzado = chkAvanzado.Checked;
                //if (!IsPostBack)
                //{
                PokemonNegocio negocio = new PokemonNegocio();
                Session.Add("listaPokemons", negocio.listarConSP());
                dgvPokemons.DataSource = Session["listaPokemons"];
                dgvPokemons.DataBind();
                //}
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
           
           
        }

        protected void dgvPokemons_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvPokemons.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioPokemon.aspx?Id=" + id);
        }

        protected void dgvPokemons_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvPokemons.PageIndex = e.NewPageIndex;
            dgvPokemons.DataBind();
        }
        //Filtro rapido sin que vaya a la base de datos
        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Pokemon> lista = (List<Pokemon>)Session["listaPokemons"];
            List<Pokemon> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()) || x.Tipo.Descripcion.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvPokemons.DataSource = listaFiltrada;
            dgvPokemons.DataBind();
        }
        //filtro avanzado
        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            filtroAvanzado = chkAvanzado.Checked;
            txtFiltro.Enabled = !filtroAvanzado;
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddListCriterio.Items.Clear();
                if (ddlCampo.SelectedItem.ToString() == "Número")
                {
                    ddListCriterio.Items.Add("Igual a");
                    ddListCriterio.Items.Add("Menor a");
                    ddListCriterio.Items.Add("Mayor a");
                }
                else
                {
                    ddListCriterio.Items.Add("Empieza con");
                    ddListCriterio.Items.Add("Termina con");
                    ddListCriterio.Items.Add("Contiene");
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
           

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                dgvPokemons.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(),
                    ddListCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text,
                    ddListEstado.SelectedItem.ToString());
                dgvPokemons.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }//TAREA CONSTRUIR UN "LIMPIEZA DE FILTRO PARA QUE A LA HORA DE DEJAR DE BUSCAR SE ME LIMPIE LA GRILLA"

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                Session.Add("cargarGrilla", negocio.listarConSP());
                dgvPokemons.DataSource = Session["cargarGrilla"];
                txtFiltro.Text = "";
                dgvPokemons.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
                
            }
           

        }
    }
}