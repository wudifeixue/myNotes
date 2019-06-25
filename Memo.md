## 2019 June 25
### Hacker ethic
(1) 使用计算机以及所有有助于了解这个世界本质的事物都不应受到任何限制。任何事情都应该亲手尝试。  
　　（Access to computers—and anything that might teach you something about the way the world works—should be unlimited and total. Always yield to the Hands-On Imperative!）  
(2) 信息应该全部免费。  
　　（All information should be free.）  
(3) 不信任权威，提倡去中心化。  
　　（Mistrust Authority—Promote Decentralization.）  
(4) 判断一名黑客的水平应该看他的技术能力，而不是看他的学历、年龄或地位等其他标准。  
    （Hackers should be judged by their hacking, not bogus criteria such as degrees, age, race, or position.）  
(5) 你可以用计算机创造美和艺术。  
　　（You can create art and beauty on a computer.）  
(6) 计算机使生活更美好。  
　　（Computers can change your life for the better.）  

## 2019 June 04
### Something in C#

```c#
var childClassCounts = children.Select(child => child.ClientClasses
.Where(clientClass => clientClass.ClientClassStateId == 6 || clientClass.ClientClassStateId == 5).Count());
var totalChildClasses = childClassCounts.Sum();  //[2, 1, 1] (4)

IList<int> hello;

List<object> hello1 = new List<object> { "1", 2, 's', true, 1.11111 };

IList<object> hello2 = hello1;

IEnumerable<object> test = hello1;

IQueryable<object> something = test.AsQueryable();
```

## 2019 Feb 06
### Protective way to update one table from another database in SQL Server
```sql
BEGIN TRANSACTION

UPDATE targetTable
SET [Column] = sourceTable.[Column]
FROM [Database].[dbo].[Table] targetTable
JOIN [OtherDB].[dbo].[Table] sourceTable
ON targetTable.ID = sourceTable.ID

-- extra check to see if update is correct
SELECT * FROM [Database].[dbo].[Table]
ROLLBACK

-- once things are correct, comment out BEGIN TRANSACTION and ROLLBACK to excute the real update
```


## 2018 June 6
### Find out duplicate of a column in SQL Server
```sql
SELECT ColumnName,
COUNT(ColumnName)
FROM [Database].[dbo].[ColumnName]
GROUP BY ColumnName
HAVING COUNT(ColumnName) > 1
```

### Populate existing column with identity like ID in SQL Server
```sql
USE [Database]
SET @tempId = 5555 --This is because the column has some ID already, but some are still null, starts at the largest ID
UPDATE [dbo].[Table]
SET @tempId = Id = @tempId + 1
WHERE Id IS NULL
```


## 2018 June 1
### Stop and Remove all Docker containers
```bash
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
```

## 2018 May 08
### Select Partial Data from Column in SQL Server
So I have a bounch of emails are stored in this format: 
`hello@email.com#mailto:hello@email.com#`
And obviously it is not a great format, with a quick `LEFT` I could change the selection much cleaner.  
```sql
SELECT [Emails]
	  ,LEFT([Emails], CHARINDEX('#mailto',[Emails]) -1) AS CleanEmails
  FROM [Database].[dbo].[Table]
  WHERE emails like '%#mailto%'
```
And you could put anything other than `#mailto` to maybe `,` for seperating data, then we can just update the entire thing easily since the SELECT result looks pretty good.  
Then we just update the table so the emails are not so messy anymore.  
```sql
UPDATE [Database].[dbo].[Table]
SET [Emails] = LEFT([Emails], CHARINDEX('#mailto',[Emails]) -1)
WHERE emails like '%#mailto%'
```

## 2018 May 02
### Export Microsoft Access data to SQL Server
If you have perfect data, I mean literally perfect that date is date and number is number only, no need to truncate and no need to fill required data, then you can use Microsoft's import tool that is for Access. It might work.  

Otherwise, we will have to work our way around.  

It seems like after a ton of struggle, the easiest thing to do is export the specific data table from Access to Excel 97. This way all the extra fancy features of Excel will go away and then we can use SQL Server import tool to get the data. 


