<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="UserControls_WebUserControl" %>
<link href="../App_Themes/General/StyleSheet.css" rel="stylesheet" />
<div style="float:initial" >
    &nbsp
    <asp:HyperLink ID="lnkHome" runat="server" Text="خانه"
            NavigateUrl="~/Default.aspx" CssClass="link" />

    <asp:Literal ID="litNews" runat="server" Text="|" />
    <asp:HyperLink ID="lnkNews" runat="server" Text="اخبار"
        NavigateUrl="~/AllNewsCat.aspx" CssClass="link" />

    <asp:Literal ID="litDownload" runat="server" Text="|" />
    <asp:HyperLink ID="lnkDownload" runat="server" Text="دریافت فایل"
        NavigateUrl="~/Download.aspx" CssClass="link" />
  
    <asp:Literal ID="litContact" runat="server" Text="|" />
    <asp:HyperLink ID="lnkContact" runat="server" Text="ارتباط با ما"
        NavigateUrl="~/Contact.aspx" CssClass="link" />

    <asp:Literal ID="litAbout" runat="server" Text="|" />
    <asp:HyperLink ID="lnkAbout" runat="server" Text="درباره ما"
        NavigateUrl="~/About.aspx" CssClass="link" />
    |
    <asp:Literal ID="litAdminPage" runat="server" Text="|" />
    <asp:HyperLink ID="lnkAdminPage" runat="server" Text="مدیریت سایت"
        NavigateUrl="~/AdminPage.aspx" CssClass="link" />
     &nbsp
      <span>
        <asp:HyperLink ID="lnkLogin" runat="server" Text="ورود"
            NavigateUrl="~/Login.aspx" CssClass="link" />

        <asp:HyperLink ID="lnkLogout" runat="server" Text="خروج"
            NavigateUrl="~/Logout.aspx" CssClass="link" />
       
        <asp:Label ID="lblWelcome" runat="server" />
          
    </span>
   
     </div>
    <div style="float:right; color:white;">
    <asp:Literal ID="litOnLineUserCount" runat="server" />
        </div>
       

