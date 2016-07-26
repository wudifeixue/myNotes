#First, Second and Third normal form in SQL Server
##1. Breaking data to more granular level for better management of data. 
 * Do not over decomposition.
 * Remove duplicate data.
 * For Example: 
    1. StudentName should break down to StudentFirstName, StudentFamilyName, and StudentMiddleName.
    2. PhoneNumbers generally should NOT break down to RegionCode, AreaCode, and Phone.  

##2. Avoid duplicate data or repeating groups by moving it to master tables like standard tables.  
In other words, all column data should depend on full primary key and not part.  
  * For Example: Avoid 5thStandard and FifthStandard in Standard table.
  * Create a separate centralized table called Standards and put down StandardId and StandardName instead.
  * This can also avoid data entry problem
    1. Duplicate data
    2. None-uniform data

##3. No columns in a table should depend on other columns.  
For Example:  
* Average for a student's mark can be calculated and should not be included in the database, thus it is redundant.
* Note do not apply this rule blindly, redundancy is not always bad, see the situation and what type of applications you are working with, if OLTP then you can apply this rule, if OLAP then think again. This redudancy can gain performance. 
