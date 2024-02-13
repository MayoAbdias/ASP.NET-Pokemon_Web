<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="proyecto_Pokemon.FormularioPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label border-bottom border-dark"><strong>Id</strong></label>
                <asp:TextBox ID="txtId" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtNúmero" class="form-label border-bottom border-dark"><strong>Número</strong></label>
                <asp:TextBox ID="txtNúmero" CssClass="form-control" REQUERIDE  runat="server" />

            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label border-bottom border-dark"><strong>Nombre</strong></label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" REQUERIDE  runat="server" />
            </div>

            <div class="mb-3">
                <label for="DropDLTipo" class="form-label border-bottom border-dark"><strong>Tipo</strong></label>
                <asp:DropDownList ID="DropDLTipo" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="DropDLDebilidad" class="form-label border-bottom border-dark"><strong>Debilidad</strong></label>
                <asp:DropDownList ID="DropDLDebilidad" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                <a href="ListaPokemons.aspx" class="btn btn-secondary">Cancelar</a>
                <asp:Button Text="Desactivar" ID="btnDesactivar" CssClass="btn btn-warning" OnClick="btnDesactivar_Click" runat="server" />
            </div>

        </div>

        <div class="col-6">
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label border-bottom border-dark"><strong>Descripcion</strong></label>
                <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" runat="server" />
            </div>
            <asp:ScriptManager runat="server" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtUrlimagen" class="form-label border-bottom border-dark"><strong>Url imagen</strong></label>
                        <asp:TextBox ID="txtUrlimagen" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtUrlimagen_TextChanged" />
                    </div>

                    <asp:Image ImageUrl="https://th.bing.com/th?id=OIP.FjLkalx51D8xJcpixUGJywHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2" runat="server" ID="imgPokemon" Width="60%" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" runat="server" />
                    </div>
                    <%if (confirmaEliminacion){%>
                        
                       <div class="mb-3">
                           <asp:CheckBox Text="Confirmar Eliminacion" ID="chekConfirmaEliminacion" runat="server" />
                           <asp:Button Text="Eliminar" ID="confirmarEliminar" CssClass="btn btn-outline-danger" OnClick="confirmarEliminar_Click" runat="server" />
                       </div>
                    <%} %>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>
</asp:Content>
