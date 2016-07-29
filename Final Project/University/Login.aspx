<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Theme="General" StylesheetTheme="General" %>

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
                                            <div id="divPageMessage" runat="server" class="pageMessages">
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
        <legend>Login</legend>
        <asp:ValidationSummary ID="myLoginValidation" runat="server"
            EnableClientScript="true" CssClass="validator" DisplayMode="BulletList"
            ShowSummary="true" ShowMessageBox="false" HeaderText="لطفا خطاهای زیر را بررسی نمایید و سپس ادامه دهید . . ."
            ValidationGroup="Login" />

        <div class="field">
            <div class="lable">
                <asp:Label ID="lblUserName" runat="server" Text="نام کاربری:" />
            </div>
            <div class="controls">
                <asp:TextBox ID="txtUserName" runat="server" MaxLength="40" CssClass="username" />

                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName"
                    Display="Dynamic" SetFocusOnError="true" EnableClientScript="true"
                    CssClass="validator" Text="*" ErrorMessage="نام کاربری نیاز است . . ."
                    ValidationGroup="Login" />

                <asp:RegularExpressionValidator ID="revUserName" runat="server" ControlToValidate="txtUserName"
                    Display="Dynamic" SetFocusOnError="true" EnableClientScript="true"
                    CssClass="validator" Text="*" ErrorMessage="نام کاربری مورد قبول نمیباشد . . ."
                    ValidationExpression="[a-zA-Z0-9]{4,20}"
                    ValidationGroup="Login" />

            </div>
        </div>

        <div class="field">
            <div class="lable">
                <asp:Label ID="lblPassword" runat="server" Text="گذر واژه:" />
            </div>
            <div class="controls">
                <asp:TextBox ID="txtPassword" runat="server" MaxLength="40" CssClass="password" TextMode="Password" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                    Display="Dynamic" SetFocusOnError="true" EnableClientScript="true"
                    CssClass="validator" Text="*" ErrorMessage="گذرواژه نیاز است . . ."
                    ValidationGroup="Login" />

                <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"
                    Display="Dynamic" SetFocusOnError="true" EnableClientScript="true"
                    CssClass="validator" Text="*" ErrorMessage="گذر واژه مورد قبول نیست . . ."
                    ValidationExpression="[a-zA-Z0-9]{6,20}"
                    ValidationGroup="Login" />

            </div>
        </div>

        <div class="button">
            <asp:Button ID="btnLogin" runat="server" Text="ورود" AccessKey="L" ValidationGroup="Login" OnClick="btnLogin_Click" />
            &nbsp
            <asp:Button ID="btnCancel" runat="server" Text="انصراف" AccessKey="C" />
        </div>
    </fieldset>
    <br />
    <fieldset>

        <asp:ValidationSummary ID="myForgetPasswordValidation" runat="server"
            EnableClientScript="true" CssClass="validator" DisplayMode="BulletList"
            ShowSummary="true" ShowMessageBox="false" HeaderText="خطای زیر را بررسی نموده و سپس ادامه دهید . . ."
            ValidationGroup="ForgetPassword" />

        <legend>فراموشی پسورد</legend>
        <div class="field">
            <div class="lable">
                <asp:Label ID="lblForgetPassword" runat="server" Text="ایمیل خود را وارد نمایید:" />
            </div>
            <div class="mail">
                <asp:TextBox ID="txtForgetPassword" runat="server" MaxLength="40" CssClass="password" />

                <asp:RequiredFieldValidator ID="rfvForgetPassword" runat="server" CssClass="validator"
                    Display="Dynamic" SetFocusOnError="true" EnableClientScript="true" Text="*"
                    ErrorMessage="ایمیل خود را وارد نمایید . . ." ControlToValidate="txtForgetPassword"
                    ValidationGroup="ForgetPassword" />
            </div>
            <div class="button">
                <asp:Button ID="btnForgetPassword" runat="server" Text="ارسال" AccessKey="S" ValidationGroup="ForgetPassword" OnClick="btnForgetPassword_Click" />
            </div>
        </div>
    </fieldset>
                                        </div>
                                    </div>

                                    <div class="contentMainFooter">
                                        <div class="contentMainFooterHeader">&ensp;</div>
                                        <div class="contentMainFooterLeft">
                                            <font class="text8"><input onclick="history.back()" type="button" value="بازگشت " /></center></a></font>
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
                            <script type="text/javascript">
                                document.write("All rights reserved By Alireza Shamsi");
                                                </script>
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
