using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using ENT;

namespace NoticiasMaster
{
    public partial class Noticias : System.Web.UI.Page
    {
        Datos dal = new Datos();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                //scriptManager.RegisterPostBackControl(this.lbtnIrURLFrame);

                if (!Page.IsPostBack)
                {
   
                    string _idAlarma = Convert.ToString(Request.QueryString["id"]);
                    FillDrop();
                    hfAlerta.Value = _idAlarma;
                    Buscar(_idAlarma);
                }
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        void FillDrop()
        {
            Estado es = new Estado();
            es.Activo = 1;
            ddlEstado.DataSource = dal.getBuscarEstado(es);
            ddlEstado.DataValueField = "IdEstado";
            ddlEstado.DataTextField = "NombreEstado";
            ddlEstado.DataBind();

            Usuario user = new Usuario();
            ddlUsuarioAsignado.DataSource = dal.getBuscarUsuario(user).Tables[0];
            ddlUsuarioAsignado.DataValueField = "IdUsuario";
            ddlUsuarioAsignado.DataTextField = "Login";
            ddlUsuarioAsignado.DataBind();

        }

        void Buscar(string idAlerta)
        {
            NOTICIAS noti = new NOTICIAS();
            DataTable dt = new DataTable();
            noti.ID_ALERT = idAlerta;
            noti.IdEstado = Convert.ToInt32(ddlEstado.SelectedValue);
            noti.IdUsuarioAsignado = Convert.ToInt32(ddlUsuarioAsignado.SelectedValue);
            noti.Relevante = Convert.ToInt32(ddlRelevante.SelectedValue);

            dt = dal.getBuscarNoticias(noti, txtFechaDesde.Text.Trim(), txtFechaHasta.Text.Trim()).Tables[0];
            Session["sessionDtNoticias"] = dt;
            grvNoticias.DataSource = dt;
            grvNoticias.DataBind();

            divGrilla.Visible = true;
            //dt = dal.getBuscarNoticias()
        }

        protected void lbtnID_Click(object sender, EventArgs e)
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


        protected void paginacion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label _lblEstado = (Label)e.Row.FindControl("lblEstado");
                Label _lblIdEstado = (Label)e.Row.FindControl("lblIdEstado");
                Label _lblRelevante = (Label)e.Row.FindControl("lblRelevante");

                

                if (_lblIdEstado.Text == "1")
                {
                    _lblEstado.CssClass = "text text-uppercase label label-warning";
                }
                else if (_lblIdEstado.Text == "2")
                {
                    _lblEstado.CssClass = "text text-uppercase label label-success";
                }

                if (_lblRelevante.Text=="0")
                {
                    _lblRelevante.CssClass = "label label-danger";
                    _lblRelevante.Text = "No";
                }
                else
                {
                    _lblRelevante.CssClass = "label label-success";
                    _lblRelevante.Text = "Si";
                }

                //    if (string.IsNullOrEmpty(_lblArchivo.Text) == true)
                //    {
                //        _btnArchivo.Visible = false;
                //    }
                //    else
                //    {
                //        _btnArchivo.Visible = true;
                //    }

                //    if (string.IsNullOrEmpty(_lblArchivo2.Text) == true)
                //    {
                //        _btnArchivo2.Visible = false;
                //    }
                //    else
                //    {
                //        _btnArchivo2.Visible = true;
                //    }
            }

