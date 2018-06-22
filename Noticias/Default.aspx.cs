using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewsAPI;
using NewsAPI.Models;
using NewsAPI.Constants;



namespace Noticias
{
    public partial class Default : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //ConsolaPruebaAPI.Program execMain = new Program();
                //execMain.Main(string args);
                


                var newsApiClient = new NewsApiClient("a55ecdd5ddd34f279b3b9e1ffd1eefa9");
            
                var articlesResponse = newsApiClient.GetEverything(new EverythingRequest
                {
                    Q = "La casa de papel",
                    SortBy = SortBys.Popularity,
                    Language = Languages.ES,
                    From = new DateTime(2018, 6, 13),
                    PageSize = 1
                });
                if (articlesResponse.Status == Statuses.Ok)
                {
                    // total results found
                    Label1.Text = articlesResponse.TotalResults.ToString();
                    // here's the first 20
                    foreach (var article in articlesResponse.Articles)
                    {
                        // title
                        Label1.Text = article.Title;
                        //Label1.Text = article.Author;
                        //Label1.Text = article.Description;
                        //Label1.Text = article.Url;
                        //Label1.Text = article.UrlToImage;
                        //Label1.Text = article.PublishedAt.ToString();
                        
                    }
                }
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;

            }
        }
    }
}