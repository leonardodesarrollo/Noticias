using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NoticiasMaster
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            WebClient objWebClient = new WebClient();
            Stream objStream = objWebClient.OpenRead("http://youtube.com");
            StreamReader objStreamReader = new StreamReader(objStream);
            string strOutput = objStreamReader.ReadToEnd();
            objStream.Close();
            objStreamReader.Close();
            StreamWriter sw = new StreamWriter(Server.MapPath("html.txt"));
            strOutput = Regex.Replace(strOutput, "<input type=\"hidden\" name=\"__VIEWSTATE\" id=\"__VIEWSTATE\" value=\".*?\" />", "", RegexOptions.IgnoreCase);
            sw.Write(strOutput);
            sw.Close();
            dialog.InnerHtml = strOutput;
        }
    }
}