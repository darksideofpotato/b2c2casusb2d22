<%@ Page Title="ClassroomCrud" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="CRUD classrooms.aspx.cs" Inherits="b2c2casusb2d22.CRUD_classrooms" %>
<asp:Content ID="ClassCrudContent" ContentPlaceHolderID="MainWindow" runat="server">
    <div id="ClassGrid">
        <asp:GridView ID="GVclassroom" runat="server" AutoGenerateColumns="False" DataKeyNames="lokaalId" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="lokaalId" HeaderText="lokaalId" InsertVisible="False" ReadOnly="True" SortExpression="lokaalId" />
                <asp:BoundField DataField="lokaalNaam" HeaderText="lokaalNaam" SortExpression="lokaalNaam" />
                <asp:BoundField DataField="lokaalCapaciteit" HeaderText="lokaalCapaciteit" SortExpression="lokaalCapaciteit" />
                <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Select" />
            </Columns>
        </asp:GridView>
    </div>
    <div id="ClassDetails">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Lokalen]"></asp:SqlDataSource>
        <asp:DetailsView ID="DVclassrooms" runat="server" AutoGenerateRows="False" DataKeyNames="lokaalId" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="lokaalId" HeaderText="lokaalId" InsertVisible="False" ReadOnly="True" SortExpression="lokaalId" />
                <asp:BoundField DataField="lokaalNaam" HeaderText="lokaalNaam" SortExpression="lokaalNaam" />
                <asp:BoundField DataField="lokaalCapaciteit" HeaderText="lokaalCapaciteit" SortExpression="lokaalCapaciteit" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" DeleteCommand="DELETE FROM [Lokalen] WHERE [lokaalId] = @lokaalId" InsertCommand="INSERT INTO [Lokalen] ([lokaalNaam], [lokaalCapaciteit]) VALUES (@lokaalNaam, @lokaalCapaciteit)" SelectCommand="SELECT * FROM [Lokalen] WHERE ([lokaalId] = @lokaalId)" UpdateCommand="UPDATE [Lokalen] SET [lokaalNaam] = @lokaalNaam, [lokaalCapaciteit] = @lokaalCapaciteit WHERE [lokaalId] = @lokaalId">
            <DeleteParameters>
                <asp:Parameter Name="lokaalId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="lokaalNaam" Type="String" />
                <asp:Parameter Name="lokaalCapaciteit" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GVclassroom" Name="lokaalId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="lokaalNaam" Type="String" />
                <asp:Parameter Name="lokaalCapaciteit" Type="String" />
                <asp:Parameter Name="lokaalId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
