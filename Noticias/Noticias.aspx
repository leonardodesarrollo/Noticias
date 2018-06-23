<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Noticias.aspx.cs" Inherits="Noticias.Noticias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
        <form id="form1" runat="server">
            <div class="row">
                <div class="jumbotron">

                    <h2>Noticias</h2>

                    <asp:GridView ID="grvNoticias" runat="server" ClientIDMode="Static" BorderColor="Transparent"
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
                        <asp:TemplateField HeaderText="Titulo">
                            <ItemTemplate>
                                <asp:Label ID="lblTitulo" runat="server" Text='<%# Bind("TITULO") %>' Visible="true"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripcion">
                            <ItemTemplate>
                                <asp:Label ID="lblDescripcion" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        
                        <asp:TemplateField HeaderStyle-Width="7%" HeaderText="URL">
                            <ItemTemplate>
                                <asp:Label ID="lblUrl" runat="server" Text='<%# Bind("URL") %>' Visible="false"></asp:Label>
                                        <asp:LinkButton ID="btnIrUrl" OnClick="btnIrUrl_Click" runat="server" CssClass="btn btn-xs btn-success">Ir <span class="glyphicon glyphicon-arrow-right"></span></asp:LinkButton>
                               
                                        
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
