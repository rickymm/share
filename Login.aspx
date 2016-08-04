using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;
using System.DirectoryServices.Protocols;
using System.Net;
public partial class Login : System.Web.UI.Page
{
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DirectoryEntry directoryEntry = new DirectoryEntry("LDAP://citeluz.com.br", txtLogin.Text, txtSenha.Text);
        object nativeObject = directoryEntry.NativeObject;
    }
}
