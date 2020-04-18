<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="_430_Midterm.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <title>Specialty Fruits Co.</title>
    <script type="text/javascript">

    </script>
    <script type="text/javascript">
        function openModal() {
            $('#modifyInvModal').modal('show');
        }
    </script>

    <style type="text/css">
        .modal-content {
            padding: 25px 25px 25px 25px;
        }

        .rounded-corners {
            border-radius: 5px;
        }

        .modal-button {
            color: white;
            background-color: #17a2b8;
            border-radius: 10px;
        }

        .submit-button {
            margin: 0 50px 0 50px;
        }

        .gridTitles {
            margin-top: 25px;
            text-align: center;
            vertical-align: middle;
        }

        .submit-button {
            text-align: center;
            vertical-align: middle;
        }

        .grid {
            margin: 25px 25px 25px 25px;
        }

        .orders-grid {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 25px 25px 25px 25px;
        }

        .grids {
            margin: 0 25px 0 25px;
        }

        .footer {
            margin: 25px 50px 50px 50px;
        }

        .seperator {
            margin: 0px 50px 0px 50px;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-light" style="background-color: #17a2b8;">
        <span class="navbar-brand mb-0 h1" style="color:white;">Specialty Fruit Co.</span>
    </nav>

    <form id="form1" runat="server">
        <div id="inventoryModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!--Inventory Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Inventory</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                    </div>
                    <h4> Please enter the details of the fruit product you wish to add.</h4>
                    <br>
                    <div class="form-group">
                        <div>
                            <asp:TextBox ID="FruitName" runat="server" MaxLength="50" pattern="[a-zA-Z ' .]"
                                placeholder="Fruit Name"></asp:TextBox>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="FruitName"
                                ErrorMessage="Fruit Name must be letters only!"
                                ValidationExpression="[a-zA-Z ,]{1,50}" />
                            <asp:RequiredFieldValidator runat="server" id="reqFruitName"
                                controltovalidate="FruitName" />
                        </div>

                        <div>
                            <asp:TextBox ID="SupplierName" runat="server" placeholder="Supplier Name"></asp:TextBox>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="SupplierName"
                                ErrorMessage="[Aa-Zz], ['] and [.] only!" ValidationExpression="[a-zA-Z ' , .]{1,50}" />
                            <asp:RequiredFieldValidator runat="server" id="reqSupplierName"
                                controltovalidate="SupplierName" />
                        </div>

                        <div>
                            <asp:TextBox ID="Quantity" runat="server" type="number" placeholder="Quantity">
                            </asp:TextBox><br />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="Quantity"
                                ErrorMessage="Numbers greater than 1 only!" ValidationExpression="^[1-9]\d*$" />
                            <asp:RequiredFieldValidator runat="server" id="reqQuantity" controltovalidate="Quantity" />
                        </div>

                    </div>
                    <div class="submit-button">
                        <asp:Button ID="BtnSave" CssClass="modal-button" runat="server" Text=" Save "
                            OnClick="ProcessInv" UseSubmitBehavior="false"></asp:Button>
                    </div>

                </div>
            </div>
        </div>
        <div id="ordersModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!--Orders Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Orders</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                    </div>
                    <h4> Please enter the ID of a fruit.</h4></br>
                    <div class="form-group">
                        <asp:TextBox ID="OrderFruitID" runat="server" type="number" placeholder="FruitID"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Quantity"
                            ErrorMessage="Numbers greater than 1 only!" ValidationExpression="^[1-9]\d*$" />
                        <asp:RequiredFieldValidator runat="server" id="reqOrderFruitID"
                            controltovalidate="OrderFruitID" />
                    </div>

                    <div class="submit-button">
                        <asp:Button ID="Button2" CssClass="modal-button" runat="server" Text=" Save "
                            OnClick="ProcessOrder" UseSubmitBehavior="false"></asp:Button>
                    </div>

                </div>
            </div>
        </div>
        <div id="modifyInvModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!--Inventory Modification Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Edit a product currently in inventory.</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                    </div>
                    <h4> Modifying the values of fruit ID:</h4>
                    <asp:Label ID="modInvIDLabel" style="font-size:24px;font-weight:bold" runat="server" Text="N/A">
                    </asp:Label></br>

                    <div class="form-group">
                        <asp:TextBox ID="modInvQuant" runat="server" Type="number" Text="0"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="modInvQuant"
                            ErrorMessage="Numbers greater than 1 only!" ValidationExpression="^[1-9]\d*$" />
                        <asp:RequiredFieldValidator runat="server" id="reqModInvQuant"
                            controltovalidate="modInvQuant" />

                    </div>

                    <div class="submit-button">
                        <asp:Button ID="Button1" CssClass="modal-button" runat="server" Text=" Save "
                            OnClick="ModifyInventory" UseSubmitBehavior="false"></asp:Button>
                    </div>

                </div>
            </div>
        </div>

        <div class="grids" style="display:grid; grid-template-columns: 1fr 1fr">
            <div>
                <h2 class="gridTitles">Product Inventory</h2>
                <div class="grid">
                    <asp:GridView ID="InvGV" CssClass="grid" OnRowCommand="InvGV_RowCommand" runat="server"
                        DataKeyNames="fruit_id,fruit_name,quantity" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="fruit_id" HeaderText="Fruit ID" />
                            <asp:BoundField DataField="fruit_name" HeaderText="Fruit Name" />
                            <asp:BoundField DataField="supplier_name" HeaderText="Supplier Name" />
                            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                            <asp:BoundField DataField="first_added" HeaderText="Date Added" />
                            <asp:BoundField DataField="last_modified" HeaderText="Date Last Modified" />
                            <asp:buttonfield buttontype="button" Text="Modify Quantity" commandname="Details" />
                        </Columns>
                    </asp:GridView>
                    <div class="submit-button">
                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#inventoryModal">Add
                            a product</button>
                    </div>
                </div>
            </div>

            <div>
                <h2 class="gridTitles">Orders</h2>
                <div class="orders-grid">
                    <asp:GridView ID="OrdersGV" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="order_id" HeaderText="Order ID" />
                            <asp:BoundField DataField="fruit_ID_FK" HeaderText="Fruit ID" />
                            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                            <asp:BoundField DataField="date_placed" HeaderText="Date Placed" />
                            <asp:BoundField DataField="customer_name" HeaderText="Customer" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="submit-button">
                    <button type="button" class="btn btn-info " data-toggle="modal" data-target="#ordersModal">Add an
                        order</button>
                </div>
            </div>
        </div>

        <hr class="seperator">

        <div class="footer">
            <h2>About Specialty Fruit Co.</h2>
            <p>At Specialty Fruit Co., we give you an authentic connection to your food. Growing your fruits is not only
                our family's passion, but a 4th generation way of life.
                A true labor of love, we strive to operate our farm honorably and with the utmost respect for those our
                products and services touch.
                Every Specialty Fruit Co. product is guaranteed to deliver true taste and value without parallel.</p>

            <p>
                Nearly a century ago, an "Apple Train" ran its weekly route from the heart of Boston to the rolling
                orchards of Specialty Fruit Co. Farm.
                People mostly drive here now, but the farm remains as America's oldest and largest apple orchard.
                It's the oldest continuously-operated in America.
                Four generations of the Fruit family have worked this land, dedicated to their simple mission of
                sustainably growing the finest fruit available.
            </p>
            <br />
            <p>Project by: <strong>Roberto Garcia, Muhammad Khalil, and Yasantha ...</strong></p>
        </div>

    </form>
</body>

</html>