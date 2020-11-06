<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="b2c2casusb2d22.StudentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainWindow" runat="server">
    <div class="main_body_studentlist">
        
        <div class="dropdownlists">
             <asp:Label ID="ExplLbl1" runat="server" Text="Sort by class"></asp:Label>
            <asp:DropDownList ID="ddlKlas" runat="server" DataSourceID="SqlDataSourceKlas" DataTextField="klasNaam" DataValueField="klasId" AutoPostBack="True" OnSelectedIndexChanged="ddlKlas_SelectedIndexChanged"></asp:DropDownList>        
             <asp:Label ID="Label1" runat="server" Text="Sort by expertise"></asp:Label>
            <asp:DropDownList ID="ddlExpertise" runat="server" DataSourceID="SqlDataSourceExp" DataTextField="expertiseNaam" DataValueField="expertiseId" AutoPostBack="True" OnSelectedIndexChanged="ddlExpertise_SelectedIndexChanged"></asp:DropDownList>
             <asp:Label ID="Label2" runat="server" Text="Sort by interests"></asp:Label>
            <asp:DropDownList ID="ddlInteresse" runat="server" DataSourceID="SqlDataSourceInt" DataTextField="interesseNaam" DataValueField="interesseId" AutoPostBack="True" OnSelectedIndexChanged="ddlInteresse_SelectedIndexChanged"></asp:DropDownList>
             <asp:Label ID="Label3" runat="server" Text="Sort by courses"></asp:Label>
            <asp:DropDownList ID="ddlVak" runat="server" DataSourceID="SqlDataSourceVak" DataTextField="vakNaam" DataValueField="vakId" AutoPostBack="True" OnSelectedIndexChanged="ddlVak_SelectedIndexChanged"></asp:DropDownList>
        </div>
        
        <asp:GridView ID="gridViewStudenten" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="studentId" OnRowCommand="gridViewStudenten_RowCommand" OnSelectedIndexChanged="gridViewStudenten_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="studentId" HeaderText="studentId" InsertVisible="False" ReadOnly="True" SortExpression="studentId" />
                <asp:BoundField DataField="studentNaam" HeaderText="studentNaam" SortExpression="studentNaam" />
                <asp:BoundField DataField="studentNummer" HeaderText="studentNummer" SortExpression="studentNummer" />
                <asp:BoundField DataField="klasNaam" HeaderText="klasNaam" SortExpression="klasNaam" />
                <asp:BoundField DataField="vakNaam" HeaderText="vakNaam" SortExpression="vakNaam" />
                <asp:BoundField DataField="expertiseNaam" HeaderText="expertiseNaam" SortExpression="expertiseNaam" />
                <asp:BoundField DataField="expertiseNiveau" HeaderText="expertiseNiveau" SortExpression="expertiseNiveau" />
                <asp:BoundField DataField="interesseNaam" HeaderText="interesseNaam" SortExpression="interesseNaam" />
                <asp:BoundField DataField="socialNaam" HeaderText="socialNaam" SortExpression="socialNaam" />
                <asp:BoundField DataField="socialLink" HeaderText="socialLink" SortExpression="socialLink" />
                <asp:ButtonField ButtonType="Button" CommandName="checkProfile" HeaderText="Profile" ShowHeader="True" Text="Profile" />
            </Columns>
        </asp:GridView>
        
            
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT Studenten.studentId, Studenten.studentNaam, Studenten.studentNummer, Klassen.klasNaam, Vakken.vakNaam, Expertises.expertiseNaam, StudentExpertise.expertiseNiveau, Interesses.interesseNaam, Socials.socialNaam, StudentSocial.socialLink
FROM Interesses 
INNER JOIN StudentInteresse ON Interesses.interesseId = StudentInteresse.interesseId 
INNER JOIN Expertises 
INNER JOIN Studenten 
INNER JOIN Klassen ON Studenten.klasId = Klassen.klasId
INNER JOIN StudentExpertise ON Studenten.studentId = StudentExpertise.studentId ON Expertises.expertiseId = StudentExpertise.expertiseId ON StudentInteresse.studentId = Studenten.studentId 
INNER JOIN StudentSocial ON Studenten.studentId = StudentSocial.studentId 
INNER JOIN Socials ON StudentSocial.socialId = Socials.socialId 
INNER JOIN StudentVak ON Studenten.studentId = StudentVak.studentId 
INNER JOIN Vakken ON StudentVak.vakId = Vakken.vakId"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSourceKlas" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Klassen]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceExp" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Expertises]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceInt" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Interesses]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceVak" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Vakken]"></asp:SqlDataSource>
    </div>
</asp:Content>
