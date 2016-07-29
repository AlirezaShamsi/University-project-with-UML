<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Theme="General" StylesheetTheme="General"  %>

<%@ Register Src="~/UserControls/WebUserControl.ascx" TagPrefix="uc1" TagName="WebUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body class="body">
    <form id="frmMain" runat="server">

        <div align="center">
            <table border="0" cellspacing="0" cellpadding="0">

                <tr>
                    <td>&nbsp;</td>
                    <td class="header" valign="top"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="subHeader">
                        <div align="center">
                            <uc1:WebUserControl runat="server" ID="WebUserControl" />
                        </div>
                    </td>
                    <td>&nbsp;</td>
                </tr>

                <div>


                    <tr>
                        <td>&nbsp;</td>
                        <td class="main">

                            <div class="main">
                                <div class="content">
                                    <div class="contentHeader">
                                        <div class="contentHeaderLeft"></div>
                                        <div class="contentHeaderCenter">
                                            <div id="divPageMessage" runat="server" class="pageMessage">
                                                <asp:Literal ID="litPageMessage" runat="server" />
                                            </div>
                                        </div>
                                        <div class="contentSubHeader">
                                        </div>

                                    </div>

                                    <div class="contentMain">
                                        <div class="contentMainLeft"></div>
                                        <div class="contentMainCenter">

                                              <fieldset>
        <div class="field">
            <div class="lable">
                <asp:Label ID="lblUserName" runat="server" Text="نام کاربری:" />
            </div>
            <div class="controls">
                <asp:TextBox ID="txtUserName" runat="server" MaxLength="40"
                    CssClass="username" />
                <asp:RequiredFieldValidator ID="rfvUserName" runat="server"
                    ControlToValidate="txtUserName" CssClass="validator"
                    Display="Dynamic" EnableClientScript="true"
                    SetFocusOnError="true" Text="نام کاربری را وارد نمایید . . ." />
                <asp:RegularExpressionValidator ID="revUserName" runat="server"
                    ControlToValidate="txtUserName" CssClass="validator"
                    Display="Dynamic" EnableClientScript="true" SetFocusOnError="true"
                    Text="نام کاربری مورد قبول نیست . . ."
                    ValidationExpression="[a-zA-Z0-9]{4,20}" />
            </div>
        </div>
        <div class="field">
            <div class="lable">
                <asp:Label ID="lblPassword" runat="server" Text="گذر واژه:" />
            </div>
            <div class="controls">
                <asp:TextBox ID="txtPassword" runat="server" MaxLength="40" TextMode="Password"
                    CssClass="password" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="txtPassword" CssClass="validator"
                    Display="Dynamic" EnableClientScript="true"
                    SetFocusOnError="true" Text="گذر واژه را وارد نمایید . . ." />
                <asp:RegularExpressionValidator ID="revPassword" runat="server"
                    ControlToValidate="txtPassword" CssClass="validator"
                    Display="Dynamic" EnableClientScript="true" SetFocusOnError="true"
                    Text="گذر واژه مورد قبول نمیباشد . . ."
                    ValidationExpression="[a-zA-Z0-9]{6,20}" />
            </div>
        </div>

        <div class="field">
            <div class="lable">
                <asp:Label ID="lblConfirmPassword" runat="server" Text="تکرار گذر واژه:" />
            </div>
            <div class="controls">
                <asp:TextBox ID="txtConfirmPassword" runat="server" MaxLength="40" TextMode="Password"
                    CssClass="password" />
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                    ControlToValidate="txtConfirmPassword" CssClass="validator"
                    Display="Dynamic" EnableClientScript="true"
                    SetFocusOnError="true" Text="Password Is Required . . ." />
                <asp:CompareValidator ID="cmvConfirmPassword" runat="server"
                    ControlToValidate="txtConfirmPassword" CssClass="validator"
                    Display="Dynamic" EnableClientScript="true" SetFocusOnError="true"
                    Text="گذر واژها هماهنگ نمیباشند . . ."
                    Type="String" CultureInvariantValues="true" ControlToCompare="txtPassword"
                    Operator="Equal" />
            </div>
        </div>
        <div class="field">
            <div class="lable">
                <asp:Label ID="lblMail" runat="server" Text="پست الکترونیکی:" />
            </div>
            <div class="controls">
                <asp:TextBox ID="txtMail" runat="server" MaxLength="40"
                    CssClass="mail" />
                <asp:RequiredFieldValidator ID="rfvMail" runat="server"
                    ControlToValidate="txtMail" CssClass="validator"
                    Display="Dynamic" EnableClientScript="true"
                    SetFocusOnError="true" Text="پست الکترونیکی را وارد کنید . . ." />
                <asp:RegularExpressionValidator ID="revMail" runat="server"
                    ControlToValidate="txtMail" CssClass="validator"
                    Display="Dynamic" EnableClientScript="true" SetFocusOnError="true"
                    Text="پست الکترونیکی صحیح نمیباشد . . ."
                    ValidationExpression="\w+@\w+([-.]\w+)*\.\w+([-.]\w+)*" />

            </div>
        </div>

        <div class="field">
            <div class="lable">
                <asp:Label ID="lblConfirmMail" runat="server" Text="تکرار پست الکترونیکی:" />
            </div>
            <div class="controls">
                <asp:TextBox ID="txtConfirmMail" runat="server" MaxLength="40"
                    CssClass="mail" />
                <asp:RequiredFieldValidator ID="rfvConfirmMail" runat="server"
                    ControlToValidate="txtConfirmMail" CssClass="validator"
                    Display="Dynamic" EnableClientScript="true"
                    SetFocusOnError="true" Text="تکرار پست نیاز است . . ." />
                <asp:CompareValidator ID="cmvConfirmMail" runat="server"
                    ControlToValidate="txtConfirmMail" CssClass="validator"
                    Display="Dynamic" EnableClientScript="true" SetFocusOnError="true"
                    Text="نشانی پست های الکترونیکی هماهنگ نمیباشد . . ."
                    Type="String" CultureInvariantValues="true" ControlToCompare="txtMail"
                    Operator="Equal" />

            </div>

        </div>
        <div class="button">
            <asp:Button ID="btnRegister" runat="server" Text="ثبت نام" AccessKey="R" OnClick="btnRegister_Click" />
            &nbsp
            <asp:Button ID="btnCancel" runat="server" Text="انصراف" AccessKey="C" />
        </div>
    </fieldset>
                                            <br />
                                            <br />
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." CellPadding="4" ForeColor="#333333" GridLines="None" Width="519px">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                                    <asp:BoundField DataField="UserId" HeaderText="شناسه" ReadOnly="True" SortExpression="UserId" InsertVisible="False" />
                                                    <asp:BoundField DataField="UserName" HeaderText="نام کاربری" SortExpression="UserName" />
                                                    <asp:BoundField DataField="Email" HeaderText="ایمیل" SortExpression="Email" />
                                                    <asp:BoundField DataField="Password" HeaderText="پسوورد" SortExpression="Password" />
                                                    <asp:BoundField DataField="Description" HeaderText="توضیحات" SortExpression="Description" />
                                                    <asp:BoundField DataField="FullName" HeaderText="نام کامل" SortExpression="FullName" />
                                                    <asp:CheckBoxField DataField="IsUserActive" HeaderText="فعال بودن کاربر" SortExpression="IsUserActive" />
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UnivesityConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [UserId] = @UserId" InsertCommand="INSERT INTO [Users] ([UserName], [Email], [Password], [Description], [FullName], [IsUserActive]) VALUES (@UserName, @Email, @Password, @Description, @FullName, @IsUserActive)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [Email] = @Email, [Password] = @Password, [Description] = @Description, [FullName] = @FullName, [IsUserActive] = @IsUserActive WHERE [UserId] = @UserId">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="UserId" Type="Int32" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="UserName" Type="String" />
                                                    <asp:Parameter Name="Email" Type="String" />
                                                    <asp:Parameter Name="Password" Type="String" />
                                                    <asp:Parameter Name="Description" Type="String" />
                                                    <asp:Parameter Name="FullName" Type="String" />
                                                    <asp:Parameter Name="IsUserActive" Type="Boolean" />
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="UserName" Type="String" />
                                                    <asp:Parameter Name="Email" Type="String" />
                                                    <asp:Parameter Name="Password" Type="String" />
                                                    <asp:Parameter Name="Description" Type="String" />
                                                    <asp:Parameter Name="FullName" Type="String" />
                                                    <asp:Parameter Name="IsUserActive" Type="Boolean" />
                                                    <asp:Parameter Name="UserId" Type="Int32" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>



                                        </div>

                                    </div>

                                    <div class="contentMainFooter">
                                        <div class="contentMainFooterHeader">&ensp;</div>
                                        <div class="contentMainFooterLeft">
                                            <font class="text8"><input onclick="history.back()" type="button" value="بازگشت " /></center> </a></font>
                                        </div>
                                    </div>
                                </div>
                                <div class="script">

                                    <div class="script">
                                        <div class="menu">
                                            <div class="menu_header"><font class="text5">موضوعات</font></div>
                                        </div>

                                        <div class="menu_center">
                                            <div class="menu_center_center">
                                                   <asp:DataList ID="DataList1" runat="server" DataKeyField="CatID" DataSourceID="ObjectDataSource1" Width="236px">
                                                    <ItemTemplate>
                                                        <br />
                                                        <a href=' <%# Eval("CatID","AllNewsCat.aspx?Cat={0}") %>'>
                                                        <asp:Label ID="CatNameLabel" runat="server" Text='<%# Eval("CatName") %>' /></a>
                                                        <br />
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllNewsCat" TypeName="DataSetTableAdapters.tblNewsCatTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_CatID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="CatName" Type="String" />
                                                    </InsertParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="CatName" Type="String" />
                                                        <asp:Parameter Name="Original_CatID" Type="Int32" />
                                                    </UpdateParameters>
                                                  </asp:ObjectDataSource>
                                            </div>
                                        </div>
                                        <div class="menu_center">
                                        </div>
                                        <div class="menu_footer"></div>
                                    </div>

                                </div>
                            </div>






                        </td>
                        <td>&nbsp;</td>
                    </tr>



                </div>


                <tr>
                    <td>&nbsp;</td>
                    <td class="footer">

                        <div class="footer_left"></div>

                        <div class="footer_center">

                        </div>

                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
        </center>
    </form>

</body>


</html>
