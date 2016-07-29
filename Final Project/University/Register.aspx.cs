using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        divPageMessage.Visible = false;

        if (Page.IsPostBack == false)
        {
            // For windows for Application
            Initialize();
        }
    }

    private void Initialize()
    {

    }

    // چک کردن ولیدت ها برای دوتا از کنترها علاوه بر کنترهای ماکروسافت در صفحه طراحی
    // در یم مرحله پیغامهای خطا نمایش داده میشود
    // تابع خصوصی برای اینکه باید از داخل دسترسی داشته باشیم
    // ایجاد چهار پارامتر برای متد
    private string CheckValidationForUserNameAndPassword
        (DataSetTableAdapters.UsersTableAdapter oUserTableAdapter,
        DataSet.UsersDataTable oUserDataTable, string username, string email)
    {
        string strErrorMessage = string.Empty;

        oUserTableAdapter.FillUserByUserName(oUserDataTable, username);// ایجاد چارامتر برای متد fill

        //هیچ مقدار مشابهی وجود نداشته باشد مقدار پایگاه داده
        if (oUserDataTable.Count != 0)
        {
            if (string.IsNullOrEmpty(strErrorMessage) == false)// درصورت تکراری بودن
            {
                strErrorMessage += "<br/>";
            }

            strErrorMessage +=
                "نام کاربری تکراری است نام دیگری را برگزینید.";
        }

        // عملیات بالا برای ایمیل
        oUserTableAdapter.FillUserByEmail(oUserDataTable, email);
        if (oUserDataTable.Count != 0)
        {
            if (string.IsNullOrEmpty(strErrorMessage) == false)
            {
                strErrorMessage += "<br/>";
            }

            strErrorMessage +=
                 "ایمیل وجود دارد لطفا ایمیل جدید را انتخاب نمیایید.";
        }

        return (strErrorMessage);
    }

    protected virtual void DisplayErrorMessage(string message)
    {
        divPageMessage.Visible = true;
        litPageMessage.Text =
            string.Format("<div class ='error'>{0}</div>", message);
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



    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)//میخوایم تمام محتوای  صفحه رو یک جا برسی کنیم که آیا اعتبار دارند یا نه
        {
            DataSet.UsersDataTable oUserDataTable =
                new DataSet.UsersDataTable();

            DataSetTableAdapters.UsersTableAdapter oUserTableAdapter =
                new DataSetTableAdapters.UsersTableAdapter();
            // برسی متدی که بالا به آن دادیم
            string strErrorMessage =
                CheckValidationForUserNameAndPassword
                (oUserTableAdapter, oUserDataTable, txtUserName.Text, txtMail.Text);

            if (string.IsNullOrEmpty(strErrorMessage) == false)
            {
                DisplayErrorMessage(strErrorMessage);
                return;
            }
            // اگر تمام اطلاعات درست بود کاربر جدید درست کن 
            DataSet.UsersRow oUserRow =
                oUserDataTable.NewUsersRow();
            // تغیراتی که باید در پایگاه داده شود
            oUserRow.IsUserActive = true;
            oUserRow.Email = txtMail.Text;
            oUserRow.UserName = txtUserName.Text;
            oUserRow.Password = txtPassword.Text;

            oUserDataTable.AddUsersRow(oUserRow);
            oUserTableAdapter.Update(oUserDataTable);

            string strInformationMessage =
                "عملیات ثبت با موفقیت انجام شد  . . .";
            DisplayInformationMessage(strInformationMessage);
        }
    }

}