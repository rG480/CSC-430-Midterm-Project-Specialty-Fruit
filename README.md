# Specialty Fruit Co. 
Specialty Fruit Co. simulates the inventory and order system for a fruit company. **Users can add to the inventory of the company, modify inventory values, and customers can place orders that modify the company inventory.** 

Specialty Fruit Co. is a project by Roberto Garcia, Muhammad Khalil, Yasantha Marasinghe. It is a midterm project submission for our CSC 430 course at the College of Staten Island. The goal of the project was to _"give students the opportunity to design and development software components that provide useful functions and services in the content of their selected applications."_.  

## Components
**Adding fruit to inventory:**
![](https://khalil.cx/SpecialtyFruit/AddingInventory.gif)

**Modifying fruit quanitity in Inventory:**
![](https://khalil.cx/SpecialtyFruit/ModifyingInventory.gif)

**Placing an order:**
![](https://khalil.cx/SpecialtyFruit/AddingOrder.gif)

## DLL Components
**_BusinessObject(string, string)_**
A constructor used to create the MySQL connection string this object relies on for it's operations. The first parameter is the username, and the second is the password.

**_InsertInventory(string, string, int)_**
InsertInventory allows users to add a row to the inventory table through _fruit_name_, _supplier_name_, and a _quantity_ parameters. This information is taken from as an input from the user, a row is added to the database, and then the order table is updated to reflect the addition. Input validation is conducted to ensure that _fruit_name_ and _supplier_name_ are valid strings and _quanitity > 0_.

**_InsertOrder(int, int, string)_**
InsertOrder allows users to add a row to the orders table through _quantity_, _fruit_id_FK_, and _customer_name_ parameters. This information is taken from as an input from the user, a row is added to the database, and then the order table is updated to reflect the addition. Input validation is conducted to ensure that _quanitity > -1_ and _fruit_id_FK_ exists in inventory. A status message is returned to indicate if the operation was, successful or what, if any bad data prevented the query from being executed.

**_PopulateTables(string)_**
PopulateTables is the method that allows users to view the contents of the database itself. This is achieved by taking one of the table names as a parameter, and using that parameter to determine which SELECT * query to perform. A DataTable object is populated with all of the rows returned by this query, and is what is returned by this method for the purposes of populating any GridView present on a form or webpage.

**_UpdateInventory(int, int)_**
UpdateInventory allows users to modify a rows quantity in the inventory table through _id_ and a _quantity_ parameters. This information is taken from as an input from the user, and _quantity_ is subtracted from the current _quanitity_ value in the corresponding _id_ row. Input validation is conducted to ensure that subtracted quantity does not allow total _quantity < 0_. A status message is returned to indicate if the operation was, successful or what, if any bad data prevented the query from being executed.

## How to Run 
__1) Change MySql Login Information__
- Open the project and navigate to 'default.aspx.cs'
- On line 12 in BuisnessObject Object c1's constructor, replace username and password with MySQL local login information

**2) Running Specialty Fruit Co.**
- Ensure that [.NET Framework 4.7.1 Developer Pack](https://go.microsoft.com/fwlink/?linkid=2099382) is installed
- Make sure you '430 Midterm.sln' is chosen and not folder view in Visual Studio 2017
- Navigate from BusinessLogic.cs and build the project from there

