<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="proyecto_Pokemon.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center alert text-bg-dark ">MI PERFIL</h1>
    <div class="row bg-body-tertiary justify-content-around shadow-lg border-end" style="border-radius:10px;">
        <div class="col-md-4">
            <div class="mb-3">
                <label class="form-control-lg">Email</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
            </div>
            <div class="mb-3">
                <label class="form-control-lg">Nombre</label>  <%--< Utilizo el validator ..Desactivo el "uso discreto de JavaScript" en Web.config(Forma facil)--%>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                <asp:RequiredFieldValidator ErrorMessage="Debes completar este campo" CssClass=" blockquote-footer " ControlToValidate="txtNombre" runat="server" />
            </div>
            <div class="mb-3">
                <label class="form-control-lg">Apellido</label> <%--< Otra opcion es registrar el Script centralizado que necesita para que trabaje con el modo discreto que esta en el Global.asax --%>
                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
                <asp:RequiredFieldValidator ErrorMessage="Debes completar este campo" CssClass="blockquote-footer" ControlToValidate="txtApellido" runat="server" />
            </div>
            <div class="mb-3">
                <label class="form-control-lg">Fecha de Nacimiento</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtFechaNacimiento" TextMode="Date" />
            </div>
        </div>
        <div class="col-md-4">
            <div class="mb-3">
                <label class="form-control-lg">Imagen Perfil</label>
                <input type="file" runat="server" id="txtImagen" class="form-control" />
            </div>
            <asp:Image ID="ImagenNuevaPerfil" ImageUrl="https://th.bing.com/th/id/OIP.FjLkalx51D8xJcpixUGJywHaE8?w=262&h=180&c=7&r=0&o=5&pid=1.7"
                runat="server" cssclass="img-fluid mb-3" />
        </div>
    </div>

    <div class="row">
        <div class="text-center">
            <asp:Button Text="Guardar" CssClass="btn btn-primary w-25" ID="btnGuardar" OnClick="btnGuardar_Click" runat="server" />
            <asp:Button Text="Regresar" CssClass="btn btn-secondary w-25" ID="btnRegresar" OnClick="btnRegresar_Click" runat="server" />
        </div>
    </div>
</asp:Content>