## 2018 January 31
### Change phone number formats in SQL Server
Has to change phone number formats from one to another.  
Such as ###-###-#### to (###) ###+####  
```SQL
UPDATE [Database].[Schema].[Table]
  SET PhoneNumber = '('+ SUBSTRING(PhoneNumber, 1, 3) + ') ' + SUBSTRING(PhoneNumber, 5, 12)
```
Could put additional filters such as 
```sql 
WHERE PhoneNumber like '[0-9][0-9][0-9]% and PhoneNumber not like '%(%'
``` 
with regular expression and wild card in where statement but I had pretty good data.  

## 2017 December 18
### Pass in array for SQL Server
It is rather difficult to SELECT something in SQL Server with multiple WHERE statement.  
Normally I would go for
```SQL
SELECT *
  FROM [Database].[dbo].[Table]
  WHERE [FirstColumn] = 'Aoba'
  or [FirstColumn] = 'Chiya'
```
To get a quick search.

Then there is this requirement I need to do that for 1000 times.  
I search up and found that you can do this instead:  
```SQL
SELECT *
  FROM [Database].[dbo].[Table]
  WHERE [FirstColumn] in ('Aoba', 'Chiya')
```



## 2017 November 20
### Order in SQL Server with something special
Usually order by inside SQL Server will have an option of ASC or DESC.  
Say for a list of item you have.  
`1, 0, Premium, 5, 3, 4, 2`.  

Generally ording inside the database will go with Number first and then Premium last.  
`0, 1, 2, 3, 4, 5, Premium`.  

However, if we want the premium to be the first displayed, and 2 to be behind 4. And this can get a little tricky.  
In SQL Server, we can use something called `CASE`, `WHEN` and `THEN` to do this.  

In practice it is fairly simple.
```SQL
ORDER BY 
CASE 
  WHEN name LIKE 'Premium' THEN 0
  WHEN name = 2 THEN 5
  ELSE name
END
ASC
```
Result will be: `Premium, 0, 1, 3, 4, 2, 5`.


## 2017 October 23
### Delete all local git branches except current one
```bash
git branch | grep -v "dev" | xargs git branch -D
```
This would delete all current branches that was already pushed to GitHub and keep the "dev" branch.

