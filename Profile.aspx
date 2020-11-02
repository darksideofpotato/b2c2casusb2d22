<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="b2c2casusb2d22.Profile" %>
<asp:Content ID="ProfileContent" ContentPlaceHolderID="MainWindow" runat="server">
    <div>
        <h1>Profile of  <asp:Label ID="lblName1" runat="server" Text="1"></asp:Label></h1>
        <p>Profile image placeholder</p>
        <asp:Label ID="lblId" runat="server" Text="lblName"></asp:Label>
        <asp:Label ID="lblName" runat="server" Text="lblName"></asp:Label>
        <asp:Label ID="lblClass" runat="server" Text="lblClass"></asp:Label>
        <asp:GridView ID="gridViewExpertise" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="expertiseNaam" HeaderText="expertiseNaam" SortExpression="expertiseNaam" />
                <asp:BoundField DataField="expertiseNiveau" HeaderText="expertiseNiveau" SortExpression="expertiseNiveau" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString3 %>" SelectCommand="SELECT expertiseNaam, expertiseNiveau FROM Expertises, StudentExpertise, Studenten WHERE Expertises.expertiseId = StudentExpertise.expertiseId AND Studenten.studentId = @id AND Studenten.studentId = StudentExpertise.studentId">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblId" Name="id" PropertyName="Text"/>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        <asp:ListView ID="listCourses" runat="server" DataSourceID="SqlDataSource3">
            <AlternatingItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="vakNaamLabel" runat="server" Text='<%# Eval("vakNaam") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr>
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
                <table runat="server">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr>
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
                <tr>
                    <td>
                        <asp:Label ID="vakNaamLabel" runat="server" Text='<%# Eval("vakNaam") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server">
                                <tr runat="server">
                                    <th runat="server">vakNaam</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="vakNaamLabel" runat="server" Text='<%# Eval("vakNaam") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString3 %>" SelectCommand="SELECT vakNaam FROM Vakken, StudentVak, Studenten WHERE Studenten.studentId = @id AND Studenten.studentId = StudentVak.studentId AND StudentVak.vakId = Vakken.vakId">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblId" DefaultValue="1" Name="id" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="listInterests" runat="server" DataSourceID="SqlDataSource2">
            <AlternatingItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="interesseNaamLabel" runat="server" Text='<%# Eval("interesseNaam") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr>
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
                <table runat="server">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr>
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
                <tr>
                    <td>
                        <asp:Label ID="interesseNaamLabel" runat="server" Text='<%# Eval("interesseNaam") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server">
                                <tr runat="server">
                                    <th runat="server">interesseNaam</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="interesseNaamLabel" runat="server" Text='<%# Eval("interesseNaam") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString3 %>" SelectCommand="SELECT interesseNaam FROM Interesses, StudentInteresse, Studenten WHERE Studenten.studentId = @id AND Studenten.studentId = StudentInteresse.studentId AND Interesses.interesseId = StudentInteresse.interesseId">
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
                <table runat="server">
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
                <tr>
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
                                <tr runat="server">
                                    <th runat="server">socialNaam</th>
                                    <th runat="server">socialLink</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="socialNaamLabel" runat="server" Text='<%# Eval("socialNaam") %>' />
                    </td>
                    <td>
                        <asp:Label ID="socialLinkLabel" runat="server" Text='<%# Eval("socialLink") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AfstandslerenDBConnectionString3 %>" SelectCommand="SELECT socialNaam, socialLink FROM Socials, StudentSocial, Studenten WHERE Studenten.studentId = @id AND Studenten.studentId = StudentSocial.studentId AND StudentSocial.socialId = Socials.socialId">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblId" Name="id" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
