using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();

        System.Web.SessionState.SessionIDManager oSessionIdManager =
            new System.Web.SessionState.SessionIDManager();
        string strNewSessionId =
            oSessionIdManager.CreateSessionID(Context);
        bool blnRedireced;
        bool blnCookieAdded;

        oSessionIdManager.SaveSessionID(Context, strNewSessionId, out blnRedireced, out blnCookieAdded);

        System.Web.Security.FormsAuthentication.SignOut();

        Response.Redirect("~/Login.aspx", false);
    }
}