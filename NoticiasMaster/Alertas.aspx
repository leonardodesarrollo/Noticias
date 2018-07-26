<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Alertas.aspx.cs" Inherits="NoticiasMaster.Alertas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Alertas
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Alertas</li>
          </ol>
        </section>
        <!--  -->
    <section class="content">

        <!-- Alertas -->
        <div id="divAlerta" runat="server" visible="false" class="alert alert-danger alerta">
            <strong>Atención!: </strong>
            <asp:Label Text="" ID="lblInfo" runat="server" />
        </div>

        <div class="panel panel-primary" id="divSearch" runat="server">
            <div class="panel-heading">
                <asp:LinkButton ID="btnNew" OnClick="btnNew_Click" runat="server" CssClass="btn btn-xs btn-success"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
            </div>
            <div class="panel-body">

                <div id="divNuevaAlerta" runat="server" visible="false">

                </div>


                  <asp:GridView ID="grvAlertas" runat="server" ClientIDMode="Static" CssClass="table table-responsive table-condensed table-bordered table-striped small"
                            HeaderStyle-CssClass="active" PagerStyle-CssClass="active" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" >
                    <Columns>
                      
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("ID") %>' Visible="true"></asp:Label>
                                <asp:Label ID="lblIdAlerta" runat="server" Text='<%# Bind("ID_ALERTA") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Query">
                            <ItemTemplate>
                                <asp:Label ID="lblQuery" runat="server" Text='<%# Bind("query") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Lenguaje">
                            <ItemTemplate>
                                <asp:Label ID="lblLenguaje" runat="server" Text='<%# Bind("language") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Región">
                            <ItemTemplate>
                                <asp:Label ID="lblRegion" runat="server" Text='<%# Bind("Region") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Ult Actualización">
                            <ItemTemplate>
                                <asp:Label ID="lblUltActualizacion" runat="server" Text='<%# Bind("UltActualizacion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ult Agregada">
                            <ItemTemplate>
                                <asp:Label ID="lblFechaUltimaAgregada" runat="server" Text='<%# Bind("FechaUltimaAgregada") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        

                        <asp:TemplateField HeaderText="Q Noticias No Relevantes">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnIrFeed" OnClick="btnIrFeed_Click" Width="100%" runat="server" CssClass="btn btn-xs btn-warning"><asp:Label ID="lblCantidadNoticias" runat="server" Text='<%# Bind("CantidadNoticias") %>'></asp:Label> <span class="glyphicon glyphicon-link"></span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Q Noticias Relevantes">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnIrFeedRelevantes" OnClick="btnIrFeedRelevantes_Click" Width="100%" runat="server" CssClass="btn btn-xs btn-success"><asp:Label ID="lblCantidadNoticiasRelevantes" runat="server" Text='<%# Bind("CantidadNoticiasRelevantes") %>'></asp:Label> <span class="glyphicon glyphicon-link"></span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </section>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

          <!-- DataTables -->
    <script src="assets/template/AdminLTE-2.3.0/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="assets/template/AdminLTE-2.3.0/plugins/datatables/dataTables.bootstrap.min.js"></script>

<script>
$(document).ready( function () {
    jQuery('#grvAlertas').DataTable({

    "language": {
           "sProcessing":     "Procesando...",
    "sLengthMenu":     "Mostrar _MENU_ registros",
    "sZeroRecords":    "No se encontraron resultados",
    "sEmptyTable":     "Ningún dato disponible en esta tabla",
    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
    "sInfoPostFix":    "",
    "sSearch":         "Buscar:",
    "sUrl":            "",
    "sInfoThousands":  ",",
    "sLoadingRecords": "Cargando...",
    "oPaginate": {
        "sFirst":    "Primero",
        "sLast":     "Último",
        "sNext":     "Siguiente",
        "sPrevious": "Anterior"
    }
        },
        "iDisplayLength": 25,
            "responsive": true
        /**,
        dom: 'Bfrtip',
        buttons: [
            'copyHtml5',
            'csvHtml5',
            'pdfHtml5'
        ] **/

    });
} );

</script>

</asp:Content>
