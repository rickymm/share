using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Net.Mail;


public partial class Upload : System.Web.UI.Page
{
    protected void btnCarregar_Click(object sender, EventArgs e)
    {

        string nome = this.fupUpload.FileName + DateTime.Now.Date.ToString() + DateTime.Now.Hour.ToString();
        //FileInfo fi = new FileInfo(fupUpload.FileContent);

        // if (fi.Length > 0)


        HashAlgorithm algorithm = MD5.Create();
        byte[] array = algorithm.ComputeHash(Encoding.UTF8.GetBytes(nome));

        StringBuilder sb = new StringBuilder();
        foreach (byte b in array)
        {
            sb.Append(b.ToString("X2"));
        }

        //Salva em Files: hash + nome do arquivo
        this.fupUpload.SaveAs(Server.MapPath("~/Files/") + sb.ToString() + this.fupUpload.FileName);

        Email(); //Envio do email


    }


    public void Email()
    {
        MailMessage m = new MailMessage();
        SmtpClient sc = new SmtpClient();

        m.From = new MailAddress("rickymoino@citelum.com.br");  //Quem envia o email              
        m.To.Add("rickymafra@gmail.com"); //Para quem envia o email 
        m.Subject = "Test Subject"; //Assunto do email
        m.IsBodyHtml = true;
        m.Body = "test body"; //Corpo do email
        sc.Host = "smtp.office365.com"; //Autenticacao com o Office365
        sc.Port = 587;
        sc.Credentials = new System.Net.NetworkCredential("rickymoino@citelum.com.br", "SENHA"); //Colocar a senha

        sc.EnableSsl = true;
        sc.Send(m);
    }

}
