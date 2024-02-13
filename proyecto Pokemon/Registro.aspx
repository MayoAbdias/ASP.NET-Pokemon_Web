<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="proyecto_Pokemon.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-lg-center mt-5 shadow-lg">
        <div class="col-7">
            <h2 class="text-center">Crea tu perfil Trainee🔥</h2>
            <div class="mb-3 text-center">
                <label class="form-control-lg border-top border-dark-subtle border-2">Email</label>
                <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" />
                <asp:RegularExpressionValidator ErrorMessage="Solo formato Email por favor" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
            </div>
            <div class="mb-3 text-center">
                <label class="form-control-lg border-top border-dark-subtle border-2">Contraseña</label>
                <asp:TextBox runat="server" ID="txtPass" CssClass="form-control" TextMode="Password" />
            </div>
            <div class="text-center">
                <asp:Button Text="Registrarse" CssClass="btn btn-primary" ID="btnRegistro" OnClick="btnRegistro_Click" runat="server" />
                <asp:Button Text="Cancelar" CssClass="btn btn-secondary" ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" />
            </div>

        </div>
    </div>
</asp:Content>
