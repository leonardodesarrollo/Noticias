using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace NoticiasMaster
{
    public partial class Alertas : System.Web.UI.Page
    {
        Datos dal = new Datos();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblInfo.Text = "";
                divAlerta.Visible = false;

                if (!this.Page.IsPostBack)
                {
                    BuscarAlertas();
                }
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        void BuscarAlertas()
        {
            grvAlertas.DataSource = dal.getBuscarAlerta().Tables[0];
            grvAlertas.DataBind();
            grvAlertas.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnIrFeed_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label _lblId = (Label)grvAlertas.Rows[row.RowIndex].FindControl("lblId");
                Label _lblIdAlerta = (Label)grvAlertas.Rows[row.RowIndex].FindControl("lblIdAlerta");
                
                Response.Redirect("Noticias.aspx?id=" + _lblIdAlerta.Text);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void btnIrFeedRelevantes_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label _lblId = (Label)grvAlertas.Rows[row.RowIndex].FindControl("lblId");
                Label _lblIdAlerta = (Label)grvAlertas.Rows[row.RowIndex].FindControl("lblIdAlerta");

                Response.Redirect("NoticiasRelevantes.aspx?id=" + _lblIdAlerta.Text);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }
    }
}