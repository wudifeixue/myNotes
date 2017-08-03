# Some C# basic exercises I did
### If you are reading this, thank you for checking my code, I hope this would be useful for you.  
I will try my best to comment and use the best practices I am aware of.  
I know from the start that my code can be imrpoved much better.  
Please feel free to comment, open an issue or pull request to the solutions I provide here.  

---
## Exercise 1: Write C# code to declare a variable to store the age of a person. Then the output of the program is as an example shown below:
You are 20 years old.  
### Solution 1:
```C#
using System;

namespace Exercise
{
    class Program
    {
        static void Main(string[] args)
        {
            int age = 20;
            // uses string interpolations in C# 6 to WriteLine since it is easier to type.
            Console.WriteLine($"You are {age} years old.");
            // You are 20 years old.
        }
    }
}
```
---
## Exercise 2: Write C# code to display the asterisk pattern as shown below:
```
*****
*****
*****
*****
*****
```
### Solution 2:
```C#
using System;

namespace Exercise
{
    class Program
    {
        static void Main(string[] args)
        {
            // declare constant variables to make nested for loop easier to read
            const int ROWS = 5;
            const int COLUMNS = 5;
            // for each row print number of * on the line with Write, then WriteLine to skip line
            for (int i = 0; i < ROWS; i++)
            {
                for (int j = 0; j < COLUMNS; j++)
                {
                    Console.Write("*");
                }
                Console.WriteLine("");
            }
        }
    }
}
```
---
## Exercise 3: Write C# code to declare two integer variables, one float variable, and one string variable and assign 10, 12.5, and "C# programming" to them respectively. Then display their values on the screen.

### Solution 3:
```C#
using System;

namespace Exercise
{
    class Program
    {
        static void Main(string[] args)
        {
            // declare variables and assign them
            int Integer;
            float floatNumber;
            string str;

            Integer = 10;
            floatNumber = 12.5f;
            str = "C # programming";

            // print the message with a 
            Console.WriteLine("Integer: {0}, float: {1}, string: {2}", Integer, floatNumber, str);
            // Integer: 10, float: 12.5, string: C # programming
        }
    }
}
```
---
## Exercise 4: Write C# code to prompt a user to input his/her name and then the output will be shown as an example below:
Hello John!  
### Solution 4:
```C#
using System;

namespace Exercise
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Please enter your name: ");
            string name = Console.ReadLine();
            Console.WriteLine("Hello " + name + "!");
        }
    }
}
/*
This code example produces the following results:

Please enter your name: Curtis
Hello Curtis!

*/
```
