<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="_430_Midterm.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="display:grid;grid-template-columns: 1fr 1fr">
        <div>
            <h1>Inventory</h1>
            <asp:GridView ID="InvGV" runat="server"
                DataSourceID="ObjectDataSource1">
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
          SelectMethod ="PopulateInvGV" TypeName=" _430_Midterm.Class1"></asp:ObjectDataSource>
            </div>
        <div>
            <h1>Orders</h1>
          <asp:GridView ID="OrderGV" runat="server"
                DataSourceID="ObjectDataSource2">
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
          SelectMethod ="PopulateOrderGV" TypeName=" _430_Midterm.Class1"></asp:ObjectDataSource>
        </div>
        </div>
    </form>
</body>
</html>
