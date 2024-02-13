<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="proyecto_Pokemon.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="card text-bg-dark text-center">Holaa</h1>
    <h3 class="text-center"><strong>Llegaste a tu mundo pokemon</strong> </h3>
    <hr class="border-3" />
    <%--FORMA DE ALISTAR LOS POKEMONS CON FOREACH--%>
    <div class="row row-cols-1 row-cols-md-3 g-4">

        <%--    <%
            foreach (Dominio.Pokemon poke in listaPokemon)
            {%>
             <div class="col">
                 <div class="card">
                     <img src="<%: poke.UrlImagen %>" class="card-img-top" alt="Imagen de pokemon">
                     <div class="card-body">
                         <h5 class="card-title"><%: poke.Nombre %></h5>
                         <p class="card-text"><%: poke.Descripcion %></p>
                         <a href="ListaPokemons.aspx?id=<%: poke.Id %>">Ver detalles</a>
                     </div>
                 </div>
             </div>
        <% }%>  --%>

        <%--EJEMPLO CON REPEATER HERRAMIENTA DE ASP --%>
        <asp:Repeater ID="repRepetidor" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card shadow-lg border-2">
                        <img src="<%#Eval("UrlImagen")%>" class="card-img-top" alt="Imagen de pokemon">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre")%></h5>
                            <p class="card-text"><%#Eval("Descripcion")%></p>
                            <a href="DetallesPokemons.aspx?id=<%#Eval("Id")%>" class="btn btn-primary">Ver detalles</a>
                            
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
