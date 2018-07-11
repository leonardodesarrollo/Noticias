using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NewsAPI;
using NewsAPI.Models;
using NewsAPI.Constants;
using System.Configuration;
using System.Data.SqlClient;

namespace ConsolaPruebaAPI
{
    class Program
    {
        public static void Main(string[] args)
        {
            
            string usuarioSQL = ConfigurationSettings.AppSettings["usuarioSQL"];
            string servidorSQL = ConfigurationSettings.AppSettings["servidorSQL"];
            string passwordSQL = ConfigurationSettings.AppSettings["passwordSQL"];
            string bd = ConfigurationSettings.AppSettings["bdSQL"];

            string cnnStr = "Data Source=" + servidorSQL + ";Initial Catalog=" + bd + ";User ID=" + usuarioSQL + ";Password=" + passwordSQL + "";

            SqlConnection cnn = new SqlConnection(cnnStr);
            cnn.Open();
            // init with your API key
            var newsApiClient = new NewsApiClient("a55ecdd5ddd34f279b3b9e1ffd1eefa9");
            var articlesResponse = newsApiClient.GetEverything(new EverythingRequest
            {
                Q = "La casa de papel",
                SortBy = SortBys.Popularity,
                Language = Languages.ES,
                From = new DateTime(2018, 6, 13),
                PageSize=100
            });

            //var articulos = newsApiClient.GetTopHeadlines(new EverythingRequest {Page="www"}) 

            string queryDelete = "delete from noticias";
            SqlCommand command2 = new SqlCommand(queryDelete, cnn);
            command2.ExecuteNonQuery();
            
            if (articlesResponse.Status == Statuses.Ok)
            {
                // total results found
                Console.WriteLine(articlesResponse.TotalResults);
                // here's the first 20
                foreach (var article in articlesResponse.Articles)
                {
                    // title
                    Console.WriteLine(article.Title);
                    // author
                    Console.WriteLine(article.Author);
                    // description
                    Console.WriteLine(article.Description);
                    // url
                    Console.WriteLine(article.Url);
                    // image
                    Console.WriteLine(article.UrlToImage);
                    // published at
                    Console.WriteLine(article.PublishedAt);
                    Console.WriteLine(article.Source.Id);
                    Console.WriteLine(article.Source.Name);
                    
                    string queryControl = "insert into NOTICIAS(TITULO,AUTOR,DESCRIPCION,URL,URLTOIMAGE,PUBLICADO,FUENTE_ID,FUENTE_NOMBRE) values('" + article.Title.Replace("'","") +")','" + article.Author + "','" + article.Description + "','" + article.Url + "','" + article.UrlToImage + "','" + article.PublishedAt + "','" + article.Source.Id + "','" + article.Source.Name+ "')";
                    SqlCommand command = new SqlCommand(queryControl, cnn);
                    command.ExecuteNonQuery();
                }   
            }
            cnn.Close();
            Console.ReadLine();
        }
    }
}
