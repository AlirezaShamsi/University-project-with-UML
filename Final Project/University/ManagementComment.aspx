<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagementComment.aspx.cs" Inherits="ManagementComment" Theme="General" StylesheetTheme="General" %>

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
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CommentID" DataSourceID="ObjectDataSource3">
                                                <Columns>
                                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                                    <asp:BoundField DataField="CommentUserName" HeaderText="نام کاربری" SortExpression="CommentUserName" />
                                                    <asp:BoundField DataField="CommentEmail" HeaderText="ایمیل" SortExpression="CommentEmail" />
                                                    <asp:BoundField DataField="CommentDate" HeaderText="تاریخ نظر" SortExpression="CommentDate" />
                                                    <asp:BoundField DataField="CommentText" HeaderText="نظر" SortExpression="CommentText" />
                                                    <asp:BoundField DataField="NewsID" HeaderText="شماره خبر" SortExpression="NewsID" />
                                                    <asp:CheckBoxField DataField="Approved" HeaderText="تایید" SortExpression="Approved" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete" InsertMethod="AddComment" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllCommentOrderByDate" TypeName="DataSetTableAdapters.tblCommentTableAdapter" UpdateMethod="EditComment">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_CommentID" Type="Int32" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="CommentUserName" Type="String" />
                                                    <asp:Parameter Name="CommentEmail" Type="String" />
                                                    <asp:Parameter Name="CommentDate" Type="DateTime" />
                                                    <asp:Parameter Name="CommentText" Type="String" />
                                                    <asp:Parameter Name="NewsID" Type="Int32" />
                                                    <asp:Parameter Name="Approved" Type="Boolean" />
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="CommentUserName" Type="String" />
                                                    <asp:Parameter Name="CommentEmail" Type="String" />
                                                    <asp:Parameter Name="CommentDate" Type="DateTime" />
                                                    <asp:Parameter Name="CommentText" Type="String" />
                                                    <asp:Parameter Name="NewsID" Type="Int32" />
                                                    <asp:Parameter Name="Approved" Type="Boolean" />
                                                    <asp:Parameter Name="CommentID" Type="Int32" />
                                                </UpdateParameters>
                                            </asp:ObjectDataSource>
                                            <br />
                                            <br />
                                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
                                                CellPadding="4" DataKeyNames="CommentID" DataSourceID="ObjectDataSource2"
                                                DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" dir="rtl"
                                                Width="522px" Style="margin-right: 0px">
                                                <AlternatingRowStyle BackColor="White" />
                                                <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                                                <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                                                <Fields>
                                                    <asp:BoundField DataField="CommentID" HeaderText="CommentID"
                                                        InsertVisible="False" ReadOnly="True" SortExpression="CommentID" />
                                                    <asp:BoundField DataField="CommentUserName" HeaderText="نام کاربر"
                                                        SortExpression="CommentUserName" />
                                                    <asp:BoundField DataField="CommentEmail" HeaderText="ایمیل"
                                                        SortExpression="CommentEmail" />
                                                    <asp:BoundField DataField="CommentDate" HeaderText="تاریخ نظر" SortExpression="CommentDate" />
                                                    <asp:BoundField DataField="CommentText" HeaderText="متن نظر"
                                                        SortExpression="CommentText" ControlStyle-Height="90" ControlStyle-Width="300" >
<ControlStyle Height="90px" Width="300px"></ControlStyle>
                                                    </asp:BoundField>
                                                    <asp:CommandField ShowDeleteButton="True" ShowInsertButton="True" />
                                                </Fields>
                                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                            </asp:DetailsView>
                                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                                                InsertMethod="AddComment"
                                                SelectMethod="GetAllCommentOrderByDate"
                                                TypeName="DataSetTableAdapters.tblCommentTableAdapter" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_CommentID" Type="Int32" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="CommentUserName" Type="String" />
                                                    <asp:Parameter Name="CommentEmail" Type="String" />
                                                    <asp:Parameter Name="CommentDate" Type="DateTime" />
                                                    <asp:Parameter Name="CommentText" Type="String" />
                                                    <asp:Parameter Name="NewsID" Type="Int32" />
                                                    <asp:Parameter Name="Approved" Type="Boolean" />
                                                </InsertParameters>
                                            </asp:ObjectDataSource>
                                            <br />
                                            <br />

                                        </div>
                                    </div>

                                    <div class="contentMainFooter">
                                        <div class="contentMainFooterHeader">&ensp;<asp:Button ID="btnUpdate" runat="server" Text="به روز رسانی صفحه" OnClick="btnUpdate_Click" />

                                        </div>
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
