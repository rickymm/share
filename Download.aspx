using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
public partial class Download : System.Web.UI.Page
{
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        string senha = txtSenha.Text;
                
        string[] arquivos =  Directory.GetFiles(Server.MapPath("~/Files/"));

        foreach (string s in arquivos)
        {
            string nomeArquivo = s.Substring(Server.MapPath("~/Files/").Length+txtSenha.Text.Length);
            if (txtSenha.Text.Equals(s.Substring(Server.MapPath("~/Files/").Length, txtSenha.Text.Length)))
            {
                Response.ContentType = "APPLICATION/OCTET-STREAM";
                String Header = "Attachment; Filename=" + nomeArquivo;
                Response.AppendHeader("Content-Disposition", Header);
                System.IO.FileInfo Dfile = new System.IO.FileInfo(s);
                Response.WriteFile(Dfile.FullName);
                Response.End();
            }
            else { 
          

            }

        }
    }
}
