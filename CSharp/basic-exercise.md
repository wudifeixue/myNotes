# Some C# basic exercises I did
### If you are reading this, thank you for checking my code, I hope this would be useful for you.  
I will try my best to comment and use the best practices I am aware of.  
I know from the start that my code can be imrpoved much better.  
Please feel free to comment, open an issue or pull request to the solutions I provide here.  

---
## Exercise 1: Write C# code to declare a variable to store the age of a person. Then the output of the program is as an example shown below:
You are 20 years old.  
### Solution:
```C#
using System;

namespace Exercise
{
    class Program
    {
        static void Main(string[] args)
        {
            int age = 20;

            Console.WriteLine($"You are {age} years old.");
        }
    }
}
```
