using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;




namespace Noticias
{
    public partial class Default : System.Web.UI.Page
    {

        Datos dal = new Datos();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    BuscarAlertas();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        void BuscarAlertas()
        {
            grvAlertas.DataSource = dal.getBuscarAlerta().Tables[0];
            grvAlertas.DataBind();
        }

        protected void btnIrFeed_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label _lblId = (Label)grvAlertas.Rows[row.RowIndex].FindControl("lblId");
                
                Response.Redirect("Noticias.aspx?id="+_lblId.Text);
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void BtnNuevaAlerta_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}