<%@ Page Title="Planner" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Planner.aspx.cs" Inherits="b2c2casusb2d22.Planner" %>
<asp:Content ID="PlannerContent" ContentPlaceHolderID="MainWindow" runat="server">
    <div class="flex-container" id="flexMain">
        <div id="gridPlanDiv">
            <div class="filtBar2" id="gridPlanBar">
                <asp:Label ID="ExplLbl4" runat="server" Text="Sort by classroom"></asp:Label>
            <asp:DropDownList CssClass="filtFld" ID="dropDownLokaal" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="lokaalNaam" DataValueField="lokaalId" OnSelectedIndexChanged="dropDownLokaal_SelectedIndexChanged" AppendDataBoundItems="True">
                <asp:ListItem Value="0">All</asp:ListItem>
            </asp:DropDownList>
            </div>
            <asp:GridView ID="gridViewPlanner" runat="server" AutoGenerateColumns="False" OnRowCommand="gridViewPlanner_RowCommand">
                <Columns>
                    <asp:Boundfield Datafield="lokaalplannerId" HeaderText="Id" SortExpression="lokaalplannerId" />
                    <asp:BoundField DataField="lokaalNaam" HeaderText="lokaalNaam" SortExpression="lokaalNaam" />
                    <asp:BoundField DataField="lokaalNaam" HeaderText="lokaalNaam" SortExpression="lokaalNaam" />
                    <asp:BoundField DataField="datum" HeaderText="datum" SortExpression="datum" />
                    <asp:BoundField DataField="tijdstip" HeaderText="tijdstip" SortExpression="tijdstip" />
                    <asp:BoundField DataField="studentNaam" HeaderText="studentNaam" SortExpression="studentNaam" />
                    <asp:ButtonField ControlStyle-CssClass="selBtn" ButtonType="Button" CommandName="editAppointment" HeaderText="Edit" ShowHeader="True" Text="Edit" />
                    <asp:ButtonField ControlStyle-CssClass="selBtn" ButtonType="Button" CommandName="deleteAfspraak" HeaderText="Delete" ShowHeader="True" Text="Delete" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="labelId" runat="server" Text=""></asp:Label>
            <asp:Label CssClass="errLbl" ID="lblError" runat="server" Text=""></asp:Label>
        </div>
        <div id="calDiv" class="filtBar2">
            <asp:Label ID="ExplLbl6" runat="server" Text="Date:"></asp:Label>
            <asp:Calendar ID="calendarPlanner" runat="server"></asp:Calendar>
            <div class="flex-list" id="flexPlan">
                <asp:Label CssClass="widthFix" ID="ExplLbl7" runat="server" Text="Time:"></asp:Label>
                <asp:DropDownList CssClass="filtFld widthFix" ID="dropDownTimes" runat="server">
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
                <asp:Label CssClass="widthFix" ID="ExplLbl8" runat="server" Text="Planned by:"></asp:Label>
                <asp:DropDownList CssClass="filtFld widthFix" ID="dropDownStudents" runat="server" DataSourceID="SqlDataSource1" DataTextField="studentNaam" DataValueField="studentId"></asp:DropDownList>
                <asp:Label CssClass="widthFix" ID="ExplLbl9" runat="server" Text="Classroom:"></asp:Label>
                <asp:DropDownList CssClass="filtFld widthFix" ID="dropDownSelectClassroom" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="lokaalNaam" DataValueField="lokaalId" OnSelectedIndexChanged="dropDownLokaal_SelectedIndexChanged" AppendDataBoundItems="True"></asp:DropDownList>
                
            </div>
        </div>
    </div>
    <div>
        <asp:Button CssClass="planBtn" ID="buttonAddToPlanner" runat="server" Text="Add reservation" OnClick="buttonAddToPlanner_Click" />
        <asp:Button CssClass="planBtn" ID="buttonUpdateAppointment" runat="server" Text="Update selected appointment" OnClick="buttonUpdateAppointment_Click" EnableTheming="True" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Studenten]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Lokalen]"></asp:SqlDataSource>
    </div>
</asp:Content>
