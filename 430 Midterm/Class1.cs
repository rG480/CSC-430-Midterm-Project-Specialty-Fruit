using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace _430_Midterm
{
   public class Class1
    {//TODO: Rename class from 'Class1'. Maybe to 'buisnessLogic?'
     
      
        public List<Inventory> PopulateInvGV()
        {
            List<Inventory> answer = new List<Inventory>();
            MySqlConnection con = new MySqlConnection("server=localhost;User Id=root;password=Xenos1118;database=specialty_fruit");
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM inventory", con);
            using (con)
            {
                con.Open();
                MySqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Inventory newEntry = new Inventory();
                    newEntry.ID = (int)reader["fruit_ID"];
                    newEntry.FruitName = (string)reader["fruit_name"];
                    newEntry.SupplierName = (string)reader["supplier_name"];
                    newEntry.Quantity = (int)reader["quantity"];
                    newEntry.DateAdded = (DateTime)reader["first_added"];
                    newEntry.DateModified = (DateTime)reader["last_modified"];
                    answer.Add(newEntry);
                }
            }
            con.Close();
            
            return answer;

        }
        public List<Orders> PopulateOrderGV()
        {
            List<Orders> answer = new List<Orders>();
            MySqlConnection con = new MySqlConnection("server=localhost;User Id=root;password=Xenos1118;database=specialty_fruit");
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM orders", con);
            using (con)
            {
                con.Open();
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Orders newEntry = new Orders();
                    newEntry.OrderID = (int)reader["order_ID"];
                    newEntry.FruitID = (int)reader["fruit_ID_FK"];
                    newEntry.Quantity = (int)reader["quantity"];
                    newEntry.DatePlaced = (DateTime)reader["date_placed"];
                    newEntry.CustomerName = (string)reader["customer_name"];
                    answer.Add(newEntry);
                }
            }
            con.Close();

            return answer;

        }
    }
}