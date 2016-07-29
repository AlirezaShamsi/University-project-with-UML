<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagementCat.aspx.cs" Inherits="ManagementCat" Theme="General" StylesheetTheme="General" %>

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
                                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CatID" DataSourceID="ObjectDataSource2" Width="302px">
                                                <Columns>
                                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                                    <asp:BoundField DataField="CatID" HeaderText="شماره دسته" InsertVisible="False" ReadOnly="True" SortExpression="CatID" />
                                                    <asp:BoundField DataField="CatName" HeaderText="نام دسته" SortExpression="CatName" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="CatID" DataSourceID="ObjectDataSource3" DefaultMode="Insert" Height="50px" Style="margin-right: 0px" Width="187px">
                                                <Fields>
                                                    <asp:BoundField DataField="CatName" HeaderText="نام دسته" SortExpression="CatName" />
                                                    <asp:CommandField CancelText="انصراف" InsertText="اضافه " NewText="جدید" ShowInsertButton="True" />
                                                </Fields>
                                            </asp:DetailsView>
                                            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" InsertMethod="AddCat" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllNewsCat" TypeName="DataSetTableAdapters.tblNewsCatTableAdapter">
                                                <InsertParameters>
                                                    <asp:Parameter Name="CatName" Type="String" />
                                                </InsertParameters>
                                            </asp:ObjectDataSource>
                                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="DeleteCat" InsertMethod="AddCat" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllNewsCat" TypeName="DataSetTableAdapters.tblNewsCatTableAdapter" UpdateMethod="EditCat">
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
