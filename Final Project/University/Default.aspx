<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Theme="General" StylesheetTheme="General" %>

<%@ Register Src="UserControls/WebUserControl.ascx" TagName="WebUserControl" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title></title>
    <style type="text/css">
    </style>
    <link href="App_Themes/General/style.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
    <script src="Scripts/Slider/desSlideshow.js"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            $("#jdesign_ir").desSlideshow({
                autoplay: 'disable',//option:enable,disable
                slideshow_width: '600',//slideshow window width
                slideshow_height: '249',//slideshow window height
                thumbnail_width: '120',//thumbnail width
                time_Interval: '4000',//Milliseconds
                directory: 'images/'// flash-on.gif and flashtext-bg.jpg directory
            });
        });
    </script>
</head>

<body class="body">
    <form id="frmMain" runat="server">

        <div align="center">
            <table border="0" cellspacing="0" cellpadding="0">

                <tr>
                    <td>&nbsp;</td>
                    <td class="header"  fontsize ="50px" align="left" valign="center">
                     
                    <script type="text/javascript">
                        
                        document.write("وبسایت اطلاع رسانی دانشگاه")
                        
                    </script>
                        
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="subHeader">
                        <div align="center">
                            <uc1:WebUserControl ID="WebUserControl1" runat="server" />
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
                                        <div class="contentMainLeft">
                                        </div>
                                        <div class="contentMainCenter">
                                            <center>
<div id="jdesign_ir" class="desSlideshow">
	<div class="jDesign_slider">
		<div>
                    <a title="" href="#"><img class="pic" src="./images/006.jpg" /></a>
                    <p dir="rtl" style="text-align: right;"><strong>&nbsp;&nbsp;&nbsp;دانشگاه:</strong><br/>&nbsp;&nbsp;
                       
                    </p>
      </div>
		<div><a title="" href="#"><img class="pic" src="./images/004.jpg" /></a>
            <p dir="rtl" style="text-align: right;"><strong>&nbsp;&nbsp;&nbsp;دانشگاه:</strong><br/>&nbsp;&nbsp;
             
                    </p>
      </div>
		<div><a title="" href="#"><img class="pic" src="./images/001.jpg" /></a>
            <p dir="rtl" style="text-align: right;"><strong>&nbsp;&nbsp;&nbsp;دانشگاه:</strong><br/>&nbsp;&nbsp;
                      
                    </p>
      </div>
		<div><a title="" href="#"><img class="pic" src="./images/003.jpg" /></a>
            <p dir="rtl" style="text-align: right;"><strong>&nbsp;&nbsp;&nbsp;دانشگاه:</strong><br/>&nbsp;&nbsp;
                     
                    </p>
                    
      </div>
  </div>
	<ul class="nav">
		<li><a href="#">دانشگاه</a></li>
  		<li><a href="#">اساتید</a></li>
  		<li><a href="#">دانشجویان</a></li>
  		<li><a href="#">کارمندان</a></li>
	</ul>
</div>
</center>

                                            <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="NewsID" DataSourceID="odbnewpage" ForeColor="#333333" Style="margin-left: 0px; margin-right: 0px">
                                                <AlternatingItemStyle BackColor="White" />
                                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                                <ItemTemplate>
                                                    <div style="border-bottom: 1px solid silver; padding: 10px 0px 10px 0px; background-color: #2b81b4; width: 100%; color: White; text-align: right; vertical-align: top;">
                                                        <b dir="rtl" style="padding-right: 10px;">عنوان خبر :
                                                            <asp:Label ID="Label2"
                                                                runat="server" Text=' <%# Eval("NewsTitle") %>'></asp:Label></b>
                                                    </div>
                                                    <div style="text-align: right; border: 1px solid blue; font-family: Tahoma; fontsize: 10pt; background-color: #eeeeee; padding: 0px 10px 10px 10px;">
                                                        <br />
                                                        <b />: کد خبر<b>
                                                            <asp:Label ID="Label1" runat="server" Text=' <%# Eval("NewsID") %>'></asp:Label>
                                                            &nbsp;<b />-&nbsp; تاریخ خبر : <b>
                                                                <asp:Label ID="Label4" runat="server" Text=' <%# Eval("NewsDate", "{0:G}")
