<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowNews.aspx.cs" Inherits="ShowNews" Theme="General" StylesheetTheme="General" %>

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
                                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="NewsID"
                                                DataSourceID="ObjectDataSource4" Width="591px">
                                                <ItemTemplate>
                                                    <div style="text-align: right; border: 1px solid blue; font-family: Tahoma; font-size: 9pt;">
                                                        <div style="border-bottom: 1px solid silver; padding: 10px 0px 10px 0px; background-color: Purple; width: 100%;">
                                                            <b>عنوان خبر</b>
                                                            <asp:Label ID="Label2" runat="server" Text=' <%# Eval("NewsTitle") %>'></asp:Label>
                                                        </div>
                                                        <br />
                                                        <b>کد خبر</b>
                                                        <asp:Label ID="Label1" runat="server" Text=' <%# Eval("NewsID") %>'></asp:Label>
                                                        &nbsp<b>-&nbsp دسته خبر</b>
                                                        <asp:Label ID="Label6" runat="server" Text=' <%# Eval("NewsCat") %>'></asp:Label>
                                                        &nbsp<b>-&nbsp تاریخ ورود خبر خبر</b>
                                                        <asp:Label ID="Label4" runat="server" Text=' <%# Eval("NewsDate", "{0:G}") %>'></asp:Label>
                                                        &nbsp<b>-&nbsp دسته بازدید خبر</b>
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#000099"
                                                            Text=' <%# Eval("NewsViewed") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <div align="center">
                                                            <image src=' <%# Eval("NewsImage","Photos/{0}") %>' width="400px" height="300px"
                                                                style="margin-left: 5px; margin-bottom: 10px;" />
                                                        </div>
                                                        <br />
                                                        <div dir="rtl" style="text-align: justify; padding: 0px 10px 10px 10px;">
                                                            <b>متن کامل خبر</b>
                                                            <br />
                                                            <asp:Label ID="Label5" runat="server" Text=' <%# Eval("NewsDescr") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:FormView>
                                            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllNewsByCat" TypeName="DataSetTableAdapters.tblNewsTableAdapter">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="1" Name="NewsCat" QueryStringField="Cat" Type="Byte" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <br />
                                            <asp:Label ID="lblNOC" runat="server"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="CommentID" DataSourceID="ObjectDataSource2" ForeColor="#333333" Width="421px">
                                                <AlternatingItemStyle BackColor="White" />
                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <ItemStyle BackColor="#E3EAEB" />
                                                <ItemTemplate>
                                                    <br />
                                                    نام کاربر:
                                                    <asp:Label ID="CommentUserNameLabel" runat="server" Text='<%# Eval("CommentUserName") %>' />
                                                    <br />
                                                    ایمیل:
                                                    <asp:Label ID="CommentEmailLabel" runat="server" Text='<%# Eval("CommentEmail") %>' />
                                                    <br />
                                                    تاریخ نظر
                                                    <asp:Label ID="CommentDateLabel" runat="server" Text='<%# Eval("CommentDate") %>' />
                                                    <br />
                                                    نظر کاربر:
                                                    <asp:Label ID="CommentTextLabel" runat="server" Text='<%# Eval("CommentText") %>' />
                                                    <br />
                                                </ItemTemplate>
                                                <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                            </asp:DataList>
                                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCommentByNewsID" TypeName="DataSetTableAdapters.tblCommentTableAdapter" UpdateMethod="EditComment">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="NewsID" QueryStringField="NID" Type="Int32" />
                                                </SelectParameters>
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
                                            <table cellspacing="1" class="style14">
                                                <tr>
                                                    <td class="style15">
                                                        <asp:TextBox ID="txtName" runat="server" Width="219px"></asp:TextBox>
                                                    </td>
                                                    <td>نام</td>
                                                </tr>
                                                <tr>
                                                    <td class="style15">
                                                        <asp:TextBox ID="txtEmail" runat="server" Width="220px" />
                                                    </td>
                                                    <td>پست الکترونیکی</td>
                                                </tr>
                                                <tr>
                                                    <td class="style15">
                                                        <asp:TextBox ID="txtComment" runat="server" Rows="6" TextMode="MultiLine"
                                                            Width="395px"></asp:TextBox>
                                                    </td>
                                                    <td>نظر</td>
                                                </tr>
                                                <tr>
                                                    <td class="style15">
                                                        <asp:Label ID="lblResult" runat="server"></asp:Label></td>
                                                    <td>
                                                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text=" ارسال نظر" />
                                                    </td>
                                                </tr>
                                            </table>
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
                                                 <asp:DataList ID="DataList2" runat="server" DataKeyField="CatID" DataSourceID="ObjectDataSource1" Width="236px">
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
