using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        litOnLineUserCount.Text =
            string.Format("کاربران آنلاین:{0:#,##0}", Application["OnLineUserCount"]);

        if ((Context != null) &&
            (Context.User != null) &&
            (Context.User.Identity != null) &&
            (Context.User.Identity.IsAuthenticated))
        {
            if (Session["UserId"]==null)
            {
                Response.Redirect("~/Logout.aspx", false);
                return;
            }
            //در صورت وجود
            lnkHome.Visible = true;
            lnkLogin.Visible = false;
            lnkLogout.Visible = true;
            lblWelcome.Visible = true;
            litContact.Visible = true;
            lnkContact.Visible = true;
            litAbout.Visible = true;
            lnkAbout.Visible = true;
            litAdminPage.Visible = true;
            lnkAdminPage.Visible = true;

            string strUsername =
                Session["UserName"].ToString();

            lblWelcome.Text = string.Format("   | Welcome {0}!   ", strUsername);
        }

           
        

        else
        {
            lnkHome.Visible = true;
            lnkLogin.Visible = true ;
            lnkLogout.Visible = false;
            lblWelcome.Visible = false;
            litContact.Visible = true;
            lnkContact.Visible = true;
            litAbout.Visible = true;
            lnkAbout.Visible = true;
            litAdminPage.Visible = false;
            lnkAdminPage.Visible = false;

            lblWelcome.Text = string.Empty;
               
        }
    }
}