<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" Theme="General" StylesheetTheme="General" %>

<%@ Register Src="~/UserControls/WebUserControl.ascx" TagPrefix="uc1" TagName="WebUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
    <title></title>
</head>

    <body class="body">
   
        <form id="frmMain" runat="server">
            
            <div align="center"">
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
                                                   <div id="divPageMessages" runat="server" class="pageMessage">
                                                <asp:Literal ID="litPageMessages" runat="server" />
                                            </div>
                                               
                                            </div>
                                            <div class="contentSubHeader" >
                                             
                                               </div>

                                        </div>

                                        <div class="contentMain">
                                            <div class="contentMainLeft"></div>
                                            <div class="contentMainCenter">
                                                <font class="text4">
                                                    <fieldset >
                                                        <legend>تماس با ما
                                                        </legend>

                                                        <div class="field">
                                                            <div class="caption">
                                                                <asp:Label ID="lblFullName" runat="server" Text="نام کامل" CssClass="label" />
                                                            </div>
                                                            <div class="controls">
                                                                <asp:TextBox ID="txtFullName" runat="server" MaxLength="50" CssClass="textBox" />
                                                            </div>
                                                        </div>

                                                        <div class="field">
                                                            <div class="caption">
                                                                <asp:Label ID="lblEmail" runat="server" Text="رایانامه" CssClass="label" />
                                                            </div>
                                                            <div class="controls">
                                                                <asp:TextBox ID="txtEmail" runat="server" MaxLength="250" CssClass="textBox" />
                                                            </div>
                                                        </div>

                                                        <div class="field">
                                                            <div class="caption">
                                                                <asp:Label ID="lblSubject" runat="server" Text="عنوان" CssClass="label" />
                                                            </div>
                                                            <div class="controls">
                                                                <asp:TextBox ID="txtSubject" runat="server" MaxLength="100" CssClass="textBox" />
                                                            </div>
                                                        </div>

                                                        <div class="field">
                                                            <div class="caption">
                                                                <asp:Label ID="lblDescription" runat="server" Text="توضیحات" CssClass="label" />
                                                            </div>
                                                            <div class="controls">
                                                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="10" Columns="60" CssClass="textBox" />
                                                            </div>
                                                        </div>

                                                        <div class="buttons">
                                                            <asp:Button ID="btnSubmit" runat="server" Text="ارسال" AccessKey="S" OnClick="btnSubmit_Click" />
                                                            &nbsp
                                                            <input type="reset" value="حالت اولیه" accesskey="R" />
                                                        </div>
                                                    </fieldset>
                                                </font>
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
                                                <div class="menu_header"><font class="text5">درباره ما</font></div>
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
                                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllNewsCat" TypeName="DataSetTableAdapters.tblNewsCatTableAdapter" DeleteMethod="DeleteCat" InsertMethod="Insert" UpdateMethod="EditCat">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="CatID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="CatName" Type="String" />
                                                    </InsertParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="CatName" Type="String" />
                                                        <asp:Parameter Name="CatID" Type="Int32" />
                                                    </UpdateParameters>
                                                     </asp:ObjectDataSource>
                                                </div>
                                            </div>
                                            <div class="menu_center">
                                                <font class="text4">
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
