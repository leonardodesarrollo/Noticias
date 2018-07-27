<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="NewAlert.aspx.cs" Inherits="NoticiasMaster.NewAlert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Nueva Alerta
          </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#"><i class="fa fa-dashboard"></i>Alertas</a></li>
            <li class="active">Nueva Alerta</li>
        </ol>
    </section>
    <!--  -->
    <section class="content">

        <!-- Alertas -->
        <div id="divAlerta" runat="server" visible="false" class="alert alert-danger alerta">
            <strong>Atención!: </strong>
            <asp:Label Text="" ID="lblInfo" runat="server" />
        </div>

        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Quick Example</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->

            <div class="box-body">
                <div class="form-group">
                    <label for="txtQuery">Query</label>
                    <asp:TextBox ID="txtQuery" runat="server" CssClass="form-control" placeholder="Enter Query"></asp:TextBox>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-lg-6">
                        <div class="form-group">
                            <label for="ddlRegion">Region</label>
                            <asp:DropDownList ID="ddlRegion" runat="server" OnDataBound="ddlRegion_DataBound" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-lg-6">
                        <div class="form-group">
                            <label for="ddlLenguaje">Lenguaje</label>
                            <asp:DropDownList ID="ddlLenguaje" runat="server" OnDataBound="ddlLenguaje_DataBound" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputFile">File input</label>
                    <input type="file" id="exampleInputFile">
                    <p class="help-block">Example block-level help text here.</p>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox">
                        Check me out
                     
                    </label>
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>

        </div>
        <!-- /.box -->


        <%--        <div id="divNuevaAlerta" runat="server" >
            <div class="row">
                <div class="col-xs-12 col-lg-12">
                    <label for="txtQuery">Query</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtQuery" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-lg-3">
                    <label for="txtQuery">Region</label>
                    <div class="input-group">
                        <asp:DropDownList ID="ddlRegion" runat="server" OnDataBound="ddlRegion_DataBound" CssClass="form-control input-sm">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-xs-12 col-lg-3">
                    <label for="ddlLenguaje">Lenguaje</label>
                    <div class="input-group">
                        <asp:DropDownList ID="ddlLenguaje" runat="server" OnDataBound="ddlLenguaje_DataBound" CssClass="form-control input-sm">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-xs-12 col-lg-3">
                    <label for="ddlHowMany">Cantidad</label>
                    <div class="input-group">
                        <asp:DropDownList ID="ddlCantidad" runat="server" OnDataBound="ddlCantidad_DataBound" CssClass="form-control input-sm">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-xs-12 col-lg-3">
                    <label for="ddlHowMany">Enviar una alerta al correo electronico cada vez que se produsca?</label>
                    <div class="input-group">
                        <asp:CheckBox ID="chkEnviaAlerta" runat="server" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <asp:Button ID="btnGrabar" ClientIDMode="Static" runat="server" CssClass="btn btn-sm btn-block btn-primary"
                        Text="Buscar" OnClick="btnGrabar_Click" />
                </div>
            </div>
        </div>--%>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
