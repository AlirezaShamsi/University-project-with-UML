using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
public partial class ManagementNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = true;
        btnContinue.Visible = false;
    }
    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        if (PhotoUpload.HasFile)
        {
            if (!CheckFileType(PhotoUpload.FileName))
            {
                lblError.Text += "<br/> " + "نوع فایل نادرست میباشد !";
            }
            else if (!CheckFileSize(PhotoUpload))
            {
                lblError.Text += "<br/> " + "اندازه فایل بزرگتر از یک مگابایت میباشد !";
            }
            else
            {
                Random rnd = new Random();
                string title, descr, writer;
                if (txtTitle.Text.Trim().Length >= 50) title = txtTitle.Text.Trim().Substring(0, 50);
                else title = txtTitle.Text.Trim();
                if (txtDescr.Text.Trim().Length >= 2000) descr = txtDescr.Text.Trim().Substring(0, 2000);
                else descr = txtDescr.Text.Trim();
                if (txtWriter.Text.Trim().Length >= 50) writer = txtWriter.Text.Trim().Substring(0, 50);
                else writer = txtWriter.Text.Trim();
                byte catid = Convert.ToByte(DDLNewsCat.SelectedValue.ToString());
                string fileName = Path.GetFileNameWithoutExtension(PhotoUpload.FileName) +
                rnd.Next(1000, 10000).ToString();
                string ext = Path.GetExtension(PhotoUpload.FileName);
                fileName = fileName + ext;
                DateTime dt = DateTime.Now;
                DataSetTableAdapters.tblNewsTableAdapter adapter = new
                DataSetTableAdapters.tblNewsTableAdapter();
                adapter.AddNews(title, descr, dt, 0, catid, writer, fileName);
                PhotoUpload.PostedFile.SaveAs(MapPath("~/Photos/" + fileName));
                lblResult.Visible = true; btnContinue.Visible = true; btnSubmit.Enabled = false;
            }
        }
        else if (!PhotoUpload.HasFile || txtTitle.Text == "" || txtDescr.Text == "")
        {
            lblError.Text += "<br/> " + "لطفا اطلاعات را کامل وارد نمایید !";
            btnContinue.Visible = true; btnSubmit.Enabled = false;
        }
    }
    bool CheckFileType(string fileName)
    {
        string ext = Path.GetExtension(fileName);
        switch (ext.ToLower())
        {
            case ".gif": return true;
            case ".png": return true;
            case ".jpg": return true;
            case ".jpeg": return true;
            default: return false;
        }
    }
    bool CheckFileSize(FileUpload fileName)
    {
        if (fileName.PostedFile.ContentLength >= Math.Pow(2, 20)) return false;
        else return true;
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
    protected void btnContinue_Click1(object sender, EventArgs e)
    {
        txtDescr.Text = string.Empty; txtWriter.Text = string.Empty;
        txtTitle.Text = string.Empty; lblError.Text = string.Empty;
        btnSubmit.Enabled = true; lblResult.Visible = false;
    }

}