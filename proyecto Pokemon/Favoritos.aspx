<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="proyecto_Pokemon.Favorito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center mb-5 card bg-secondary text-white">Tu lista de Favoritos</h2>
    <hr />
    <%if (Session["Favoritos"] == null)
            { %>
    <h2 class="text-center mb-5">Este es el lugar para guardar tus Pokemons favoritos ⚡

    </h2>
        <%  } %>
    <div class="row">
        <div class="col-12">
            <asp:GridView ID="dgvFavoritos" DataKeyNames="Id" OnSelectedIndexChanged="dgvFavoritos_SelectedIndexChanged"
                runat="server" AutoGenerateColumns="false" AllowPaging="true" CssClass="table table-borderer table-dark">
                <Columns>
                    <asp:BoundField HeaderText="Número" DataField="Numero" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                    <asp:BoundField HeaderText="Debilidad" DataField="Debilidad.Descripcion" />
                    <asp:CommandField ShowSelectButton="true" HeaderText="Seleccion" SelectText="Eliminar" />

                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="text-center">
        <a href="Default.aspx" class="btn btn-secondary">Regresar</a>

    </div>


</asp:Content>
