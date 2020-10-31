<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="CRUD students.aspx.cs" Inherits="b2c2casusb2d22.CRUD_students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main_CRUD_students">

        <asp:DropDownList ID="DDLchoice" runat="server">
            <asp:ListItem Value="1">Expertises</asp:ListItem>
            <asp:ListItem Value="2">Interesses</asp:ListItem>
            <asp:ListItem Value="3">Socials</asp:ListItem>
            <asp:ListItem Value="4">Vakken</asp:ListItem>
        </asp:DropDownList>

        <asp:GridView ID="GVstu" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="studentId" OnSelectedIndexChanged="GVstu_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="studentId" HeaderText="studentId" SortExpression="studentId" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="studentNaam" HeaderText="studentNaam" SortExpression="studentNaam" />
                <asp:BoundField DataField="studentNummer" HeaderText="studentNummer" SortExpression="studentNummer" />
                <asp:BoundField DataField="klasId" HeaderText="klasId" SortExpression="klasId" />
                <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Select" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString2 %>" SelectCommand="SELECT * FROM [Studenten]"></asp:SqlDataSource>
        <asp:DetailsView ID="DVexpstu" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="studentId,expertiseId" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
            <Fields>
                <asp:TemplateField HeaderText="studentId" SortExpression="studentId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dllStudenten" runat="server" DataSourceID="SqlDataSourceStu" DataTextField="studentNaam" DataValueField="studentId" SelectedValue='<%# Bind("studentId") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="dllStudenten" runat="server" DataSourceID="SqlDataSourceStu" DataTextField="studentNaam" DataValueField="studentId" SelectedValue='<%# Bind("studentId") %>'></asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("studentId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="expertiseId" SortExpression="expertiseId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dllExpertise" runat="server" DataSourceID="SqlDataSourceExp" DataTextField="expertiseNaam" DataValueField="expertiseId" SelectedValue='<%# Bind("expertiseId") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="dllExpertise" runat="server" DataSourceID="SqlDataSourceExp" DataTextField="expertiseNaam" DataValueField="expertiseId" SelectedValue='<%# Bind("expertiseId") %>'></asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("expertiseId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="expertiseNiveau" HeaderText="expertiseNiveau" SortExpression="expertiseNiveau" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString2 %>" DeleteCommand="DELETE FROM [StudentExpertise] WHERE [studentId] = @studentId AND [expertiseId] = @expertiseId" InsertCommand="INSERT INTO [StudentExpertise] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (@studentId, @expertiseId, @expertiseNiveau)" SelectCommand="SELECT * FROM [StudentExpertise] WHERE ([studentId] = @studentId)" UpdateCommand="UPDATE [StudentExpertise] SET [expertiseNiveau] = @expertiseNiveau WHERE [studentId] = @studentId AND [expertiseId] = @expertiseId">
            <DeleteParameters>
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="expertiseId" Type="Int32" />
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
                <asp:Parameter Name="expertiseNiveau" Type="String" />
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="expertiseId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:DetailsView ID="DVintstu" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="interesseId,studentId" DataSourceID="SqlDataSource3" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="interesseId" HeaderText="interesseId" ReadOnly="True" SortExpression="interesseId" />
                <asp:TemplateField HeaderText="studentId" SortExpression="studentId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dllStudenten" runat="server" DataSourceID="SqlDataSourceStu" DataTextField="studentNaam" DataValueField="studentId" SelectedValue='<%# Bind("studentId") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="dllStudenten" runat="server" DataSourceID="SqlDataSourceStu" DataTextField="studentNaam" DataValueField="studentId" SelectedValue='<%# Bind("studentId") %>'></asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("studentId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString2 %>" DeleteCommand="DELETE FROM [StudentInteresse] WHERE [interesseId] = @interesseId AND [studentId] = @studentId" InsertCommand="INSERT INTO [StudentInteresse] ([interesseId], [studentId]) VALUES (@interesseId, @studentId)" SelectCommand="SELECT * FROM [StudentInteresse] WHERE ([studentId] = @studentId)">
            <DeleteParameters>
                <asp:Parameter Name="interesseId" Type="Int32" />
                <asp:Parameter Name="studentId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="interesseId" Type="Int32" />
                <asp:Parameter Name="studentId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GVstu" Name="studentId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DVsocialstu" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="socialId,studentId" DataSourceID="SqlDataSource4" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="socialId" HeaderText="socialId" ReadOnly="True" SortExpression="socialId" />
                <asp:BoundField DataField="studentId" HeaderText="studentId" ReadOnly="True" SortExpression="studentId" />
                <asp:BoundField DataField="socialLink" HeaderText="socialLink" SortExpression="socialLink" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString2 %>" DeleteCommand="DELETE FROM [StudentSocial] WHERE [socialId] = @socialId AND [studentId] = @studentId" InsertCommand="INSERT INTO [StudentSocial] ([socialId], [studentId], [socialLink]) VALUES (@socialId, @studentId, @socialLink)" SelectCommand="SELECT * FROM [StudentSocial] WHERE ([studentId] = @studentId)" UpdateCommand="UPDATE [StudentSocial] SET [socialLink] = @socialLink WHERE [socialId] = @socialId AND [studentId] = @studentId">
            <DeleteParameters>
                <asp:Parameter Name="socialId" Type="Int32" />
                <asp:Parameter Name="studentId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="socialId" Type="Int32" />
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="socialLink" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GVstu" Name="studentId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="socialLink" Type="String" />
                <asp:Parameter Name="socialId" Type="Int32" />
                <asp:Parameter Name="studentId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DVvakstu" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="studentId,vakId" DataSourceID="SqlDataSource5" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="studentId" HeaderText="studentId" ReadOnly="True" SortExpression="studentId" />
                <asp:BoundField DataField="vakId" HeaderText="vakId" ReadOnly="True" SortExpression="vakId" />
                <asp:CommandField ShowDeleteButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString2 %>" DeleteCommand="DELETE FROM [StudentVak] WHERE [studentId] = @studentId AND [vakId] = @vakId" InsertCommand="INSERT INTO [StudentVak] ([studentId], [vakId]) VALUES (@studentId, @vakId)" SelectCommand="SELECT * FROM [StudentVak] WHERE ([studentId] = @studentId)">
            <DeleteParameters>
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="vakId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="vakId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GVstu" Name="studentId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStu" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString2 %>" SelectCommand="SELECT [studentId], [studentNaam] FROM [Studenten]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceExp" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString2 %>" SelectCommand="SELECT * FROM [Expertises]"></asp:SqlDataSource>

    </div>
</asp:Content>
