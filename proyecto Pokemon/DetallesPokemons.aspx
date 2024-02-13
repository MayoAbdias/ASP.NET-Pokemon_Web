<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetallesPokemons.aspx.cs" Inherits="proyecto_Pokemon.DetallesPokemons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
            <h2 class="border-bottom border-black border-3 card bg-body text-center m-5">Detalles del Pokemon</h2>
            <div class="container shadow-sm p-3 bg-body-tertiary rounded">
                <div class="card mb-3 ">
                    <div class="row g-0 align-items-center">
                        <div class="col-md-6 text-center">
                            <asp:Image ImageUrl="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png" style="height:370px; width:380px;" ID="imgDetalle" CssClass="img-fluid" runat="server" onerror="this.onerror=null; this.src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ28WA2ZQREgEZ1jva2HNK6hzzNLXtnkxGhG2eCg1bAuw&s'" />
                        </div>
                        <div class="col-md-6">
                           <div class="card-body">
                              <h3 class="text-center border-2 card-body card bg-secondary text-white">
                                  <asp:Label Text="" CssClass="form-label" ID="lblNombreTitulo" runat="server" />
                             </h3>
                          </div>
                          <p>
                             <asp:Label runat="server" CssClass="form-control-lg" Text="Número: "></asp:Label>
                             <asp:Label Text="" ID="lblNumero" CssClass="form-control-lg" runat="server" />
                          </p>
                            <hr class="border-2"/>
                          <p>
                             <asp:Label runat="server" CssClass="form-control-lg" Text="Tipo: "></asp:Label>
                             <asp:Label Text="" ID="lblTipo" CssClass="form-control-lg" runat="server" />
                          </p>
                            <hr class="border-2"/>
                          <p>
                            <asp:Label runat="server" CssClass="form-control-lg" Text="Descripcion: "></asp:Label>
                            <asp:Label Text="" ID="lblDescripcion" CssClass="form-control-lg" runat="server" />
                         </p>
                            <hr class="border-2"/>
                         <p>
                           <asp:Label runat="server" CssClass="form-control-lg" Text="Debilidad: "></asp:Label>
                           <asp:Label Text="" ID="lblDebilidad" CssClass="form-control-lg" runat="server" />
                         </p>
                            <hr class="border-2"/>

                   </div>
                </div>
                    <div class="text-center mb-4 d-flex gap-3 text-center justify-content-center">
                         <asp:Button ID="btnFav" runat="server" Text="Agregar a favoritos" OnClick="btnFav_Click"  class="btn btn-primary" />
                         <a href="Default.aspx" class="btn btn-dark">Regresar</a>
                    </div>
            </div>
          </div>
      
</asp:Content>
