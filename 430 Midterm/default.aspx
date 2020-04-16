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

    <asp:TextBox ID="FruitName" runat="server" MaxLength="50" pattern="[a-zA-Z ' .]"></asp:TextBox>
    <asp:RegularExpressionValidator runat="server" ControlToValidate="FruitName" ErrorMessage="Fruit Name must be letters only!" ValidationExpression="[a-zA-Z ,]{1,50}" />

    <asp:TextBox ID="SupplierName" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator runat="server" ControlToValidate="SupplierName" ErrorMessage="Letters, apostrophes and periods only!" ValidationExpression="[a-zA-Z ' , .]{1,50}" />

    <asp:TextBox ID="Quantity" runat="server" type="number"></asp:TextBox><br />
    <asp:RegularExpressionValidator runat="server" ControlToValidate="Quantity" ErrorMessage="Numbers greater than 1 only!" ValidationExpression="^[1-9]\d*$" />

</div>
      <asp:Button ID="BtnSave" CssClass="btn btn-success" runat="server" Text=" Save " OnClick="ProcessInv" UseSubmitBehavior="false"></asp:Button>
      </div>
    </div>
     </div>
  <div id="ordersModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
      <!--Orders Modal content-->
      <div class="modal-content">
      <div class="modal-header">
          <h4 class="modal-title">Add a product.</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
      <div class="modal-body">
	     </div>
	  <h4> Please enter the details of the fruit product you wish to add.</h4></br>
	  <div class="form-group">

    

    <asp:TextBox ID="OrderFruitID" runat="server" type="number"></asp:TextBox><br />
    <asp:RegularExpressionValidator runat="server" ControlToValidate="Quantity" ErrorMessage="Numbers greater than 1 only!" ValidationExpression="^[1-9]\d*$" />

</div>
      <asp:Button ID="Button2" CssClass="btn btn-success" runat="server" Text=" Save " OnClick="ProcessOrder" UseSubmitBehavior="false"></asp:Button>
      </div>
    </div>
     </div>
 
    
        <div style="display:grid;grid-template-columns: 1fr 1fr">
        <div>
            <h1>Inventory</h1>
           <asp:GridView ID="InvGV"  OnRowCommand="InvGV_RowCommand" runat="server"
               DataKeyNames="fruit_id,fruit_name,quantity"  AutoGenerateColumns="False" >
                <Columns>
                         <asp:BoundField  DataField="fruit_id" HeaderText="Fruit ID" />
                         <asp:BoundField  DataField="fruit_name" HeaderText="Fruit Name" />
	                     <asp:BoundField  DataField="supplier_name" HeaderText="Supplier Name" />
                         <asp:BoundField  DataField="quantity" HeaderText="Quantity" />
                         <asp:BoundField  DataField="first_added" HeaderText="Date Added" />
                         <asp:BoundField  DataField="last_modified" HeaderText="Date Last Modified" />
	                     <asp:buttonfield  buttontype="button" Text="Details" commandname="Details"  />
                                
       
                            
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
            <asp:TextBox ID="TextBox1" runat="server" Type="number" Text="0"></asp:TextBox >
             <asp:RegularExpressionValidator runat="server" ControlToValidate="Quantity" ErrorMessage="Numbers greater than 1 only!" ValidationExpression="^[1-9]\d*$" />
           <asp:TextBox ID="TextBox2" runat="server" Text="Label"></asp:TextBox>
        </div>
        </div>
      
        
      
        <button type="button" class="btn btn-info " data-toggle="modal" data-target="#inventoryModal" >Open Modal</button>
          <button type="button" class="btn btn-info " data-toggle="modal" data-target="#ordersModal" >Open Modal</button>
    </form>
</body>
</html>
