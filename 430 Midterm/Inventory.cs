using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _430_Midterm
{
    public class Inventory
    {
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
            set { quantity = value; }
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
    }
}