<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Noticias.aspx.cs" Inherits="NoticiasMaster.Noticias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Noticias
          </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>

            <li class="active">Noticias</li>
        </ol>
    </section>
    <!--  -->




    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <section class="content">

                <!-- Alertas -->
                <div id="divAlerta" runat="server" visible="false" class="alert alert-danger alerta">
                    <strong>Atención!: </strong>
                    <asp:Label Text="" ID="lblInfo" runat="server" />
                </div>


                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <strong>Busqueda de Noticias</strong>
                    </div>
                    <div class="panel-body">
                        <div class="row active">
                            <div class="col-xs-12 col-lg-2">
                                <label for="ddlEstado">Fecha Inicio</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtFechaDesde" runat="server" ClientIDMode="Static" CssClass="form-control input-sm class-date"></asp:TextBox>
                                    <asp:Calendar ID="calFechaDesde" runat="server" Visible="false"></asp:Calendar>
                                    <span class="input-group-btn">
                                        <button class="btn btn-secondary btn-sm" type="button"><span class="glyphicon glyphicon-calendar"></span></button>
                                    </span>
                                </div>
                            </div>
                            <div class="col-xs-12 col-lg-2">
                                <label for="ddlEstado">Fecha Hasta</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtFechaHasta" ClientIDMode="Static" runat="server" CssClass="form-control input-sm class-date"></asp:TextBox>
                                    <asp:Calendar ID="calFechaHasta" runat="server" Visible="false"></asp:Calendar>
                                    <span class="input-group-btn">
                                        <button class="btn btn-secondary btn-sm" type="button"><span class="glyphicon glyphicon-calendar"></span></button>
                                    </span>
                                </div>
                            </div>
                            <div class="col-xs-12 col-lg-2">
                                <label for="ddlUsuarioAsig">Usuario Asignado</label>
                                <asp:DropDownList ID="ddlUsuarioAsignado" runat="server" OnDataBound="ddlUsuarioAsignado2_DataBound" CssClass="form-control input-sm">
                                </asp:DropDownList>
                            </div>
                            <div class="col-xs-12 col-lg-2">
                                <label for="ddlUsuarioAsig">Relevante</label>
                                <asp:DropDownList ID="ddlRelevante" runat="server" CssClass="form-control input-sm">
                                    <asp:ListItem Text="Todos" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-xs-12 col-lg-2">
                                <label for="ddlEstado">Estado</label>
                                <asp:DropDownList ID="ddlEstado" runat="server" OnDataBound="ddlEstado_DataBound" CssClass="form-control input-sm">
                                </asp:DropDownList>
                            </div>
                            <div class="col-xs-12 col-lg-2">
                                <label for="btnBuscarNoticia"></label>
                                <asp:Button ID="btnBuscarNoticia" ClientIDMode="Static" runat="server" CssClass="btn btn-sm btn-block btn-primary"
                                    Text="Buscar" OnClick="btnBuscarNoticia_Click" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div runat="server" id="divGrilla"  visible="false" style="width: 100%;  overflow-y: scroll;">
                                    <asp:GridView ID="grvNoticias" runat="server" CssClass="table table-responsive table-condensed table-bordered table-striped small" BorderWidth="0" BorderColor="Transparent" HeaderStyle-CssClass="active" 
                                        AutoGenerateColumns="false" OnRowDataBound="paginacion_RowDataBound" 
                                        EmptyDataText="Noticia no encontrada" EmptyDataRowStyle-CssClass="active h4" 
                                        PageSize="50" AllowPaging="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIdAlerta" runat="server" Visible="false" Text='<%# Bind("ID_Alert") %>'></asp:Label>
                                                    <asp:Label ID="lblIdNoticia" runat="server" Visible="true" Text='<%# Bind("ID_NOTICIA") %>'></asp:Label>
                                                    <asp:LinkButton ID="lbtnID" runat="server" Text='<%# Bind("Id") %>' OnClick="lbtnID_Click" Visible="false"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Query">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblQuery" runat="server" Text='<%# Bind("query") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Titulo">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTitulo" runat="server" Visible="true" Text='<%# Bind("Titulo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripcion" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDescripcion" runat="server" Visible="true" Text='<%# Bind("Descripcion") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Url">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUrl" runat="server" Text='<%# Bind("Url") %>' Visible="false"></asp:Label>
                                                    <asp:LinkButton ID="lbtnIrUrl" CssClass="btn btn-danger btn-xs" runat="server"
                                                    OnClick="lbtnIrUrl_Click"><i aria-hidden="true" class="glyphicon glyphicon-cloud"></i> </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="F.Publicacion">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFechaPublicacion" runat="server" Text='<%# Bind("Publicado") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Estado">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIdEstado" runat="server" Text='<%# Bind("IdEstado") %>' Visible="false" ></asp:Label>
                                                    <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("NombreEstado") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Relevante">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRelevante" runat="server" Text='<%# Bind("Relevante") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="U.Asignado">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUsuarioAsignado" runat="server" Text='<%# Bind("UsuarioAsignado") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="U.Asignado Por">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUsuarioAsignadoPor" runat="server" Text='<%# Bind("UsuarioAsignadoPor") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="Obs">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibtnObservacion" runat="server" OnClick="ibtnObservacion_Click" ImageUrl="~/assets/img/page.png" ToolTip='<%# Bind("OBSERVACION") %>' />
                                        <asp:Label ID="lblObservacion" runat="server" Visible="false" Text='<%# Bind("OBSERVACION") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Obs Cli" Visible="false">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibtnObservacionCli" runat="server" OnClick="ibtnObservacionCli_Click" ImageUrl="~/assets/img/page.png" ToolTip='<%# Bind("OBSERVACION_CLIENTE") %>' />
                                        <asp:Label ID="lblObservacionCli" runat="server" Visible="false" Text='<%# Bind("OBSERVACION_CLIENTE") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Adjunto">
                                    <ItemTemplate>
                                        <asp:Label ID="lblArchivo" runat="server" Visible="false" Text='<%# Bind("RUTA_ARCHIVO") %>'></asp:Label>
                                        <asp:LinkButton ID="btnArchivo" runat="server" OnClick="btnArchivo_Click" Text="text"><i class="fa fa-files-o"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Adjunto 2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblArchivo2" runat="server" Visible="false" Text='<%# Bind("RUTA_ARCHIVO2") %>'></asp:Label>
                                        <asp:LinkButton ID="btnArchivo2" runat="server" OnClick="btnArchivo2_Click" Text="text"><i class="fa fa-files-o"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pdf">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnGenerarPdf" CssClass="btn btn-danger btn-xs" runat="server"
                                            OnClick="lbtnGenerarPdf_Click"><i aria-hidden="true" class=" fa fa-file-pdf-o"></i> </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                        </Columns>
                                        <PagerTemplate>
                                            <div>
                                                <div style="float: left">
                                                    <asp:ImageButton ID="imgFirst" runat="server"
                                                        ImageUrl="~/assets/img/grid/first.gif" OnClick="imgFirst_Click"
                                                        Style="height: 15px" title="Navegación: Ir a la Primera Pagina" Width="26px" />
                                                    <asp:ImageButton ID="imgPrev" runat="server"
                                                        ImageUrl="~/assets/img/grid/prev.gif" OnClick="imgPrev_Click"
                                                        title="Navegación: Ir a la Pagina Anterior" Width="26px" />
                                                    <asp:ImageButton ID="imgNext" runat="server"
                                                        ImageUrl="~/assets/img/grid/next.gif" OnClick="imgNext_Click"
                                                        title="Navegación: Ir a la Siguiente Pagina" Width="26px" />
                                                    <asp:ImageButton ID="imgLast" runat="server"
                                                        ImageUrl="~/assets/img/grid/last.gif" OnClick="imgLast_Click"
                                                        title="Navegación: Ir a la Ultima Pagina" Width="26px" />
                                                </div>
                                                <div style="float: left">
                                                    Registros por página: 50
                                                </div>
                                                <div style="float: right">
                                                    Total Registros: 
                                <asp:Label ID="lblTotalRegistros" runat="server"></asp:Label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;Página
                                <asp:Label ID="lblPagina" runat="server"></asp:Label>
                                                    de
                                <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </PagerTemplate>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>

                    
                    </div>
                    
                  

                </div>
            </section>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>