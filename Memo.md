##2017 January 10
SQL Server Select random samples from a large amount of data
```SQL
USE [Database]
SELECT *
FROM [Schema].[Table]
TABLESAMPLE (100 ROWS)
WHERE Condition like '%filter%'
```

###2016 December 5  
SQL Server Update PostalCode to Uppercase  

```SQL
USE [Database]
  UPDATE [Schema].[Table]
  SET PostalCode = UPPER(PostalCode)
  WHERE  PostalCode != UPPER(PostalCode)
COLLATE Latin1_General_CS_AS
```

###2016 November 25
Generic answer for future developers.

SQL Server  
```SQL
UPDATE 
     t1
SET 
     t1.column = t2.column
FROM 
     Table1 t1 
     INNER JOIN Table2 t2 
     ON t1.id = t2.id;
```
Oracle (and SQL Server)  
```SQL
UPDATE 
     t1
SET 
     t1.colmun = t2.column 
FROM 
     Table1 t1, 
     Table2 t2 
WHERE 
     t1.ID = t2.ID;
```
MySQL  
```SQL
UPDATE 
     Table1 t1, 
     Table2 t2
SET 
     t1.column = t2.column 
WHERE
     t1.ID = t2.ID;
```
####SQL Server Reduce Log File to reduce backup size
```SQL
USE [Database];
GO
-- Truncate the log by changing the database recovery model to SIMPLE.
ALTER DATABASE [Database]
SET RECOVERY SIMPLE;
GO
-- Shrink the truncated log file to 1 MB.
DBCC SHRINKFILE ([Database]_Log, 1);
GO
-- Reset the database recovery model.
ALTER DATABASE [Database]
SET RECOVERY FULL;
GO
```
###2016 November 14
####SQL Server Database Stuff  
Transfer data from UUID to Integer ID  
First create a column for the old table that is Integer and Identity so it is increamental.  
Then  
SELECT  
b.[IntegerID] AS [UUIDsColumn]  
FROM [TABLE] a  
LEFT JOIN [TABLE] b ON a.[UUID] = b.[UUID]  
Well that was pseudo code but I guess it can help me remember what I did today.  

###2016 Semptember 23
####How to remove PDF watermark
First install [Pdftk](http://www.pdflabs.com/docs/install-pdftk/)  
1. Download Pdftk and extract **pdftk.exe** and **libiconv2.dll** to **%windir%\System32**, a directory in the path or any other location of your choice.  
2. Download and install Notepad++.  
3. PDF streams are usually compressed using the DEFLATE algorithm. This saves space, but it makes the PDF's source illegible.  
4. Open **uncompressed.pdf** with Notepad++ to reveal the structure of the watermark.  
```
pdftk original.pdf output uncompressed.pdf uncompress  
```
If you see errors due to password encryption.  
```
Error: Failed to open PDF file:
   101.pdf
   OWNER PASSWORD REQUIRED, but not given (or incorrect)
```
To decrypt password in the PDF file  

```
qpdf –password="" –decrypt original.pdf nopassword.pdf  
```
Once done decryption and uncompressing  
Open **uncompressed.pdf** with Notepad++ to reveal the structure of the watermark.  
Clear all the watermarks, the easy way is to find the watermark text, or same code in each page.  Delete all of them and save.  
Now after all watermarks have been deleted, perform
```
pdftk uncompressed.pdf output nowatermark.pdf compress
```
Now enjoy the nowatermark.pdf and the file will be half the size.  

###2016 September 16
Responsive images with user experience imrpoved by showing detail image if screen size is less than 500px.  
```HTML
	<picture>
		<source srcset="./images/skyline_cropped.jpg" media="(max-width: 500px)">
		<img src="./images/skyline_compressed.jpg">
	</picture>
	<img src="./images/skyline_compressed.jpg">
```
###2016 August 26
Love Markdown now more than ever! Saves so much time and now only types meaningful things and never feel boring to adjust little things that purely waste time again.  
Find out an online Markdown to HTML editor that is pretty convenient for quick HTML.  
http://dillinger.io/  
Find out how to reset SQL Server database Id and content
```sql
TRUNCATE TABLE   
[Database].[Schema].[Table]
```
  
###2016 August 24
Find out how to reset SQL Server database Id  
```sql
DBCC CHECKIDENT ('[Table]', RESEED, 0);
GO
```
  
###2016 July 11  
Think about SQL Query and Object-relational mapping (ORM)  
Windows Schedule Tasks run batch file need further investigation, appeareantly if just run .bat file it might run with a notepad.

###2016 June 30  
when net user in CMD does not work, **netplwiz** is a pretty good alternative  
discovered that Windows10 Privacy terms are disgusting https://privacy.microsoft.com/en-us/privacystatement/  
starts to write goals and things to keep in mind everyday  

###2016 May 20  
Database normalization - minimize data redundancy, refactor the database to increase efficiency  

###2016 May 10  
Pragmatic Programmer - 程序要每天多练多学习，不停的积累才能进步  
记住了关于UX开发的关键 “Don't Make Me Think”  
继续学习OOP http://www.codeproject.com/Articles/22769/Introduction-to-Object-Oriented-Programming-Concep  
发现了http://kindeditor.net/ 和 http://ueditor.baidu.com/website/  
了解了OOP abstraction  
听工具讲了Autocomplete弊端和业务选择，考虑一定情况选择click then show  
听了MVVM databinding和最新的JS技术（React, Angular)  
考虑了ViewModel取属性值，明白了什么时候需要StoredProcedure（存储过程），还有Trigger和inner join, outer join  
Thought about when to use viewmodel and system resource related to it  
听到了Adaptor和Singleton Design Pattern比较实用，Factory是做大型类库，观测者（Observer）不是很清楚，但是了解了.NET事件机制，好比Minecraft红石系统，那就是一个微软做的Observer封装。    
明白自己必须会事件，代理，和委托..http://www.cnblogs.com/wudiwushen/archive/2010/04/20/1703368.html  
看了下shallow copy和deep copy，感觉自己继承理解的不够深透  
