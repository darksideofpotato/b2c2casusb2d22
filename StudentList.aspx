<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="b2c2casusb2d22.StudentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainWindow" runat="server">
    <div class="main_body_studentlist">
        
        <div class="dropdownlists">
            <asp:DropDownList ID="ddlKlas" runat="server" DataSourceID="SqlDataSourceKlas" DataTextField="klasNaam" DataValueField="klasId"></asp:DropDownList>        
            <asp:DropDownList ID="ddlExpertise" runat="server" DataSourceID="SqlDataSourceExp" DataTextField="expertiseNaam" DataValueField="expertiseId"></asp:DropDownList>
            <asp:DropDownList ID="ddlInteresse" runat="server" DataSourceID="SqlDataSourceInt" DataTextField="interesseNaam" DataValueField="interesseId"></asp:DropDownList>
            <asp:DropDownList ID="ddlVak" runat="server" DataSourceID="SqlDataSourceVak" DataTextField="vakNaam" DataValueField="vakId"></asp:DropDownList>
        </div>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="studentId" HeaderText="studentId" InsertVisible="False" ReadOnly="True" SortExpression="studentId" />
                <asp:BoundField DataField="studentNaam" HeaderText="studentNaam" SortExpression="studentNaam" />
                <asp:BoundField DataField="studentNummer" HeaderText="studentNummer" SortExpression="studentNummer" />
                <asp:BoundField DataField="klasId" HeaderText="klasId" SortExpression="klasId" />
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                <asp:BoundField DataField="expertiseId" HeaderText="expertiseId" SortExpression="expertiseId" />
                <asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" />
                <asp:BoundField DataField="interesseId" HeaderText="interesseId" SortExpression="interesseId" />
                <asp:BoundField DataField="Expr3" HeaderText="Expr3" SortExpression="Expr3" />
                <asp:BoundField DataField="vakId" HeaderText="vakId" SortExpression="vakId" />
            </Columns>
        </asp:GridView>
        
            
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT Studenten.studentId, Studenten.studentNaam, Studenten.studentNummer, Studenten.klasId, StudentExpertise.studentId AS Expr1, StudentExpertise.expertiseId, StudentInteresse.studentId AS Expr2, StudentInteresse.interesseId, StudentVak.studentId AS Expr3, StudentVak.vakId FROM Studenten FULL OUTER JOIN StudentInteresse ON Studenten.studentId = StudentInteresse.studentId FULL OUTER JOIN StudentVak ON Studenten.studentId = StudentVak.studentId FULL OUTER JOIN StudentExpertise ON Studenten.studentId = StudentExpertise.studentId"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSourceKlas" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Klassen]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceExp" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Expertises]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceInt" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Interesses]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceVak" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Vakken]"></asp:SqlDataSource>
    </div>
</asp:Content>
