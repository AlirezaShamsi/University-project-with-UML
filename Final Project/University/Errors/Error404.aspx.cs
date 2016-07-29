using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Errors_Error404 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strAspxErrorPath =
            Request.Params["aspxerrorpath"];
        string strFileName =
            System.IO.Path.GetFileName(strAspxErrorPath);

        switch (strFileName.ToUpper())
        {
            case "DEFALT.ASPX":
            case "DEFUALT.ASPX":
            case "DEFAULT.ASPX":
                {
                    Response.Redirect("~/Default.aspx", false);
                    break;
                }

            default:
                {
                    break;
                }
        }
    }
}