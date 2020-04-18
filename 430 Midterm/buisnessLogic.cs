﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace _430_Midterm
{
    public class BuisnessLogic
    {
        MySqlConnection con = new MySqlConnection("server=localhost;User Id=root;password=password;database=specialty_fruit");
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

        public void Insert(string fruit, string supplier, int quantity)
        {
            cmd = new MySqlCommand("INSERT INTO specialty_fruit.inventory(fruit_name, supplier_name, quantity, first_added, last_modified)VALUES(@param1,@param2,@param3,@param4,@param5)", con);
            using (con)
            {
                con.Open();
                using (cmd)
                {

                    cmd.Parameters.AddWithValue("@param1", fruit);
                    cmd.Parameters.AddWithValue("@param2", supplier);
                    cmd.Parameters.AddWithValue("@param3", quantity);
                    cmd.Parameters.AddWithValue("@param4", DateTime.Now);
                    cmd.Parameters.AddWithValue("@param5", DateTime.Now);
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                }
                con.Close();
            }
        }

        public int InsertOrder(int ID, int quantity) //add params as needed here
        {
            int count;
            MySqlCommand idExists = new MySqlCommand("SELECT COUNT(*) FROM INVENTORY WHERE fruit_ID=@fruitID ", con);
            using (con)
            {
                con.Open();
                using (idExists)
                {
                    idExists.Parameters.AddWithValue("@fruitID", ID);
                    count = Convert.ToInt32(idExists.ExecuteScalar());
                }
                con.Close();
            }

            //If order number exists in inventory
            if (count == 1)
            {
                //Grabbing quantity of inventory by ID
                int InvQuantity;
                MySqlCommand getQuantity = new MySqlCommand("SELECT quantity FROM specialty_fruit.inventory WHERE fruit_ID=@fruitID ", con);
                using (con)
                {
                    con.Open();
                    using (getQuantity)
                    {
                        getQuantity.Parameters.AddWithValue("@fruitID", ID);
                        InvQuantity = Convert.ToInt32(getQuantity.ExecuteScalar());
                    }
                    con.Close();
                }
                
                //If Order leaves at least 0 products
                if((InvQuantity - quantity) >= 0)
                {
                    //Getting Supplier name
                    String supplierName;
                    MySqlCommand getSupplier = new MySqlCommand("SELECT supplier_name FROM specialty_fruit.inventory WHERE fruit_ID=@fruitID", con);
                    using (con)
                    {
                        con.Open();
                        using (getSupplier)
                        {
                            getSupplier.Parameters.AddWithValue("@fruitID", ID);
                            supplierName = Convert.ToString(getSupplier.ExecuteScalar());
                        }
                    }

                    //Adding to inventory
                    cmd = new MySqlCommand("INSERT INTO specialty_fruit.orders(fruit_ID_FK, quantity, date_placed, customer_name)VALUES(@param1, @param2, @param3, @param4)", con);
                    using (con)
                    {
                        con.Open();
                        using (cmd)
                        {
                            cmd.Parameters.AddWithValue("@param1", ID);
                            cmd.Parameters.AddWithValue("@param2", quantity);
                            cmd.Parameters.AddWithValue("@param3", DateTime.Now);
                            cmd.Parameters.AddWithValue("@param4", supplierName);
                            cmd.CommandType = CommandType.Text;
                            cmd.ExecuteNonQuery();
                        }
                        con.Close();
                    }
                    //Here we update inventory using previous inventory - requested order inventory
                    UpdateInventory(ID, InvQuantity - quantity);
                }
            }

            return count;
        }


        public int UpdateInventory(int prodID,int prodQuant)
        {
            int count;
            DateTime currentTime = DateTime.Now;
            MySqlCommand idExists = new MySqlCommand("SELECT COUNT(*) FROM INVENTORY WHERE fruit_ID=@fruitID ", con);
            using (con)
            {
                con.Open();
                using (idExists)
                {

                    idExists.Parameters.AddWithValue("@fruitID", prodID);
                    count = Convert.ToInt32(idExists.ExecuteScalar());
                }
                con.Close();
            }
            if (count == 1 && prodQuant >-1)
            {
                MySqlCommand updater = new MySqlCommand("UPDATE inventory SET quantity= @param1,last_modified= @param2 WHERE fruit_id = @param3", con);
                using (con)
                {
                    con.Open();
                    using (updater)
                    {

                        updater.Parameters.AddWithValue("@param1", prodQuant);
                        updater.Parameters.AddWithValue("@param2", currentTime);
                        updater.Parameters.AddWithValue("@param3", prodID);
                        count = Convert.ToInt32(updater.ExecuteNonQuery());
                    }
                    con.Close();
                }

            }

            return count;
        }
    }
}