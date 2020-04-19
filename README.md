# Specialty Fruit Co. 
Specialty Fruit Co. simulates the inventory and order system for a fruit company. **Users can add to the inventory of the company, modify inventory values, and customers can place orders that modify the company inventory.** 

Specialty Fruit Co. is a project by Roberto Garcia, Muhammad Khalil, Yasantha Marasinghe. It is a midterm project submission for our CSC 430 course at the College of Staten Island. The goal of the project was to _"give students the opportunity to design and development software components that provide useful functions and services in the content of their selected applications."_.  

## Components
**Adding fruit to inventory:**
![](https://khalil.cx/SpecialtyFruit/AddingInventory.gif | width=1440)

**Modifying fruit quanitity in Inventory:**
![](https://khalil.cx/SpecialtyFruit/ModifyingInventory.gif | width=1440)

**Placing an order:**
![](https://khalil.cx/SpecialtyFruit/AddingOrder.gif | width=1440)

## DLL Components
**_BusinessObject(string, string)_**

**_InsertInventory(string, string, int)_**
InsertInventory allows users to add a row to the inventory table through _fruit_name_, _supplier_name_, and a _quantity_ parameters. This information is taken from as an input from the user, a row is added to the database, and then the order table is updated to reflect the addition. Input validation is conducted to ensure that _fruit_name_ and _supplier_name_ are valid strings and _quanitity > 0_.

**_InsertOrder(int, int, string)_**
InsertOrder allows users to add a row to the orders table through _quantity_, _fruit_id_FK_, and _customer_name_ parameters. This information is taken from as an input from the user, a row is added to the database, and then the order table is updated to reflect the addition. Input validation is conducted to ensure that _quanitity > -1_ and _fruit_id_FK_ exists in inventory.

**_PopulateTables(string)_**

**_UpdateInventory(int, int)_**
UpdateInventory allows users to modify a rows quantity in the inventory table through _id_ and a _quantity_ parameters. This information is taken from as an input from the user, and _quantity_ is subtracted from the current _quanitity_ value in the corresponding _id_ row. Input validation is conducted to ensure that subtracted quantity does not allow total _quantity < 0_.

## How to Run 
__1) Change MySql Login Information__
- Open the project and navigate to 'BusinessLogic.cs'
- On line 12 in MySqlConnection replace user and password with MySQL local login information

**2) Running Specialty Fruit Co.**
- Ensure that [.NET Framework 4.7.1 Developer Pack](https://go.microsoft.com/fwlink/?linkid=2099382) is installed
- Make sure you '430 Midterm.sln' is chosen and not folder view in Visual Studio 2017
- Navigate from BusinessLogic.cs and build the project from there

