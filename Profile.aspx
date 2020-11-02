<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="b2c2casusb2d22.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainWindow" runat="server">
    <h1>Profile of  <asp:Label ID="lblName1" runat="server" Text="1"></asp:Label></h1>
    <asp:Label ID="lblId" runat="server" Text="lblName"></asp:Label>
    <asp:Label ID="lblName" runat="server" Text="lblName"></asp:Label>
    <asp:Label ID="lblClass" runat="server" Text="lblClass"></asp:Label>

    <asp:GridView ID="gridViewExpertise" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="expertiseNaam" HeaderText="expertiseNaam" SortExpression="expertiseNaam" />
            <asp:BoundField DataField="expertiseNiveau" HeaderText="expertiseNiveau" SortExpression="expertiseNiveau" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT expertiseNaam, expertiseNiveau FROM Expertises, StudentExpertise, Studenten WHERE Expertises.expertiseId = StudentExpertise.expertiseId AND Studenten.studentId = @id AND Studenten.studentId = StudentExpertise.studentId">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblId" Name="id" PropertyName="Text"/>
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:Label ID="lblInterests" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblVakken" runat="server" Text="Label"></asp:Label>

</asp:Content>
