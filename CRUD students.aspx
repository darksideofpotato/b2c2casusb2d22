<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="CRUD students.aspx.cs" Inherits="b2c2casusb2d22.CRUD_students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main_CRUD_students">

        <asp:GridView ID="GVstu" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="studentId">
            <Columns>
                <asp:BoundField DataField="studentId" HeaderText="studentId" SortExpression="studentId" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="studentNaam" HeaderText="studentNaam" SortExpression="studentNaam" />
                <asp:BoundField DataField="studentNummer" HeaderText="studentNummer" SortExpression="studentNummer" />
                <asp:BoundField DataField="klasId" HeaderText="klasId" SortExpression="klasId" />
                <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Select" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString2 %>" SelectCommand="SELECT * FROM [Studenten]"></asp:SqlDataSource>
        <asp:DetailsView ID="DVexpstu" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="studentId" HeaderText="studentId" SortExpression="studentId" />
                <asp:BoundField DataField="expertiseId" HeaderText="expertiseId" SortExpression="expertiseId" />
                <asp:BoundField DataField="expertiseNiveau" HeaderText="expertiseNiveau" SortExpression="expertiseNiveau" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString2 %>" DeleteCommand="DELETE FROM [ExpertiseStudent] WHERE [id] = @id" InsertCommand="INSERT INTO [ExpertiseStudent] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (@studentId, @expertiseId, @expertiseNiveau)" SelectCommand="SELECT * FROM [ExpertiseStudent] WHERE ([studentId] = @studentId)" UpdateCommand="UPDATE [ExpertiseStudent] SET [studentId] = @studentId, [expertiseId] = @expertiseId, [expertiseNiveau] = @expertiseNiveau WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="expertiseId" Type="Int32" />
                <asp:Parameter Name="expertiseNiveau" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GVstu" Name="studentId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="expertiseId" Type="Int32" />
                <asp:Parameter Name="expertiseNiveau" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
