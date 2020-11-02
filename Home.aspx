<%@ Page Title="Home" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="b2c2casusb2d22.Home" %>
<asp:Content ID="HomeContent" ContentPlaceHolderID="MainWindow" runat="server">
    <div class="explDiv">
        <p>Welcome to the prototype of WeConnect!<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString3 %>" SelectCommand="SELECT * FROM [Expertises]"></asp:SqlDataSource>
        </p>
        <p>In this app for the students of Zuyd Hogeschool the goal is to connect others in times where social contact is rather lackluster</p>
        <p>Through WeConnect they will be able to present their social links on their profiles along with their skillsets and interests</p>
        <p>Through sharing these things, the students will be able to connect to help each other out, ask for help or simply have fun together</p>
        <p>Alongside that, WeConnect presents the opportunity to book rooms on school grounds for safe and socially distant meetups</p>
        <p>Thank you for checking out our application!</p>
    </div>
</asp:Content>
