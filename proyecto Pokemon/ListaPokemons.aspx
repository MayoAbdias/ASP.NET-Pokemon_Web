<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaPokemons.aspx.cs" Inherits="proyecto_Pokemon.Lista_Pokemons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="card bg-opacity-100 text-center">Lista de Pokemons</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label CssClass="text-uppercase" Text="Filtrar Nombre" runat="server" />
                <asp:TextBox ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" runat="server" />
            </div>
        </div>
        <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
            <div class="mb-3">
                <asp:CheckBox Text="Filtro Avanzado" ID="chkAvanzado" AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged" runat="server" />
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <asp:Button Text="Atras" ID="btnAtras" CssClass="btn btn-secondary card-img-top" OnClick="btnAtras_Click" runat="server" />
            </div>
        </div>
    </div>
            <%if (chkAvanzado.Checked)
                {%>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Campo" runat="server" />
                        <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" CssClass="form-control">
                            <asp:ListItem Text="Número" />
                            <asp:ListItem Text="Tipo" />
                            <asp:ListItem Text="Nombre" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Criterio" runat="server" />
                        <asp:DropDownList runat="server" ID="ddListCriterio" CssClass="form-control"> <asp:ListItem Text="Igual a"/> <asp:ListItem Text="Menor a"/> <asp:ListItem Text="Mayor a" /></asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Filtro" runat="server" />
                        <asp:TextBox ID="txtFiltroAvanzado" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Estado" runat="server" />
                        <asp:DropDownList runat="server" ID="ddListEstado" CssClass="form-control">
                            <asp:ListItem Text="Todos" />
                            <asp:ListItem Text="Activo" />
                            <asp:ListItem Text="Inactivo" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Button Text="Buscar" ID="btnBuscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" runat="server" />

                    </div>
                </div>
            </div>

            <% }%>

            <asp:GridView ID="dgvPokemons" DataKeyNames="Id" runat="server"
                OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged" CssClass="table table-borderer table-dark"
                OnPageIndexChanging="dgvPokemons_PageIndexChanging" AllowPaging="true" PageSize="5" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Número" DataField="Numero" />
                    <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                    <asp:BoundField HeaderText="Debilidad" DataField="Debilidad.Descripcion" />
                    <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
                    <asp:CommandField ShowSelectButton="true" HeaderText="Selección" SelectText="✅" />

                </Columns>
            </asp:GridView>

            <a href="FormularioPokemon.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
