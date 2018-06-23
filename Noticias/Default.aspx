<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Noticias.Default" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Noticias</title>

    <!-- Bootstrap core CSS -->
      <!--link href="bootstrap-4.1.1/dist/css/bootstrap.min.css" rel="stylesheet"-->
    <link href="assets/bootstrap-4.1.1-dist/css/bootstrap.min.css" rel="stylesheet" />
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css" rel="stylesheet">
      <link href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css" rel="stylesheet">
      
    <!-- Custom styles for this template -->
  </head>

  <body class="bg-light">
          

    <div class="container">
 
        <form id="form" runat="server">
        <asp:ScriptManager ID="ScriptManager1"  runat="server"></asp:ScriptManager>
                       
        <div class="row">
                <div class="jumbotron">
                        <div class="col">
                    <h2>Busquedas</h2>
                </div>
                                    
                <div class="col">
                    <asp:LinkButton ID="BtnNuevaAlerta" OnClick="BtnNuevaAlerta_Click" runat="server" CssClass="btn btn-sm btn-primary">Nueva noticia<span ></span></asp:LinkButton>
                </div>
                    <br />
                 <%--   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>--%>
                               <asp:GridView ID="grvAlertas" runat="server" ClientIDMode="Static" BorderColor="Transparent"
                                   CssClass="table"
                             AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField Visible="false">
                            <HeaderTemplate>
                                <asp:CheckBox ID="checkAll" runat="server" onclick = "checkAll(this);"/>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSeleccionar" runat="server" />
                            </ItemTemplate>
                            <ItemStyle Width="55px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("ID") %>' Visible="true"></asp:Label>
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
                        <asp:TemplateField HeaderText="Region">
                            <ItemTemplate>
                                <asp:Label ID="lblRegion" runat="server" Text='<%# Bind("Region") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderStyle-Width="7%" HeaderText="Feed">
                            <ItemTemplate>
                                
                                        <asp:LinkButton ID="btnIrFeed" OnClick="btnIrFeed_Click" runat="server" CssClass="btn btn-xs btn-success">Ver <span class="glyphicon glyphicon-arrow-right"></span></asp:LinkButton>
                               
                                        
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
<%-- </ContentTemplate>
                        </asp:UpdatePanel>--%>
                </div>
            

        </div>

  
        
        </form>


      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017-2018 Company Name</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
    </div>



      <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="bootstrap-4.1.1/assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    
     <script src="bootstrap-4.1.1/assets/js/vendor/popper.min.js"></script>

      <!-- script src="bootstrap-4.1.1/dist/js/bootstrap.min.js"></script -->
        <script src="assets/bootstrap-4.1.1-dist/js/bootstrap.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
      <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
      <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>

    <script src="bootstrap-4.1.1/assets/js/vendor/holder.min.js"></script>

       <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
      
      <script type="text/javascript">
          
        $(document).ready(function () {
            cargar();
        });

        

        function cargar() {
            
            
        }

          $(function () {
            //agregar jquery de las funciones...
            $('[id*=grvAlertas]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                "responsive": true,
                "sPaginationType": "full_numbers",
                "processing": true,
                "bStateSave": true ,
                "language": {
                    "sProcessing": "Procesando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "No se encontraron resultados",
                    "sEmptyTable": "Ningún dato disponible en esta tabla",
                    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "sInfoThousands": ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast": "Último",
                        "sNext": "Siguiente",
                        "sPrevious": "Anterior"
                    }
                }
            });
          });

          var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            var grilla = $('[id*=grvAlertas]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                "responsive": true,
                "sPaginationType": "full_numbers",
                "processing": true,
                "language": {
                    "sProcessing": "Procesando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "No se encontraron resultados",
                    "sEmptyTable": "Ningún dato disponible en esta tabla",
                    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "sInfoThousands": ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast": "Último",
                        "sNext": "Siguiente",
                        "sPrevious": "Anterior"
                    }
                }
            });

            grilla.bStateSave = true;
            
          });

        
          
      </script>

  </body>
</html>
