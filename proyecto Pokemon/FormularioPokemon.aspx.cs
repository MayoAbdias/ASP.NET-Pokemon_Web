using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace proyecto_Pokemon
{
    public partial class FormularioPokemon : System.Web.UI.Page
    {
        public bool confirmaEliminacion {  get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            confirmaEliminacion = false;
            txtId.Enabled = false;
            try
            {
                //Configuracion INICIAL de la pantalla
                if (!IsPostBack)
                {
                    ElementoNegocio negocio = new ElementoNegocio();
                    List<Elemento> lista = negocio.listar();

                    DropDLTipo.DataSource = lista;
                    DropDLTipo.DataValueField = "Id";
                    DropDLTipo.DataTextField = "Descripcion";
                    DropDLTipo.DataBind();

                    DropDLDebilidad.DataSource = lista;
                    DropDLDebilidad.DataValueField = "Id";
                    DropDLDebilidad.DataTextField = "Descripcion";
                    DropDLDebilidad.DataBind();

                }
                //Configuracion si estamos MODIFICANDO
                string id = Request.QueryString["Id"] != null ? Request.QueryString["Id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    Pokemon seleccionado = (negocio.listar(id))[0];


                    //Guardo el pokemon seleccionado en Session(Esto es para activar o desactivar el pokemon)
                    Session.Add("pokeSeleccionado", seleccionado);

                    //luego pre cargar todos los campos..
                    txtId.Text = id;
                    txtNúmero.Text = seleccionado.Numero.ToString();
                    txtNombre.Text = seleccionado.Nombre;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtUrlimagen.Text = seleccionado.UrlImagen;

                    DropDLTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                    DropDLDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString();

                    txtUrlimagen_TextChanged(sender, e);

                    //Configuracion de Activacion de Pokemon
                    if (!seleccionado.Activo)
                    {
                        btnDesactivar.Text = "Reactivar";
                    }
                }
              
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
                
            }

        }


        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Pokemon nuevo = new Pokemon();
                PokemonNegocio negocio = new PokemonNegocio();

                nuevo.Numero = int.Parse(txtNúmero.Text);
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.UrlImagen = txtUrlimagen.Text;

                nuevo.Tipo = new Elemento();
                nuevo.Tipo.Id = int.Parse(DropDLTipo.SelectedValue);

                nuevo.Debilidad = new Elemento();
                nuevo.Debilidad.Id = int.Parse(DropDLDebilidad.SelectedValue);

                if (Request.QueryString["Id"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificarConSP(nuevo);
                }
                   
                else
                    negocio.agregarConSP(nuevo);

                Response.Redirect("ListaPokemons.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
                
            }
        }

        protected void txtUrlimagen_TextChanged(object sender, EventArgs e)
        {
            imgPokemon.ImageUrl = txtUrlimagen.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            confirmaEliminacion = true;
        }

        protected void confirmarEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (chekConfirmaEliminacion.Checked)
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    negocio.eliminar(int.Parse(txtId.Text));
                    Response.Redirect("ListaPokemons.aspx");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error" ,ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                Pokemon seleccionado = (Pokemon)Session["pokeSeleccionado"];

                negocio.activarYdesactivar(seleccionado.Id, !seleccionado.Activo);
                Response.Redirect("ListaPokemons.aspx");
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
            
        }
    }
}