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

        public DataTable PopulateTables(string table)
        {
            DataTable dt = new DataTable();
            MySqlDataAdapter da;
            MySqlConnection con = new MySqlConnection("server=localhost;User Id=root;password=Put_PW_Here;database=specialty_fruit");
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
      
    }
}