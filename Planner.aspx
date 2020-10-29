<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Planner.aspx.cs" Inherits="b2c2casusb2d22.Planner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="dropDownLokaal" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="lokaalNaam" DataValueField="lokaalId" OnSelectedIndexChanged="dropDownLokaal_SelectedIndexChanged"></asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Lokalen]"></asp:SqlDataSource>
    <asp:GridView ID="gridViewPlanner" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="lokaalNaam" HeaderText="lokaalNaam" SortExpression="lokaalNaam" />
            <asp:BoundField DataField="datum" HeaderText="datum" SortExpression="datum" />
            <asp:BoundField DataField="tijdstip" HeaderText="tijdstip" SortExpression="tijdstip" />
            <asp:BoundField DataField="studentNaam" HeaderText="studentNaam" SortExpression="studentNaam" />
        </Columns>
</asp:GridView>

</asp:Content>
