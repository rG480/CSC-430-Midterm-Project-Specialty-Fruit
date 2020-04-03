using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace _430_Midterm
{
    

    public class Class1
    {//TODO: Rename class from 'Class1'. Maybe to 'buisnessLogic?'
     //TODO: move below variables to seperate class, and simply use objects of that class in the below method(s).
     //Do same for the variables needed for orders
        private int id;
        private string fruitName;
        private string supplierName;
        private int quantity;
        private DateTime dateAdded;
        private DateTime dateModified;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }
        public string FruitName
        {
            get { return fruitName; }
            set { fruitName = value; }
        }
        public string SupplierName
        {
            get { return supplierName; }
            set { supplierName = value; }
        }
        public int Quantity
        {
            get { return quantity; }
            set {quantity = value; }
        }
        public DateTime DateAdded
        {
            get { return dateAdded; }
            set { dateAdded = value; }
        }
        public DateTime DateModified
        {
            get { return dateModified; }
            set { dateModified = value; }
        }
        public List<Class1> PopulateInvGV()
        {
            List<Class1> answer = new List<Class1>();
            MySqlConnection con = new MySqlConnection("server=localhost;User Id=root;password=put_pw_here;database=specialty_fruit");
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM inventory", con);
            using (con)
            {
                con.Open();
                MySqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Class1 newEntry = new Class1();
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
    }
}