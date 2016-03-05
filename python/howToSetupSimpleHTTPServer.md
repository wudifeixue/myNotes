## How To Setup a Simple HTTP web server on Python  
There are times where a simple web server needs to be setup ASAP and you don't want to install things like,  
IIS, Apache, or Nginx, etc.  
Then this simple Python web server will be perfect for you. It can quickly share files between different OS,  
or test a simple HTML site. 

#### Before you start, you will need Python 2, or Python 3 installed  
If you do not have Python installed, Download Python [HERE](https://www.python.org/downloads/)  

#### Once you have Python installed and ready to go, follow the following instructions
###### Setup on python 2 or python 3 will be a bit different  

* **On Python 2**  
 * Mac or Linux  
 Open terminal  
 Then locate to where you want the web server to start  
 For example I will go to Desktop
 ```
 cd Desktop
 ```
then simply type:  
 ```
 python -m SimpleHTTPServer 8080  
 ```
That's it, I have setup a Simple HTTP web server on port 8080.  
If you want to let this webserver work outside of local network.  
```
python -m SimpleHTTPServer 80 --bind 0.0.0.0  
```
Would be a simple solution.  

 * On Windows  
 Open command prompt. (cmd.exe)  
 In windows URL to python probably will need to be specified.  
 for example:  
 ```
 c:\python27\python.exe -m SimpleHTTPServer 8080  
 ```
* **On Python 3**  
Thing will be similar to python 2 except that SimpleHTTPServer will be http.server  
```
python -m http.server 8000 --bind 127.0.0.1
```  
In python 3.4 the bind argument is introduced.