## 2017 September 20
### How to do a speedtest on Ubuntu terminal
```bash
sudo apt install speedtest-cli
speedtest-cli
```  
or  
`curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -`
## 2017 July 24
### Libraries to Modify Excel files for C# without having to install Office
After about one hour of research. EPPlus and NPoi seems like the only viable choices on 2017. And from various sources [#1](https://stackoverflow.com/questions/151005/create-excel-xls-and-xlsx-file-from-c-sharp) [#2](https://stackoverflow.com/questions/30573073/what-is-the-common-knowledge-about-npoi-epplus-and-koogra-as-of-2015) [#3](https://www.reddit.com/r/dotnet/comments/1s8c1k/best_xls_readingwriting_library/) and the [Chinese one](http://blog.csdn.net/zr_wb/article/details/53580671) EPPlus seems to be better.  
Also I recall Telerik has something called [RadSpreadProcessing](http://www.telerik.com/blogs/spreadprocessing---complete-solution-to-create-modify-and-export-spreadsheets---part-i) that worth checking out later on.  

Also note that [Apache Poi](https://poi.apache.org/) seems like the most viable one for Java.  
And [xlsx](https://www.npmjs.com/package/xlsx) seems to be most popular in npm for JavaScript. 

## 2017 May 25
### Add a year to current Time in JavaScript
```JS
var result = new Date;
result.setFullYear(result.getFullYear() + 1);
console.log(result);
```
### Store cookie in browser with Name, Value, expire date and path
```JS
var currentTimeCookie = "Name=Value;expires=" + new Date(new Date().setFullYear(new Date().getFullYear() + 1)).toUTCString() + ";path=/";
document.cookie = currentTimeCookie;
```
### localStorage and sessionStorage
```JS
localStorage.setItem('key', 'value')
sessionStorage.setItem('key', 'value')
```

## 2017 May 15
XSD file to CSharp classes  
```"C:\Program Files (x86)\Microsoft SDKs\Windows\v8.1A\bin\NETFX 4.5.1 Tools\xsd.exe" /classes /language:CS your.xsd```

## 2017 January 10
SQL Server Select random samples from a large amount of data
```SQL
USE [Database]
SELECT *
FROM [Schema].[Table]
TABLESAMPLE (100 ROWS)
WHERE Condition like '%filter%'
```

To transfer data from UUID(or GUID) table to IntegerID table, and keep the relationship between data was the requirement.  
As I learn more, I find ways to improve past code from 2016 November 14.  
Now to elaborate more on that topic, I wrote a newer psudocode for generic example.  
```SQL
GO
ALTER TABLE [OldDatabase].[OldSchema].[OldTable]
ADD [IntegerId] INT IDENTITY
```
First I would add an incremental integer ID to each old database table.    
Then:  
```SQL
SET IDENTITY_INSERT [NewDatabase].[NewSchema].[NewTable] ON 
-- Since new table was designed with conventional practice, its primary key is identity
-- Therefore to keep the data the same, I will wipe out the new destination database as I transfer the data
-- If current data in the destination database need to be kept, I would have used a different approach.
INSERT INTO [NewDatabase].[NewSchema].[NewTable]
	([PrimaryKeyId]
	,[OtherTableIntegerId]
	,[SomeDetails]
	,[IntType]
	)
SELECT
	tableA.[IntegerId] AS [PrimaryKeyId]
	,tableB.[IntegerId] AS [OtherTableItegerId]
	,[SomeDetails]
	,CASE
	  WHEN tableA.[BooleanType] = 'True' THEN 1
	  WHEN tableA.[BooleanType] = 'False' THEN 2
	 END
FROM [TABLE] tableA
LEFT JOIN [TABLE] tableB ON tableA.[UUID] = tableB.[UUID]
GO
SET IDENTITY_INSERT [NewDatabase].[NewSchema].[NewTable] OFF
```

### 2016 December 5  
SQL Server Update PostalCode to Uppercase  

```SQL
USE [Database]
  UPDATE [Schema].[Table]
  SET PostalCode = UPPER(PostalCode)
  WHERE  PostalCode != UPPER(PostalCode)
COLLATE Latin1_General_CS_AS
```

### 2016 November 25
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
#### SQL Server Reduce Log File to reduce backup size
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
### 2016 November 14
#### SQL Server Database Stuff  
Transfer data from UUID to Integer ID  
First create a column for the old table that is Integer and Identity so it is increamental.  
Then
```SQL
SELECT  
b.[IntegerID] AS [UUIDsColumn]
FROM [TABLE] tableA
LEFT JOIN [TABLE] tableB ON tableA.[UUID] = tableB.[UUID]
```
Well that was pseudo code but I guess it can help me remember what I did today.  

### 2016 Semptember 23
#### How to remove PDF watermark
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

### 2016 September 16
Responsive images with user experience imrpoved by showing detail image if screen size is less than 500px.  
```HTML
	<picture>
		<source srcset="./images/skyline_cropped.jpg" media="(max-width: 500px)">
		<img src="./images/skyline_compressed.jpg">
	</picture>
	<img src="./images/skyline_compressed.jpg">
```
### 2016 August 26
Love Markdown now more than ever! Saves so much time and now only types meaningful things and never feel boring to adjust little things that purely waste time again.  
Find out an online Markdown to HTML editor that is pretty convenient for quick HTML.  
http://dillinger.io/  
Find out how to reset SQL Server database Id and content
```sql
TRUNCATE TABLE   
[Database].[Schema].[Table]
```
  
### 2016 August 24
Find out how to reset SQL Server database Id  
```sql
DBCC CHECKIDENT ('[Table]', RESEED, 0);
GO
```
  
### 2016 July 11  
Think about SQL Query and Object-relational mapping (ORM)  
Windows Schedule Tasks run batch file need further investigation, appeareantly if just run .bat file it might run with a notepad.

### 2016 June 30  
when net user in CMD does not work, **netplwiz** is a pretty good alternative  
discovered that Windows10 Privacy terms are disgusting https://privacy.microsoft.com/en-us/privacystatement/  
starts to write goals and things to keep in mind everyday  

### 2016 May 20  
Database normalization - minimize data redundancy, refactor the database to increase efficiency  

### 2016 May 10  
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
