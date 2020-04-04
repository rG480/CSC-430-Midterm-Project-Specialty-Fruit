<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="_430_Midterm.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet"/>
    <title>Specialty Fruits Co.</title>
    <script type="text/javascript">
   
</script>
    <script>
        function func1() {
            $("#inventoryModal").modal('show');
        }  
    </script>
</head>
<body>
     <form id="form1" runat="server"><div id="inventoryModal" class="modal fade" role="dialog">
     <div class="modal-dialog">
      <!--Inventory Modal content-->
      <div class="modal-content">
      <div class="modal-header">
          <h4 class="modal-title">Add a product.</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        
      </div>
      <div class="modal-body">
	     </div>
	  <h4> Please enter the details of the fruit product you wish to add.</h4></br>
	  <div class="form-group">
      <asp:TextBox ID="FruitName" runat="server"></asp:TextBox><br />
       <asp:TextBox ID="SupplierName" runat="server"></asp:TextBox><br />
       <asp:TextBox ID="Quantity" runat="server"></asp:TextBox><br />
	   </div>
      <asp:Button ID="BtnSave" CssClass="btn btn-success" runat="server" Text=" Save " OnClick="ProcessInv" UseSubmitBehavior="false"></asp:Button>
      </div>
    </div>
     </div>
    </div>
    
        <div style="display:grid;grid-template-columns: 1fr 1fr">
        <div>
            <h1>Inventory</h1>
           <asp:GridView ID="InvGV" runat="server"
                 AutoGenerateColumns="True">
                <Columns>
                    
                </Columns>
            </asp:GridView>
            </div>
        <div>
            <h1>Orders</h1>
          <asp:GridView ID="OrdersGV" runat="server"
               AutoGenerateColumns="True">
                <Columns>
                    
                </Columns>
            </asp:GridView>
           <!--This label was just used for testing purposes, testing if the text data was sent-->
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
           
        </div>
        </div>
      
        
      
        <button type="button" class="btn btn-info " data-toggle="modal" data-target="#inventoryModal" >Open Modal</button>
    </form>
</body>
</html>
