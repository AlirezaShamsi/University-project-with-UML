using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        //تا در حالت معمولی پیغامی به کاریر داده نشود
        divPageMessage.Visible = false;

        string strReturnUrl=
            Request.Params["ReturnUrl"];

        if (string.IsNullOrEmpty(strReturnUrl)==false)
        {
            string strFileName =
                System.IO.Path.GetFileName(strReturnUrl);

            string strErrorMessage =
                string.Format("صفحه {0} احتیاج به شناسایی کاربر دارد  . . .", strFileName);

            divPageMessage.Visible = true;
            litPageMessage.Text = strErrorMessage;
        }

        if (Page.IsPostBack==false)
        {
            Initialize();//برای ایجاد windows form aplication هایی که در آینده انجام خواهیم داد این 
                         // این تابع را برای تنظیمات آنها آماده سازی میکنیم
        }
    }
    // حتی اگر استفاده نکنیم تابع آن را مینویسیم
    private void Initialize()
    { }

    protected virtual void DisplayErrorMessage(string message)
    {
        divPageMessage.Visible = true;
        litPageMessage.Text =
            string.Format("<div class ='error'>{0}</div>",message);
    }

    protected virtual void DisplayWarningMessage(string message)
    {
        divPageMessage.Visible = true;
        litPageMessage.Text =
            string.Format("<div class ='warning'>{0}</div>", message);
    }

    protected virtual void DisplayInformationMessage(string message)
    {
        divPageMessage.Visible = true;
        litPageMessage.Text =
            string.Format("<div class ='information'>{0}</div>", message);
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //ایجاد یک شی از دیتا ست و جدول کاربران
            DataSet.UsersDataTable oUserDataTable =
                new DataSet.UsersDataTable();

            DataSetTableAdapters.UsersTableAdapter oUserTableAdapter =
                new DataSetTableAdapters.UsersTableAdapter();

            // نسبت دادن متدی که تشکیل دادیم به آبجکت موجود
            oUserTableAdapter.FillUserByUserName(oUserDataTable, txtUserName.Text);

            // چک کردن موجود بودن کابر یا نا موجود بودن وی
            if (oUserDataTable.Count!=1)// یعنی هیچ مقداری این متد بر نگردانده
            {
                string strErrorMessage =
                    "نام کاربری یا گذر واژه صحیح نمیباشد ! لطفا دوباره سعی کنید . . . ";
                DisplayErrorMessage(strErrorMessage);
                return;
            }
            //ایجاد یک متغیر کمکی
            DataSet.UsersRow oUserRow = oUserDataTable[0];//0 یعنی کلیه مشخصات کاربر ما
            // وجود بودن و همسان بودن این پسورد با یوز نیم
            if (string.Compare(oUserRow.Password.Trim(),txtPassword.Text.Trim(),false)!=0)// false بین حروف بزرگ و کوچک تفاوت قایل میشود
            {
                 string strErrorMessage =
                    "نام کاربری یا گذر واژه صحیح نمیباشد ! لطفا دوباره سعی کنید . . . ";
                 DisplayErrorMessage(strErrorMessage);
                return;
            }
            //چک کردن فعال بودن کاربر
            if (oUserRow.IsUserActive==false)
            {
                string strInformationMessage =
                    string.Format("{0}عزیز در این لحظه شما فعال نیستید جهت رفع مشکل با ما تماس بگیرید", txtUserName.Text);
                DisplayInformationMessage(strInformationMessage);
                return;
            }

       

            Session["UserId"] = oUserRow.UserId;
            Session["UserName"] = oUserRow.UserName;

            System.Web.Security.FormsAuthentication.RedirectFromLoginPage(oUserRow.UserName, false);

            
         

           
        }
    }
    protected void btnForgetPassword_Click(object sender, EventArgs e)
    {

    }
}