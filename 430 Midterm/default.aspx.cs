using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
namespace _430_Midterm
{
    public partial class MainPage : System.Web.UI.Page
    {
        BuisnessLogic c1 = new BuisnessLogic();

        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateInventoryRows();
            UpdateOrdersRows();
        }
        protected void UpdateInventoryRows()
        {
           

            DataTable data = new DataTable();
            data = c1.PopulateTables("inventory");
            InvGV.DataSource = data;
            InvGV.DataBind();

        }
        protected void UpdateOrdersRows()
        {

            DataTable data = new DataTable();
            data = c1.PopulateTables("orders");

            OrdersGV.DataSource = data;
            OrdersGV.DataBind();
        }
        protected void ProcessInv(object sender, EventArgs e)
        {
            int quantity = Int32.Parse(Quantity.Text);
            string a = SupplierName.Text;
            string s = FruitName.Text;
            if (quantity > 0)
            {
                c1.Insert(s, a, quantity);
            }
            UpdateInventoryRows();
        }
        protected void ProcessOrder(object sender, EventArgs e)
        {

          //  TextBox1.Text = c1.InsertOrder(Int32.Parse(OrderFruitID.Text)).ToString();
        }
        protected void ModifyInventory(object sender,EventArgs e)
        {
            string message="";
            int ID=Int32.Parse(modInvIDLabel.Text);
            int quantity = Int32.Parse(modInvQuant.Text);
            string resultMessage= c1.UpdateInventory(ID, quantity);
           
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('"+resultMessage+"');", true);
            UpdateInventoryRows();
        }
        protected void InvGV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
            int index = Int32.Parse((string)e.CommandArgument);
            string fruitID = InvGV.DataKeys[index].Values["fruit_id"].ToString();
            string Code = InvGV.DataKeys[index].Values["quantity"].ToString();
            modInvIDLabel.Text = fruitID;
            modInvQuant.Text = Code;
            ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "openModal();", true);
        }

    }
}