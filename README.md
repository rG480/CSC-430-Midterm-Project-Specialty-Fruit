HOW TO SETUP SPECIALTY FRUIT: 

1) Change MySql Login Information
- Open project and navigate to 'BusinessLogic.cs'
- On line 12 in MySqlConnection replace user and password with MySQL local login information

2) Change MySql Reference
- Go to solution explorer
- Make sure '430 Midterm.sln' is chosen
- Navigate to references
- Right click on MySQL.data and delete the referece
- Right click on References and 'Add Reference'
- Click browse, and navigate to your 'MySql.data.dll' file, usually located in
"C:\Program Files (x86)\MySQL\Connector NET 8.0\Assemblies\v4.5.2"
- Click add
- Check the box on the left of the list
- Click okay

RUNNING SPECIALTY FRUIT
- Make sure you '430 Midterm.sln' is chosen and not folder view
- Navigate from BusinessLogic.cs and build project from there
