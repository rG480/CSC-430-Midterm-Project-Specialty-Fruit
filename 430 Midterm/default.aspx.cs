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

           
            DataTable data= new DataTable();
            data = c1.PopulateTables("inventory");
            data.Columns["fruit_ID"].ColumnName = "ID";
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
            Label1.Text = FruitName.Text;
        }
    }
}