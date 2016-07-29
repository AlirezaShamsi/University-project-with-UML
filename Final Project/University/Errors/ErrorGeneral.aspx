
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorGeneral.aspx.cs" Inherits="Errors_ErrorGeneral" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <h3>
        Unexpected Error!
        <br />
        <asp:HyperLink ID="lnkTryAgain" runat="server"  Text="Try Again . . ." />

    </h3>
    </div>
    </form>
</body>
</html>
