<%@ Page Title="Planner" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Planner.aspx.cs" Inherits="b2c2casusb2d22.Planner" %>
<asp:Content ID="PlannerContent" ContentPlaceHolderID="MainWindow" runat="server">
    <div>
        <asp:Label ID="labelId" runat="server" Text=""></asp:Label>
        <p>Sort by classroom</p>
        <asp:DropDownList ID="dropDownLokaal" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="lokaalNaam" DataValueField="lokaalId" OnSelectedIndexChanged="dropDownLokaal_SelectedIndexChanged" AppendDataBoundItems="True">
            <asp:ListItem Value="0">All</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString3 %>" SelectCommand="SELECT * FROM [Lokalen]"></asp:SqlDataSource>
        <p>Current planning</p>
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
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <p>Adding a new appointment</p>
        <p>Pick a date</p>
        <asp:Calendar ID="calendarPlanner" runat="server"></asp:Calendar>
    </div>
    <div>
        <p>At what time?</p>
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
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString3 %>" SelectCommand="SELECT * FROM [Studenten]"></asp:SqlDataSource>
        <p>Who is planning the appointment?</p>
        <asp:DropDownList ID="dropDownStudents" runat="server" DataSourceID="SqlDataSource1" DataTextField="studentNaam" DataValueField="studentId"></asp:DropDownList>
        <p>In which classroom?</p>
        <asp:DropDownList ID="dropDownSelectClassroom" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="lokaalNaam" DataValueField="lokaalId" OnSelectedIndexChanged="dropDownLokaal_SelectedIndexChanged" AppendDataBoundItems="True"></asp:DropDownList>
        <asp:Button ID="buttonAddToPlanner" runat="server" Text="Add reservation" OnClick="buttonAddToPlanner_Click" />
        <asp:Button ID="buttonUpdateAppointment" runat="server" Text="Update selected appointment" OnClick="buttonUpdateAppointment_Click" EnableTheming="True" />
    </div>
</asp:Content>