%>'></asp:Label>
                                                                &nbsp;<b />-&nbsp; تعداد بازدید <b>
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
                                                                    <b />متن کامل خبر :<b>
                                                                        <asp:Label ID="Label5" runat="server" Text=' <%# Eval("NewsDescr") %>'></asp:Label>
                                                                        <br />
                                                                        <a href=' <%# Eval("NewsID","ShowNews.aspx?NID={0}") %>'>
                                                                            <div id="bcontinue">نظرات کاربران </div>
                                                                        </a>
                                                    </div>
                                                    <br />
                                                </ItemTemplate>
                                                <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                            </asp:DataList>
                                            <asp:ObjectDataSource ID="odbnewpage" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetTop8NewsOrderByDate" TypeName="DataSetTableAdapters.tblNewsTableAdapter" UpdateMethod="Update">
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
                                            <br />

                                            <br />
                                            <! -------------------------- Box- left----------------------- >
 <div style="width: 47%; float: left; border: 1px solid blue; text-align: right; padding-right: 0px;">
     <div style="background-color: #37b759; color: White; height: 25px; padding: 10px 10px 5px 5px; font-weight: bold;" class="Text7">
         جدید ترین خبرها
     </div>
     <asp:DataList ID="DataList4" runat="server" BackColor="White"
         BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3"
         DataKeyField="NewsID" DataSourceID="ObjectDataSource5"
         GridLines="Horizontal" Width="100%"
         Style="font-size: small">
         <AlternatingItemStyle BackColor="#F7F7F7" />
         <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
         <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
         <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
         <ItemTemplate>
             <div style="overflow: hidden; color: blue; direction: rtl">
                 * <a href=' <%# Eval("NewsID","ShowNews.aspx?NID={0}") %>' title="<%#
Eval("NewsCat","{0}") %>--<%# Eval("NewsDate","{0}") %>">
                     <asp:Label ID="NewsTitleLabel"
                         runat="server" Text=' <%# Eval("NewsTitle") %>' /></a>
                 <br />
             </div>
         </ItemTemplate>
         <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
     </asp:DataList>
     <asp:ObjectDataSource ID="ObjectDataSource5" runat="server"
         SelectMethod="GetTop8NewsOrderByDate"
         TypeName="DataSetTableAdapters.tblNewsTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" UpdateMethod="Update">
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
 </div>
                                            <! -------------------------- Box- Right----------------------- >
 <div style="width: 47%; float: right; border: 1px solid blue; text-align: right; padding-right: 0px;">
     <div style="background-color: #b61f1f; color: White; height: 25px; padding: 10px 10px 5px
5px; font-weight: bold;"
         class="text7">
         پر بازدیدترین خبر
     </div>
     <asp:DataList ID="DataList5" runat="server" BackColor="White"
         BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3"
         DataKeyField="NewsID" DataSourceID="ObjectDataSource6"
         GridLines="Horizontal" Width="100%"
         Style="font-size: small">
         <AlternatingItemStyle BackColor="#F7F7F7" />
         <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
         <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
         <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
         <ItemTemplate>
             <div style="overflow: hidden; color: blue; direction: rtl">
                 *
 <a href=' <%# Eval("NewsID","ShowNews.aspx?NID={0}") %>' title=" <%#
Eval("NewsCat","{0}") %>--<%# Eval("NewsDate","{0}") %>">
     <asp:Label ID="Unknown1"
         runat="server" Text=' <%# Eval("NewsTitle") %>' /></a>
                 <br />
             </div>
         </ItemTemplate>
         <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
     </asp:DataList>
     <asp:ObjectDataSource ID="ObjectDataSource6" runat="server"
         SelectMethod="GetTop8NewsOrderByNOV"
         TypeName="DataSetTableAdapters.tblNewsTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" UpdateMethod="Update">
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
 </div>
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
                                                <asp:DataList ID="DataList2" runat="server" DataKeyField="CatID" DataSourceID="ObjectDataSource1" Width="236px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                                                    <AlternatingItemStyle BackColor="#F7F7F7" />
                                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                    <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                                    <ItemTemplate>
                                                        <br />
                                                        <a href=' <%# Eval("CatID","AllNewsCat.aspx?Cat={0}") %>'>
                                                            <asp:Label ID="CatNameLabel" runat="server" Text='<%# Eval("CatName") %>' /></a>
                                                        <br />
                                                        <br />
                                                    </ItemTemplate>
                                                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
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
                                    <div class="script">
                                        <div class="menu">
                                            <div class="menu_header"><font class="text5">محک</font></div>
                                        </div>

                                        <div class="menu_center">
                                            <div class="menu_center_center">
                                                <img alt="موسسه حمايت از كودكان,محك" src="http://up.jazzabonline.ir/up/barankhoshk/Pictures/%D8%A8%D9%86%D8%B1%20%D9%87%D8%A7%DB%8C%20%D9%85%D8%AD%DA%A9%20(2).png" style="width: 240px; height: 200px;" title="موسسه حمايت از كودكان,محك">
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

                        <div class="footer_left">
                        </div>

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
