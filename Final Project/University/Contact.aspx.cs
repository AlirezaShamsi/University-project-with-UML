public partial class Contact : System.Web.UI.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		
        divPageMessages.Visible = false;

	}


    //info,admin,sales,webmaster,support,noreplay,job
	//یک شی از مسیج میسازیم و یک شی از اس ام تی پی 
    //بعد مسیج رو میدیم به اس ام تی پی

    
	protected void btnSubmit_Click(object sender, System.EventArgs e)
	{
		if (Page.IsValid)
		{
			try
			{
                //میشه به جای خوراک از تکست باکس ها متن های بهتری ارسال کنید
				//ایجاد یک بدنه با قالب برای ایمیل
				//میتونید به اچ تی ام ال درست کنید  
				//این بدنه داخل ایمیل ادمین میاد
				string strBody = string.Empty;

				strBody += string.Format("<b>Full Name</b>: {0}<br />", txtFullName.Text);
				strBody += string.Format("<b>E-Mail</b>: <a href='mailto:{0}'>{0}</a><br />", txtEmail.Text);
				strBody += string.Format("<b>Subject</b>: {0}<br />", txtSubject.Text);
				strBody += string.Format("<b>Description</b>: {0}<br />", txtDescription.Text.Replace("\n", "<br />"));
				
				//در 5 جا که 3 تای اون پراپرتی میل مسیج هستند
				//فرام -سندر - ریپلای تو -فرام وب کانفیگ و اکانت وب کانفیگ
				//اگر یکسان باشد احتمال اینکه ایمیل شما
				//وارد اسپام نشود زیادتره

                //ایجاد یک شی از میل مسیج
				System.Net.Mail.MailMessage oMailMessage =
					new System.Net.Mail.MailMessage();
				
				//فرام - سندر - میل آدرس 
				//هر سه پراپرتی میل مسیج از جنس میل آدرس هستند 
				//پس یک شی از میل آدرس ایجاد میکنیم
				System.Net.Mail.MailAddress oMailAddress = null;
			
				// کاملترین شکل ایجاد میل آدرس میل آدرس سه قسمت دارد 
                //ایمیل
				//دیسپلی نیم
				//یونی کد
				oMailAddress =
					new System.Net.Mail.MailAddress
						(
							"noReplay@yahoo.com",
							"Auto Response Email Sender",
							System.Text.Encoding.UTF8
						);

				//برای فرام - میل آدرس و سندر 
				//معمولا یک آدرس را انتخاب میکنیم
				oMailMessage.From = oMailAddress;
				oMailMessage.Sender = oMailAddress;
				

			
				//آیتم های ذیل از جنس میل آدرس کالکشن هست
				//چون گیرنده یکی هست گیرندگان  بیشتر از یکی هستند
				//چهار کالکشن ذیل بهتر است ابتدا کلیر شوند
				//تو - سی سی - بی سی سی -ریپلای تو
				//باید به میل آدرس اد شوند
				oMailMessage.To.Clear();
				oMailMessage.CC.Clear();
				oMailMessage.Bcc.Clear();
				oMailMessage.ReplyToList.Clear();
				oMailMessage.Attachments.Clear();
				
				
			    
				oMailMessage.ReplyToList.Add(oMailAddress);
			
				//میتونیم شخص یا اشخاص دیگری را به غیر از خودمون مشخص کنیم 
				//که ایمیل را دریافت کنند
				//مثل خود شخصی که متن را ارسال نموده است
				oMailAddress =
					new System.Net.Mail.MailAddress
						(
							txtEmail.Text,
							txtFullName.Text,
							System.Text.Encoding.UTF8
						);

				//ما با تو این کار را انجام دادیم
				oMailMessage.To.Add(oMailAddress);
			
				//بادی را این کدینگ میکنیم
				oMailMessage.BodyEncoding = System.Text.Encoding.UTF8;
				oMailMessage.Body = strBody;
			
				//سابجکت را یونی کد میکنیم
				oMailMessage.SubjectEncoding = System.Text.Encoding.UTF8;

			
				//یه پیشوند یا امضا قبل از سابجکت قرار میدهیم تا فیلترینگ
				//ایمیل ها ساده شوند
				oMailMessage.Subject =
					"[-<Company Name>-] - " + txtSubject.Text;
			
				//اگر تورو باشد و متن حاوی کد اچ تی ام ال باشد 
				//کد ترجمه شده و عمل کرده میبینید
				oMailMessage.IsBodyHtml = true;

				//اولویت ایمیل را مشخص میکنیم
				oMailMessage.Priority =
					System.Net.Mail.MailPriority.Normal;

				//نحوه پیام دادن سیستم در مورد ایمیل ارسالی را مشخص میکنیم
                //پنج حالت دارد که اگر ترکیب حالات مد نظر باشد باید دستو ذیل به تعداد نوشته و با هم اور شوند 
                oMailMessage.DeliveryNotificationOptions =
                    System.Net.Mail.DeliveryNotificationOptions.Never;

			
				//با استفاده از تبدیل مسیر نسبی به فیزیکی 
				//پیوستی برای ایمیل در نظر میگیریم

                //مسیر فیزیکی نسبت به روت
				string strRootRelativePathName = "~/Attachments/Attachment.png";

                //تبدیل مسیر نسبی به فیزیکی
				string strPathName =
					Server.MapPath(strRootRelativePathName);

				if (System.IO.File.Exists(strPathName))
				{
					System.Net.Mail.Attachment oAttachment =
						new System.Net.Mail.Attachment(strPathName);

					oMailMessage.Attachments.Add(oAttachment);
				}
			    
                //در محیط میل سرور های عمومی وقتی ایمیل ارسال میشود پروتکل اچ تی تی پی است
                //اما در محیط خارجی
				//اس ام تی پی برای ارسال و پاپ تری برای دریافت ایمیل است

				//یک شی از اس ام تی پی ایجاد میکنیم
				System.Net.Mail.SmtpClient oSmtpClient =
					new System.Net.Mail.SmtpClient();

				//تایم اوت پیش فرض یعنی صد ثانیه را برای ارسال ایمیل در نظر میگیریم
                //زمان برقراری ارتباط است اگر بیشتر شود پیغام خطا داده میشود
				oSmtpClient.Timeout = 100000;

				//امضا الکترونیکی ایمیل را مشخص میکنیم
                //سکیوت ساکت لایر -انتقال امن دیتا در جی میل که اولین ارائه کننده این سرویس است رایگان است
                //اگر جی میل در نظر میگیرید حتما این گزینه را تورو قرار دهید
				oSmtpClient.EnableSsl = false;

				//شی میل مسیج را به متد سند شی اس ام تی پی میدیم
				oSmtpClient.Send(oMailMessage);
			
				string strInformationMessage =
					".رایانامه شما با موفقيت، به مسوولين پايگاه ارسال گرديد";
                divPageMessages.Visible = true;
                litPageMessages.Text = strInformationMessage;
				
			}
			catch (System.Exception ex)
			{
				DisplayErrorMessage(ex.Message);
			}
		}
	}

    //متد نمایش خطا
    //میتوانیم به جای این متد از دیو پیج مسیج استفاده کنیم
	protected virtual void DisplayErrorMessage(string message)
	{
		divPageMessages.Visible = true;

		litPageMessages.Text =
			string.Format("<div class='error'>{0}</div>", message);
	}

	
}