            if (e.Row.RowType == DataControlRowType.Pager)
            {
                Label _lblPagina = (Label)e.Row.FindControl("lblPagina");
                Label _lblTotal = (Label)e.Row.FindControl("lblTotal");
                Label _lblTotalRegistros = (Label)e.Row.FindControl("lblTotalRegistros");
                _lblPagina.Text = Convert.ToString(grvNoticias.PageIndex + 1);
                _lblTotal.Text = Convert.ToString(grvNoticias.PageCount);

                DataTable dt = new DataTable();
                dt = Session["sessionDtNoticias"] as DataTable;
                _lblTotalRegistros.Text = dt.Rows.Count.ToString();
            }
        }



        protected void imgFirst_Click(object sender, EventArgs e)
        {
            //buscar();
            if (Session["sessionDtNoticias"] != null)
            {
                grvNoticias.DataSource = Session["sessionDtNoticias"];
                grvNoticias.DataBind();
            }
            else
            {
                //buscar();
            }
            grvNoticias.PageIndex = 0;
            grvNoticias.DataBind();
        }

        protected void imgPrev_Click(object sender, EventArgs e)
        {
            //buscar();
            if (Session["sessionDtNoticias"] != null)
            {
                grvNoticias.DataSource = Session["sessionDtNoticias"];
                grvNoticias.DataBind();
            }
            else
            {
                //buscar();
            }
            if (grvNoticias.PageIndex != 0)
                grvNoticias.PageIndex--;
            grvNoticias.DataBind();
        }

        protected void imgNext_Click(object sender, EventArgs e)
        {
            //buscar();
            if (Session["sessionDtNoticias"] != null)
            {
                grvNoticias.DataSource = Session["sessionDtNoticias"];
                grvNoticias.DataBind();
            }
            else
            {
                //buscar();
            }

            if (grvNoticias.PageIndex != (grvNoticias.PageCount - 1))
                grvNoticias.PageIndex++;
            grvNoticias.DataBind();
        }

        protected void imgLast_Click(object sender, EventArgs e)
        {
            //buscar();
            if (Session["sessionDtNoticias"] != null)
            {
                grvNoticias.DataSource = Session["sessionDtNoticias"];
                grvNoticias.DataBind();
            }
            else
            {
                //buscar();
            }

            grvNoticias.PageIndex = grvNoticias.PageCount - 1;
            grvNoticias.DataBind();
        }

        protected void btnBuscarNoticia_Click(object sender, EventArgs e)
        {
            try
            {
                Buscar(null);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void ddlEstado_DataBound(object sender, EventArgs e)
        {

            ddlEstado.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        protected void ddlUsuarioAsignado2_DataBound(object sender, EventArgs e)
        {

            ddlUsuarioAsignado.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        protected void lbtnIrUrl_Click(object sender, EventArgs e)
        {
            try
            {

                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label _lblUrl = (Label)grvNoticias.Rows[row.RowIndex].FindControl("lblUrl");
                frameWeb.Src = _lblUrl.Text;

                lbtnIrURLFrame.Text = _lblUrl.Text;

                ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "show", "$(function () { $('#" + Panel1.ClientID + "').modal('show'); });", true);
                UpdatePanel2.Update();

                //ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "window.open('" + _lblUrl.Text + "','_blank');", true);
                //Response.Redirect(_lblUrl.Text);

            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnIngresaRelevantes_Click(object sender, EventArgs e)
        {
            try
            {
                NOTICIAS not = new NOTICIAS();
                foreach (GridViewRow grd_Row in grvNoticias.Rows)
                {
                    Label _lblIdNoticia = (Label)grvNoticias.Rows[grd_Row.RowIndex].FindControl("lblIdNoticia");
                    CheckBox chk = (CheckBox)grvNoticias.Rows[grd_Row.RowIndex].FindControl("chkSeleccionar");
                    if (chk.Checked == true)
                    {
                        not.ID_NOTICIA = _lblIdNoticia.Text;
                        //ingreso la noticia relevante con cambio de estado dentro del query
                        dal.setInNoticiaRelevante(not);
                    }
                }
                string idAlerta = hfAlerta.Value;
                if (string.IsNullOrEmpty(idAlerta))
                {
                    Buscar(null);
                }
                else
                {
                    Buscar(idAlerta);
                }
                
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnIrURLFrame_Click(object sender, EventArgs e)
        {
            try
            {
                string url = lbtnIrURLFrame.Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "window.open('" + url + "','_blank');", true);
                //Response.Redirect(_lblUrl.Text);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }
    }
}