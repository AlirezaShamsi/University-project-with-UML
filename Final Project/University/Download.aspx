<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Download.aspx.cs" Inherits="Download" Theme="General" StylesheetTheme="General" %>

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
                                        </div>
                                        <div class="contentSubHeader">
                                        </div>

                                    </div>

                                    <div class="contentMain">
                                        <div class="contentMainLeft"></div>
                                        <div class="contentMainCenter">
                                             <div>
    <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
            RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="470px">
<AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="نام فایل" />
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                            CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />

<HeaderStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True"></HeaderStyle>

            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />

<RowStyle BackColor="#E3EAEB"></RowStyle>
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>
                                            <font class="text4">
                                                   
                                                </font>
                                        </div>
                                    </div>

                                    <div class="contentMainFooter">
                                        <div class="contentMainFooterHeader">&ensp;</div>
                                        <div class="contentMainFooterLeft">
                                          <font class="text8"><input onclick="history.back()" type="button" value="بازگشت " /></center> </a></font>>
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
                                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllNewsCat" TypeName="DataSetTableAdapters.tblNewsCatTableAdapter">
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
