<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="NoticiasMaster.WebForm1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<script src="Scripts/jquery-1.5.2.min.js" type="text/javascript"></script>--%>
    <script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="JQ/jquery-ui.css">
    <style type="text/css">
        body {
            font: normal normal normal 10px/1.5 Arial, Helvetica, sans-serif;
        }

        .ui-dialog-osx {
            -moz-border-radius: 0 0 8px 8px;
            -webkit-border-radius: 0 0 8px 8px;
            border-radius: 0 0 8px 8px;
            border-width: 0 8px 8px 8px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            var Button1 = $("#Button1");
            var Button2 = $("#Button2");
            var Panel1 = $("#Panel1");
            var dil = $("#dialog");
            Button1.click(function (e) {
                //Panel1.slideDown();
                alert("in");
                //dil.css("visibility", "visible");
                dil.show();
                e.preventDefault();
                $("#dialog").dialog({
                    modal: true,
                    draggable: false,
                    resizable: false,
                    position: ['right', 'bottom'],
                    show: 'blind',
                    hide: 'blind',
                    width: 500,
                    dialogClass: 'ui-dialog-osx'
                    //overflow: auto
                    //buttons: [{
                    //    text: "I've read and understand this", click: function (event, ui) {
                    //        $(this).dialog().dialog("close");
                    //    }
                    //}]
                })
            });

            Button2.click(function (e) {
                Panel1.slideUp();
                e.preventDefault();
            });

        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Show Panel" />
            <asp:Button ID="Button2" runat="server" Text="Hide Panel" />
            <asp:Button ID="Button3" runat="server" Text="btnHTML" OnClick="Button3_Click" />
            <br />
            <br />

            <asp:Panel runat="server" ID="Panel1" Height="185px" Width="320px" Style="display: none;"
                BackColor="#FFFF99" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px">
                Hello World!
            </asp:Panel>
        </div>
        <div id="dialog" runat="server" style="display:none" title="Important information">            
        </div> 
        
     
</object>
    </form>
</body>
</html>
