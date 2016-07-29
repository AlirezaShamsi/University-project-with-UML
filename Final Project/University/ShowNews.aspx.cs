using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowNews : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        int NID;
        if (!String.IsNullOrEmpty(Request.QueryString["NID"]))
            NID = Convert.ToInt32(Request.QueryString["NID"].ToString());
        else NID = 0;
        if (NID > 0)
        {
            DataSetTableAdapters.tblNewsTableAdapter adapter =
            new DataSetTableAdapters.tblNewsTableAdapter();
            adapter.IncNOV(NID);
            ViewState["NID"] = NID;
        }
       
      
 DataSetTableAdapters. tblCommentTableAdapter comAdapter =
 new DataSetTableAdapters. tblCommentTableAdapter();
 int NOC = (int)comAdapter.NOC(NID);
 if (NOC <= 0)
 {
 lblNOC.Visible = true;
 }
else lblNOC.Text="تعداد نظرات";
 }
    
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataSetTableAdapters.tblCommentTableAdapter comAdapter =
    new DataSetTableAdapters.tblCommentTableAdapter();
        int NID = Convert.ToInt32(ViewState["NID"]);
        if ((txtName.Text == "" || txtEmail.Text == "") && txtComment.Text == "")
        {
            lblResult.Text = "خطا در ارسال پیام لطفا دوباره سعی کنید";
            lblResult.Visible = true;
        }
        else
        {
            comAdapter.AddComment(txtName.Text.Trim(), txtEmail.Text.Trim(), DateTime.Now,
           txtComment.Text.Trim(), NID, false);
            lblResult.Text = " پیام شما با موفیت ارسال شد " + " </ br>" + ". بعد از تایید توسط مدیر نمایش داده خواهد شد ";
            lblResult.Visible = true;
            btnSubmit.Enabled = false;
        }
    }
}