<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Planner.aspx.cs" Inherits="b2c2casusb2d22.Planner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="labelId" runat="server" Text="Label"></asp:Label>
    <asp:DropDownList ID="dropDownLokaal" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="lokaalNaam" DataValueField="lokaalId" OnSelectedIndexChanged="dropDownLokaal_SelectedIndexChanged"></asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Lokalen]"></asp:SqlDataSource>
    <asp:GridView ID="gridViewPlanner" runat="server" AutoGenerateColumns="False" OnRowCommand="gridViewPlanner_RowCommand">
        <Columns>
            <asp:Boundfield Datafield="lokaalplannerId" HeaderText="Id" SortExpression="lokaalplannerId" />
            <asp:BoundField DataField="lokaalNaam" HeaderText="lokaalNaam" SortExpression="lokaalNaam" />
            <asp:BoundField DataField="lokaalNaam" HeaderText="lokaalNaam" SortExpression="lokaalNaam" />
            <asp:BoundField DataField="datum" HeaderText="datum" SortExpression="datum" />
            <asp:BoundField DataField="tijdstip" HeaderText="tijdstip" SortExpression="tijdstip" />
            <asp:BoundField DataField="studentNaam" HeaderText="studentNaam" SortExpression="studentNaam" />
            <asp:ButtonField ButtonType="Button" CommandName="editAppointment" HeaderText="Edit" ShowHeader="True" Text="Edit" />
            <asp:ButtonField ButtonType="Button" CommandName="deleteAfspraak" HeaderText="Delete" ShowHeader="True" Text="Delete" />
        </Columns>
</asp:GridView>

    <asp:Calendar ID="calendarPlanner" runat="server" OnSelectionChanged="calendarPlanner_SelectionChanged"></asp:Calendar>
    <asp:DropDownList ID="dropDownStudents" runat="server" DataSourceID="SqlDataSource1" DataTextField="studentNaam" DataValueField="studentId"></asp:DropDownList>
    <asp:DropDownList ID="dropDownTimes" runat="server">
        <asp:ListItem>9:00</asp:ListItem>
        <asp:ListItem>10:00</asp:ListItem>
        <asp:ListItem>11:00</asp:ListItem>
        <asp:ListItem>12:00</asp:ListItem>
        <asp:ListItem>13:00</asp:ListItem>
        <asp:ListItem>14:00</asp:ListItem>
        <asp:ListItem>15:00</asp:ListItem>
        <asp:ListItem>16:00</asp:ListItem>
        <asp:ListItem>17:00</asp:ListItem>
    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Studenten]"></asp:SqlDataSource>
    <asp:Button ID="buttonAddToPlanner" runat="server" Text="Add reservation" OnClick="buttonAddToPlanner_Click" />
    <asp:Button ID="buttonUpdateAppointment" runat="server" Text="Update selected appointment" OnClick="buttonUpdateAppointment_Click" />
</asp:Content>
