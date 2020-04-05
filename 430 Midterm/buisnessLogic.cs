using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace _430_Midterm
{
   public class BuisnessLogic
    {
        MySqlConnection con = new MySqlConnection("server=localhost;User Id=root;password=Xenos1118;database=specialty_fruit");
        MySqlCommand cmd;
        public DataTable PopulateTables(string table)
        {
            DataTable dt = new DataTable();
            MySqlDataAdapter da;
          
            MySqlCommand cmd;
            if (table == "inventory")
            {
                cmd = new MySqlCommand("SELECT * FROM inventory", con);
                using (con)
                {
                    con.Open();
                    da = new MySqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                con.Close();

                return dt;
            }
            if (table == "orders")
            {
                cmd = new MySqlCommand("SELECT * FROM orders", con);
                using (con)
                {
                    con.Open();
                    da = new MySqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                con.Close();

                return dt;

            }
            return null;
        }
        public void Insert(string fruit,string supplier,int quantity) {
            cmd = new MySqlCommand("INSERT INTO specialty_fruit.inventory(fruit_name, supplier_name, quantity, first_added, last_modified)VALUES(@param1,@param2,@param3,@param4,@param5)",con);
            using (con)
            {
                con.Open();
                using (cmd)
                {
                    
                    cmd.Parameters.AddWithValue("@param1", fruit);
                    cmd.Parameters.AddWithValue("@param2",supplier);
                    cmd.Parameters.AddWithValue("@param3", quantity);
                    cmd.Parameters.AddWithValue("@param4", DateTime.Now);
                    cmd.Parameters.AddWithValue("@param5", DateTime.Now);
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                }
                con.Close();
            }
        }
      
    }
}