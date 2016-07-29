<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllNewsCat.aspx.cs" Inherits="AllNewsCat" Theme="General" StylesheetTheme="General" %>

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
                                            <asp:DataList ID="DataList4" runat="server" CellPadding="3"
                                                DataKeyField="NewsID" DataSourceID="ObjectDataSource2"
                                                Style="text-align: right; margin-right: 0px;" Width="591px" BackColor="White"
                                                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Both">
                                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                                <ItemStyle ForeColor="#000066" />
                                                <ItemTemplate>
                                                    <div style="border-bottom: 1px solid silver; padding: 10px 0px 10px 0px; background-color: #8474AF; width: 100%; height: 20px; color: #FFFF99; font-family: Tahoma; font-size: 9pt;">
                                                        <div style="float: left; padding-left: 15px;">
                                                            درج تاریخ :
                                                            <asp:Label ID="NewsDateLabel" runat="server" Text=' <%# Eval("NewsDate","{0:G}") %>' />
                                                        </div>
                                                        <div style="float: right;">
                                                            <b>عنوان خبر</b>
                                                            <asp:Label ID="Label2" runat="server" Text=' <%# Eval("NewsTitle") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div style="font-family: Tahoma; font-size: 10pt; text-align: justify; direction: rtl;">
                                                        <br />
                                                        <asp:Label ID="NewsDescrLabel" runat="server" Text=' <%# Eval("NewsDescr") %>' />
                                                    </div>
                                                    <br />
                                                    <a href=' <%# Eval("NewsID","ShowNews.aspx?NID={0}") %>'>
                                                        <div id="bcontinue">ادامه مطلب</div>
                                                    </a>
                                                </ItemTemplate>
                                                <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                            </asp:DataList>
                                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetAllNewsByCat"
                                                TypeName="DataSetTableAdapters.tblNewsTableAdapter">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="1" Name="NewsCat"
                                                        QueryStringField="Cat" Type="Byte" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <font class="text4">

                                                   
                                                </font>
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
