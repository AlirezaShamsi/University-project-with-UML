<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagementNews.aspx.cs" Inherits="ManagementNews" Theme="General" StylesheetTheme="General" %>

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

                                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odbNewsCat" DataTextField="CatName" DataValueField="CatID">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="odbNewsCat" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllNewsCat" TypeName="DataSetTableAdapters.tblNewsCatTableAdapter"></asp:ObjectDataSource>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NewsID" DataSourceID="odbgvNewsCat" AllowPaging="True" AllowSorting="True">
                                                <Columns>
                                                    <asp:CommandField DeleteText="حذف" EditText="تغییر" ShowDeleteButton="True" ShowEditButton="True" />
                                                    <asp:BoundField DataField="NewsID" HeaderText="شماره خبر" InsertVisible="False" ReadOnly="True" SortExpression="NewsID" />
                                                    <asp:BoundField DataField="NewsTitle" HeaderText="عنوان" SortExpression="NewsTitle" />
                                                    <asp:BoundField DataField="NewsDescr" HeaderText="توضیحات" SortExpression="NewsDescr" />
                                                    <asp:BoundField DataField="NewsDate" HeaderText="تاریخ" SortExpression="NewsDate" />
                                                    <asp:BoundField DataField="NewsViewed" HeaderText="تعداد بازدید" SortExpression="NewsViewed" />
                                                    <asp:BoundField DataField="NewsCat" HeaderText="نوع" SortExpression="NewsCat" />
                                                    <asp:BoundField DataField="NewsWriter" HeaderText="نویسنده" SortExpression="NewsWriter" />
                                                    <asp:BoundField DataField="NewsImage" HeaderText="تصویر" SortExpression="NewsImage" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:ObjectDataSource ID="odbgvNewsCat" runat="server" DeleteMethod="Delete" InsertMethod="AddNews" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllNewsByCat" TypeName="DataSetTableAdapters.tblNewsTableAdapter" UpdateMethod="Update">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_NewsID" Type="Int32" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="NewsTitle" Type="String" />
                                                    <asp:Parameter Name="NewsDescr" Type="String" />
                                                    <asp:Parameter Name="NewsDate" Type="DateTime" />
                                                    <asp:Parameter Name="NewsViewed" Type="Int32" />
                                                    <asp:Parameter Name="NewsCat" Type="Byte" />
                                                    <asp:Parameter Name="NewsWriter" Type="String" />
                                                    <asp:Parameter Name="NewsImage" Type="String" />
                                                </InsertParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DropDownList1" Name="NewsCat" PropertyName="SelectedValue" Type="Byte" DefaultValue="1" />
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="NewsTitle" Type="String" />
                                                    <asp:Parameter Name="NewsDescr" Type="String" />
                                                    <asp:Parameter Name="NewsDate" Type="DateTime" />
                                                    <asp:Parameter Name="NewsViewed" Type="Int32" />
                                                    <asp:Parameter Name="NewsCat" Type="Byte" />
                                                    <asp:Parameter Name="NewsWriter" Type="String" />
                                                    <asp:Parameter Name="NewsImage" Type="String" />
                                                    <asp:Parameter Name="Original_NewsID" Type="Int32" />
                                                </UpdateParameters>
                                            </asp:ObjectDataSource>

                                            <br />


                                            <fieldset>
                                                <div>
                                                    <div class="lable">
                                                        عنوان خبر
                                                    </div>
                                                    <div class="textbox">
                                                        <asp:TextBox ID="txtTitle" runat="server" Height="16px" Width="486px" TextMode="SingleLine"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <div class="lable">
                                                        عکس
                                                    </div>
                                                    <div class="textBox">
                                                        <asp:FileUpload ID="PhotoUpload" runat="server" />
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <div class="lable">
                                                        نویسنده :
                                                    </div>
                                                    <div class="textBox">
                                                        <asp:TextBox ID="txtWriter" runat="server" TextMode="SingleLine"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <div class="lable">
                                                        شرح خبر :
                                                              
                                                    </div>
                                                    <div class="textBox">
                                                        <asp:TextBox ID="txtDescr" runat="server" TextMode="MultiLine" Rows="9" Width="449px"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <div class="lable">
                                                        دسته بندی خبر
                                                    </div>
                                                    <div class="dropDownList">
                                                        <asp:DropDownList ID="DDLNewsCat" runat="server" DataSourceID="odbinsertnews" DataTextField="CatName" DataValueField="CatID">
                                                        </asp:DropDownList>
                                                        <asp:ObjectDataSource ID="odbinsertnews" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllNewsCat" TypeName="DataSetTableAdapters.tblNewsCatTableAdapter"></asp:ObjectDataSource>
                                                    </div>
                                                    <div class="button">
                                                       
                                                        &nbsp;
                                                <asp:Button ID="btnSubmit" runat="server" Text="ارسال" Visible="true" OnClick="btnSubmit_Click1" />
                                                        &nbsp;
                                                <asp:Button ID="btnCancel" runat="server" Text="انصراف" Visible="true" OnClick="btnCancel_Click1" />
                                                        &nbsp
                                                         <asp:Button ID="btnContinue" runat="server" Text="ادامه" Visible="true" OnClick="btnContinue_Click1" />
                                                        <br />
                                                        <br />
                                                    </div>
                                                    <div class="label">
                                                        <asp:Label ID="lblResult" runat="server" Text=" خبر با موفقیت ثبت شد !" Visible="false"></asp:Label>
                                                        <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
                                                        <br />
                                                        <br />
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
