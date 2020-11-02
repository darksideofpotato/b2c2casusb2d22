<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="b2c2casusb2d22.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainWindow" runat="server">
    <h1>Profile of  <asp:Label ID="lblName1" runat="server" Text="1"></asp:Label></h1>

    <img src="Images/default-user-image.png" height="300px" />


    <asp:Label ID="lblId" runat="server" Text="lblName"></asp:Label>
    <asp:Label ID="lblName" runat="server" Text="lblName"></asp:Label>
    <asp:Label ID="lblClass" runat="server" Text="lblClass"></asp:Label>

    <asp:GridView ID="gridViewExpertise" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="expertiseNaam" HeaderText="expertiseNaam" SortExpression="expertiseNaam" />
            <asp:BoundField DataField="expertiseNiveau" HeaderText="expertiseNiveau" SortExpression="expertiseNiveau" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT expertiseNaam, expertiseNiveau FROM Expertises, StudentExpertise, Studenten WHERE Expertises.expertiseId = StudentExpertise.expertiseId AND Studenten.studentId = @id AND Studenten.studentId = StudentExpertise.studentId">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblId" Name="id" PropertyName="Text"/>
        </SelectParameters>
    </asp:SqlDataSource>
   

    <asp:ListView ID="listCourses" runat="server" DataSourceID="SqlDataSource3">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Label ID="vakNaamLabel" runat="server" Text='<%# Eval("vakNaam") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="vakNaamTextBox" runat="server" Text='<%# Bind("vakNaam") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="vakNaamTextBox" runat="server" Text='<%# Bind("vakNaam") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Label ID="vakNaamLabel" runat="server" Text='<%# Eval("vakNaam") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server">vakNaam</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Label ID="vakNaamLabel" runat="server" Text='<%# Eval("vakNaam") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT vakNaam FROM Vakken, StudentVak, Studenten WHERE Studenten.studentId = @id AND Studenten.studentId = StudentVak.studentId AND StudentVak.vakId = Vakken.vakId">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblId" DefaultValue="1" Name="id" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="listInterests" runat="server" DataSourceID="SqlDataSource2">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Label ID="interesseNaamLabel" runat="server" Text='<%# Eval("interesseNaam") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="interesseNaamTextBox" runat="server" Text='<%# Bind("interesseNaam") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="interesseNaamTextBox" runat="server" Text='<%# Bind("interesseNaam") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Label ID="interesseNaamLabel" runat="server" Text='<%# Eval("interesseNaam") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server">interesseNaam</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Label ID="interesseNaamLabel" runat="server" Text='<%# Eval("interesseNaam") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT interesseNaam FROM Interesses, StudentInteresse, Studenten WHERE Studenten.studentId = @id AND Studenten.studentId = StudentInteresse.studentId AND Interesses.interesseId = StudentInteresse.interesseId">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblId" DefaultValue="1" Name="id" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="listSocials" runat="server" DataSourceID="SqlDataSource4">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="socialNaamLabel" runat="server" Text='<%# Eval("socialNaam") %>' />
                </td>
                <td>
                    <asp:Label ID="socialLinkLabel" runat="server" Text='<%# Eval("socialLink") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="socialNaamTextBox" runat="server" Text='<%# Bind("socialNaam") %>' />
                </td>
                <td>
                    <asp:TextBox ID="socialLinkTextBox" runat="server" Text='<%# Bind("socialLink") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="socialNaamTextBox" runat="server" Text='<%# Bind("socialNaam") %>' />
                </td>
                <td>
                    <asp:TextBox ID="socialLinkTextBox" runat="server" Text='<%# Bind("socialLink") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="socialNaamLabel" runat="server" Text='<%# Eval("socialNaam") %>' />
                </td>
                <td>
                    <asp:Label ID="socialLinkLabel" runat="server" Text='<%# Eval("socialLink") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">socialNaam</th>
                                <th runat="server">socialLink</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="socialNaamLabel" runat="server" Text='<%# Eval("socialNaam") %>' />
                </td>
                <td>
                    <asp:Label ID="socialLinkLabel" runat="server" Text='<%# Eval("socialLink") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString %>" SelectCommand="SELECT socialNaam, socialLink FROM Socials, StudentSocial, Studenten WHERE Studenten.studentId = @id AND Studenten.studentId = StudentSocial.studentId AND StudentSocial.socialId = Socials.socialId">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblId" Name="id" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
