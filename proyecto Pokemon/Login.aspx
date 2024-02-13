<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="proyecto_Pokemon.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row d-flex align-items-center justify-content-center mt-5 border border-3 shadow p-3 bg-body-tertiary rounded " style="height: 500px; border-radius: 10px;">
        <div class="col-6">
            <h2 class="text-center mb-4 lh-lg text-bg-dark card">Ingresa tus datos</h2>
            <div class="mb-3 text-center">
                <label class="form-control-lg border-top border-2 border-dark-subtle">Email</label>
                <asp:TextBox runat="server" CssClass="form-control" REQUIRED ID="txtEmail" />
                <asp:RegularExpressionValidator ErrorMessage="Solo formato Email por favor.." CssClass="blockquote-footer" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
            </div>
            <div class="mb-3 text-center">
                <label class="form-control-lg border-top border-2 border-dark-subtle">Password</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtPassword" REQUIRED TextMode="Password" />
            </div>
            <div class="text-center mb-4 d-flex gap-3 text-center justify-content-center">
                <asp:Button Text="Ingresar" CssClass="btn btn-primary" ID="btnLogin" OnClick="btnLogin_Click" runat="server" />
                <a href="/" class="btn btn-secondary">Cancelar</a>
            </div>


        </div>
    </div>
</asp:Content>
