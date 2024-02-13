<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="proyecto_Pokemon.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center text-bg-dark card">Hubo un problema ⛔</h1>
    <div class="col-6 text-center alert-link">
         <asp:Label Text="text" CssClass="form-control-lg text-center " ID="lblMensaje" runat="server" />
    </div>
   
</asp:Content>
