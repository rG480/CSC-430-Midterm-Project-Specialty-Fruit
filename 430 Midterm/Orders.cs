using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _430_Midterm
{
    public class Orders
    {
        private int orderID;
        private int fruitID;
        private int quantity;
        private DateTime datePlaced;
        private string customerName;
        public int OrderID
        {
            get { return orderID; }
            set { orderID = value; }
        }
        public int FruitID
        {
            get { return fruitID; }
            set { fruitID = value; }
        }
        public int Quantity
        {
            get { return quantity; }
            set { quantity = value; }
        }
        public DateTime DatePlaced
        {
            get { return datePlaced; }
            set { datePlaced = value; }
        }
        public string CustomerName
        {
            get { return customerName; }
            set { customerName = value; }
        }
    }
  
}