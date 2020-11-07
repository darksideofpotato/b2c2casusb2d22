<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="b2c2casusb2d22.StudentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainWindow" runat="server">
    <div>
        
        <div class="filtBar1">
             <asp:Label ID="ExplLbl1" runat="server" Text="Filter on class"></asp:Label>
            <asp:DropDownList CssClass="filtFld" ID="ddlKlas" runat="server" DataSourceID="SqlDataSourceKlas" DataTextField="klasNaam" DataValueField="klasId" AutoPostBack="True" OnSelectedIndexChanged="ddlKlas_SelectedIndexChanged"></asp:DropDownList>        
             <asp:Label ID="Label1" runat="server" Text="Filter on expertise"></asp:Label>
            <asp:DropDownList CssClass="filtFld" ID="ddlExpertise" runat="server" DataSourceID="SqlDataSourceExp" DataTextField="expertiseNaam" DataValueField="expertiseId" AutoPostBack="True" OnSelectedIndexChanged="ddlExpertise_SelectedIndexChanged"></asp:DropDownList>
             <asp:Label ID="Label2" runat="server" Text="Filter on interests"></asp:Label>
            <asp:DropDownList CssClass="filtFld" ID="ddlInteresse" runat="server" DataSourceID="SqlDataSourceInt" DataTextField="interesseNaam" DataValueField="interesseId" AutoPostBack="True" OnSelectedIndexChanged="ddlInteresse_SelectedIndexChanged"></asp:DropDownList>
             <asp:Label ID="Label3" runat="server" Text="Filter on courses"></asp:Label>
            <asp:DropDownList CssClass="filtFld" ID="ddlVak" runat="server" DataSourceID="SqlDataSourceVak" DataTextField="vakNaam" DataValueField="vakId" AutoPostBack="True" OnSelectedIndexChanged="ddlVak_SelectedIndexChanged"></asp:DropDownList>
        </div>
        
        <asp:GridView ID="gridViewStudenten" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="studentId" OnRowCommand="gridViewStudenten_RowCommand" OnSelectedIndexChanged="gridViewStudenten_SelectedIndexChanged">
            <Columns>
                <asp:ButtonField CommandName="checkProfile" HeaderText="Profile" ShowHeader="True" Text="Profile" />
            </Columns>
        </asp:GridView>
        
            
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSourceKlas" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Klassen]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceExp" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Expertises]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceInt" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Interesses]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceVak" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Vakken]"></asp:SqlDataSource>
    </div>
</asp:Content>
