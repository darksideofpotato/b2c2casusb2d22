﻿<%@ Page Title="StudentCrud" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="CRUD students.aspx.cs" Inherits="b2c2casusb2d22.CRUD_students" %>

<asp:Content ID="StudCrudContent" ContentPlaceHolderID="MainWindow" runat="server">
    <div class="filtBar1" id="StudFilt">
        <asp:Label ID="ExplLbl3" runat="server" Text="Edit:"></asp:Label>
        <asp:DropDownList CssClass="filtFld" ID="dllChoice" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dllChoice_SelectedIndexChanged">
            <asp:ListItem Value="1">Expertises</asp:ListItem>
            <asp:ListItem Value="2">Interesses</asp:ListItem>
            <asp:ListItem Value="3">Socials</asp:ListItem>
            <asp:ListItem Value="4">Vakken</asp:ListItem>
            <asp:ListItem Value="5">Student</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div id="StudSelectGrid">
        <asp:GridView ID="gvStudenten" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="studentId" OnSelectedIndexChanged="gvStudenten_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="studentId" HeaderText="studentId" SortExpression="studentId" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="studentNaam" HeaderText="studentNaam" SortExpression="studentNaam" />
                <asp:BoundField DataField="studentNummer" HeaderText="studentNummer" SortExpression="studentNummer" />
                <asp:BoundField DataField="klasNaam" HeaderText="Klas" SortExpression="Klas" />
                <asp:ButtonField ControlStyle-CssClass="selBtn" ButtonType="Button" CommandName="Select" Text="Select" />
            </Columns>
        </asp:GridView>
    </div>
    <div id="StudDataGrid" class="viewSplit">
        <asp:DetailsView ID="dvExpStudent" runat="server" AllowPaging="True" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Height="50px" Width="125px" Visible="false">
            <Fields>
                <asp:BoundField DataField="studentNaam" HeaderText="studentNaam" SortExpression="studentNaam" />
                <asp:BoundField DataField="expertiseNaam" HeaderText="expertiseNaam" SortExpression="expertiseNaam" />
                <asp:BoundField DataField="expertiseNiveau" HeaderText="expertiseNiveau" SortExpression="expertiseNiveau" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>

        <asp:DetailsView ID="dvIntStudent" runat="server" AllowPaging="True" AutoGenerateRows="False" DataSourceID="SqlDataSource3" Height="50px" Width="125px" Visible="False" DataKeyNames="studentId,interesseId">
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
                <asp:TemplateField HeaderText="interesseId" SortExpression="interesseId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dllInteresses" runat="server" DataSourceID="SqlDataSourceInt" DataTextField="interesseNaam" DataValueField="interesseId" SelectedValue='<%# Bind("interesseId") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="dllInteresses" runat="server" DataSourceID="SqlDataSourceInt" DataTextField="interesseNaam" DataValueField="interesseId" SelectedValue='<%# Bind("interesseId") %>'></asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("interesseId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>

        <asp:DetailsView ID="dvSocialStudent" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="studentId,socialId" DataSourceID="SqlDataSource4" Height="50px" Width="125px" Visible="false">
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
                <asp:TemplateField HeaderText="socialId" SortExpression="socialId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dllSocials" runat="server" DataSourceID="SqlDataSourceSoc" DataTextField="socialNaam" DataValueField="socialId" SelectedValue='<%# Bind("socialId") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="dllSocials" runat="server" DataSourceID="SqlDataSourceSoc" DataTextField="socialNaam" DataValueField="socialId" SelectedValue='<%# Bind("socialId") %>'></asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("socialId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="socialLink" HeaderText="socialLink" SortExpression="socialLink" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>

        <asp:DetailsView ID="dvVakStudent" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="studentId,vakId" DataSourceID="SqlDataSource5" Height="50px" Width="125px" Visible="false">
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
                <asp:TemplateField HeaderText="vakId" SortExpression="vakId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dllVakken" runat="server" DataSourceID="SqlDataSourceVak" DataTextField="vakNaam" DataValueField="vakId" SelectedValue='<%# Bind("vakId") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="dllVakken" runat="server" DataSourceID="SqlDataSourceVak" DataTextField="vakNaam" DataValueField="vakId" SelectedValue='<%# Bind("vakId") %>'></asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("vakId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>

        <asp:DetailsView ID="dvStudent" runat="server" AutoGenerateRows="False" DataKeyNames="studentId" DataSourceID="SqlDataSource6" Height="50px" Width="125px" Visible="false" OnItemDeleted="dvStudent_ItemDeleted" OnItemInserted="dvStudent_ItemInserted" OnItemUpdated="dvStudent_ItemUpdated">
            <Fields>
                <asp:BoundField DataField="studentId" HeaderText="studentId" InsertVisible="False" ReadOnly="True" SortExpression="studentId" />
                <asp:BoundField DataField="studentNaam" HeaderText="studentNaam" SortExpression="studentNaam" />
                <asp:BoundField DataField="studentNummer" HeaderText="studentNummer" SortExpression="studentNummer" />
                <asp:TemplateField HeaderText="klasId" SortExpression="klasId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dllKlassen" runat="server" DataSourceID="SqlDataSourceKlas" DataTextField="klasNaam" DataValueField="klasId" SelectedValue='<%# Bind("klasId") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="dllKlassen" runat="server" DataSourceID="SqlDataSourceKlas" DataTextField="KlasNaam" DataValueField="klasId" SelectedValue='<%# Bind("klasId") %>'></asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("klasId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT studentId, studentNaam, studentNummer, klasNaam FROM Studenten, Klassen WHERE Klassen.klasId = Studenten.klasId"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" DeleteCommand="DELETE FROM [StudentExpertise] WHERE [studentId] = @studentId AND [expertiseId] = @expertiseId" InsertCommand="INSERT INTO [StudentExpertise] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (@studentId, @expertiseId, @expertiseNiveau)" SelectCommand="SELECT studentNaam, expertiseNaam, expertiseNiveau FROM StudentExpertise, Studenten, Expertises WHERE Studenten.studentId = @studentId AND Studenten.studentId = StudentExpertise.studentId AND StudentExpertise.expertiseId = Expertises.expertiseId" UpdateCommand="UPDATE [StudentExpertise] SET [expertiseNiveau] = @expertiseNiveau WHERE [studentId] = @studentId AND [expertiseId] = @expertiseId">
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
                <asp:ControlParameter ControlID="gvStudenten" Name="studentId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="expertiseNiveau" Type="String" />
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="expertiseId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" DeleteCommand="DELETE FROM [StudentInteresse] WHERE [studentId] = @studentId AND [interesseId] = @interesseId" InsertCommand="INSERT INTO [StudentInteresse] ([studentId], [interesseId]) VALUES (@studentId, @interesseId)" SelectCommand="SELECT * FROM [StudentInteresse] WHERE ([studentId] = @studentId)">
            <DeleteParameters>
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="interesseId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="interesseId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gvStudenten" Name="studentId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" DeleteCommand="DELETE FROM [StudentSocial] WHERE [socialId] = @socialId AND [studentId] = @studentId" InsertCommand="INSERT INTO [StudentSocial] ([socialId], [studentId], [socialLink]) VALUES (@socialId, @studentId, @socialLink)" SelectCommand="SELECT * FROM [StudentSocial] WHERE ([studentId] = @studentId)" UpdateCommand="UPDATE [StudentSocial] SET [socialLink] = @socialLink WHERE [socialId] = @socialId AND [studentId] = @studentId">
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
                <asp:ControlParameter ControlID="gvStudenten" Name="studentId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="socialLink" Type="String" />
                <asp:Parameter Name="socialId" Type="Int32" />
                <asp:Parameter Name="studentId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" DeleteCommand="DELETE FROM [StudentVak] WHERE [studentId] = @studentId AND [vakId] = @vakId" InsertCommand="INSERT INTO [StudentVak] ([studentId], [vakId]) VALUES (@studentId, @vakId)" SelectCommand="SELECT * FROM [StudentVak] WHERE ([studentId] = @studentId)">
            <DeleteParameters>
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="vakId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="studentId" Type="Int32" />
                <asp:Parameter Name="vakId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gvStudenten" Name="studentId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" DeleteCommand="DELETE FROM [Studenten] WHERE [studentId] = @studentId" InsertCommand="INSERT INTO [Studenten] ([studentNaam], [studentNummer], [klasId]) VALUES (@studentNaam, @studentNummer, @klasId)" SelectCommand="SELECT * FROM [Studenten] WHERE ([studentId] = @studentId)" UpdateCommand="UPDATE [Studenten] SET [studentNaam] = @studentNaam, [studentNummer] = @studentNummer, [klasId] = @klasId WHERE [studentId] = @studentId">
            <DeleteParameters>
                <asp:Parameter Name="studentId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="studentNaam" Type="String" />
                <asp:Parameter Name="studentNummer" Type="String" />
                <asp:Parameter Name="klasId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gvStudenten" Name="studentId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="studentNaam" Type="String" />
                <asp:Parameter Name="studentNummer" Type="String" />
                <asp:Parameter Name="klasId" Type="Int32" />
                <asp:Parameter Name="studentId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Vakken]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Klassen]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceStu" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT [studentId], [studentNaam] FROM [Studenten]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceExp" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Expertises]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceInt" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Interesses]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceSoc" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Socials]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceVak" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Vakken]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceKlas" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT * FROM [Klassen]"></asp:SqlDataSource>

    </div>
</asp:Content>
