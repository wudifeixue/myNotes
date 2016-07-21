#安装并开启PokemonGo实时地图方法  

首先安装**Python 2.7** 是的只支持2.7  
去https://www.python.org/downloads/ 选择适合你的系统的Python  
然后去https://github.com/AHAAAAAAA/PokemonGo-Map/archive/master.zip下载最新安装包  

群共享我也会提供，但是不见得最新（开源项目一直在更新）   
解压文件  
用记事本（notepad)或者notepad++等编辑器打开credentials.json  
更改API成新的Google Maps JavaScript API  
如果你没有的话就替换成我的API：  
AIzaSyCsWm4TULH3DL6iatLcgfowKGwTFrPlEtw  

源代码类似
{
	"ptc_client_secret"	: "w8ScCUXJQc6kXKw8FiOhd8Fixzht18Dq3PEVkUCP5ZPxtgyWsbTvWHFLm2wNY0JR",
	"android_id"		: "9774d56d682e549c",
	"service"			: "audience:server:client_id:848232511240-7so421jotr2609rmqakceuu1luuq0ptb.apps.googleusercontent.com",
	"client_sig"		: "321187995bc7cdc2b5fc91b11a96e2baa8602c62",
	"gmaps_key"			: "AIzaSyCsWm4TULH3DL6iatLcgfowKGwTFrPlEtw"
}
在Credentials.json里面替换掉gmaps_key后面的AIzaSyCsWm4TULH3DL6iatLcgfowKGwTFrPlEtw  

---API申请教程预留位置--- 

[点击申请你自己的Google Maps API](https://console.developers.google.com/flows/enableapi?apiid=maps_backend,geocoding_backend,directions_backend,distance_matrix_backend,elevation_backend,places_backend&keyType=CLIENT_SIDE&reusekey=true "Google Maps JavaScript API")

Windows用户可以直接进入Easy Setup文件夹  
双击里面的setup.bat即可安装地图  

开启服务器的简单代码写成run.bat  
run.bat代码如下  
```bat
python example.py -a ptc -u dyxgame -p 123456 -l "Calgary, AB" -st 10 -dp -dg
```
进入以后输入你需要的地址，上面账号已经包含在内  

##申请自己账号地址：  
[Pokemon Trainer Club账号申请](https://club.pokemon.com/us/pokemon-trainer-club/sign-up/)  
[Google账号申请](https://accounts.google.com)

##当服务器已经成功开启，你可以打开浏览器访问：  
http://localhost:5000  
即可看到你输入的地址附近的所有精灵，补给站和道馆了  

##手动开启服务器的命令如下  
python example.py -a ptc使用TrainerClub账号 -u 用户名 -p 密码 -l "地址或经度纬度" -st 10 -ds -dg  
替换-a ptc成为-a google是使用Google账号  

高级命令详细应用与解释
```
$ python example.py -a ptc -u * -p * -l "21.288476, -157.709944" -dg -ds -st 11
usage: example.py [-h] [-a AUTH_SERVICE] -u USERNAME [-p PASSWORD] -l
                    LOCATION -st STEP_LIMIT [-i IGNORE | -o ONLY]
                    [-ar AUTO_REFRESH] [-dp] [-dl] [-dg] [-H HOST] [-P PORT]
                    [-L LOCALE] [-c] [-d] [-m] [-k GMAPS_KEY]
example.py: error: argument -d/--debug: ignored explicit argument 's'
```
###高级命令解释
python example.py是开启程序，-a是登陆方式，这里采用的-a ptc是Pokemon Club的账号，也可以换成-a google来使用Google账号登陆  
-u是用户 -p是密码 “地址” -st 10是范围（越大刷新越慢）-i忽略（可以输入名字或者编号） -o是只显示列表（输入例子-i 13,36,weedle,等）   -ar是自动刷新浏览器（单位秒）-ds是显示补给点 -dg是显示道馆 -H 是HOST IP地址外网用0.0.0.0即可，也可以针对域名绑定，例如wiki.wa2.info
-P是端口绑定好域名即可多个80 -L是本地语言，现在有四个语言可以在LOCALE文件夹里面找 -c是坐标转换中国 -m是mock数据 -d是debug模式





#These are the the English original guide from Reddit, I am using them for my Chinese one right now as a reference.  
EDIT: Quick guide:
Download the zip file from github and unzip it.
Open Terminal.
Change the directory to the folder from github. (probably cd ~/Downloads/PokemonGo-Map-master)
pip install -r requirements.txt
python example.py -u myUsername -p myPassword -l "your location, worldwide "-st 10
go to http://localhost:5000
wait till it says completed 100% and it will show the map



Next you need to create a Pokemon Club account, which Can be done here (please note it will probably be unavailable a lot of the time, so refresh every 15 minutes or so if you can't get in). After that, download OP's program by clicking the green "Clone or Download" button on here and clicking "Download Zip." Once the file is downloaded, unpack the zip using your favorite utility, then open a command window or terminal to the unzipped files' location (in Windows, go into the folder where all the unzipped files are, hold shift and right click inside the explorer window and select "Open Command Window Here"). Inside this command window, enter the following:
pip install -r requirements.txt
When that's finished, enter:
python example.py -a ptc -u ****** -p ****** -l "Some Location" -st 10
Replace the asterisks with the username and password of your Pokemon Club account, KEEP THE -u AND -p, and replace "Some Location" with a real world place, like "Union Square, San Francisco" or latitude and longitude coordinates, like "40.7588951 -73.9873815". You can find your coordinates by going to Google maps, clicking in your approximate location, then reading the coordinates off the box that appears at the bottom of the page. The number after -st is the number of steps to take, basically your search distance, higher number = farther.
If you are opting to use a google account, replace ptc after -a with google, and make sure your username ends with @google.com (or @gmail.com in case I got that wrong)!
Open your browser and enter http://localhost:5000 into the URL bar, keep refreshing the page as the map loads, if your terminal / command window keeps saying "incorrect username/password" as this is happening, DO NOT PANIC! the servers are always busy and the script will continue to load the map as the servers are available



FAQ:
Q: My computer says Python is not recognized!
A: First, restart to make sure it wasn't because some changes weren't applied and try again.
if that doesn't fix it, open an explorer window and find your Python installation, it should either be in C:\Python27 or C:\Users\YOURUSERNAME\AppData\Programs\Python\Python27 (The python directories could be named differently depending on which version you installed, so don't just copy and paste!)
Once you find where python is, copy it down, then open cmd as an administrator and enter:
setx PATH "%PATH%;PATH TO YOUR PYTHON INSTALLATION"
and replace PATH TO YOUR PYTHON INSTALLATION with the actual path to where pip is, including your drive letter and everything. You'll probably need to log out and log back in or restart for the changes to take effect.
If this still doesn't work, use C:\Python27\python in place of python
Q: My computer says pip is not recognized!
A: Same as above, but add "\Scripts" onto the end of the file path to look for
If it still doesn't work, use C:\Python27\Scripts\pip in place of pip
Q: Help! It says example.py is not found!
A: Make sure when you open the command window you are inside the actual folder where the stuff you unpacked is. Sometimes it's in a folder within a folder.
Q: I got a UnicodeDecodeError! What do!?
A: According to some users, this is either due to having symbols in your password (not letters or numbers) or having numbers at the beginning of your username. Either change your password or create a new Pokemon Club account to fix this
Q: I got an error that says e is undefined! / Syntax error!
A: Make sure you have Python 2.7 installed, you can check your version by entering python -V (CAPITAL V) into a command window. If necessary, you can uninstall Python 3 using add or remove programs then install Python 2.7. If you just want a workaround, open example.py, find the line where the error is, and change whatever it is to either except Exception as e: or except: (this may break some error reporting, but it'll run good enough)
If you see NameError telling you 'long' is undefined, replace long with int
At this point you're probably going too far to fix compatibility issues, you should give up and use Python 2 instead of Python 3 like a sane programmer would.
as /u/regendo pointed out, it's probably best to leave Python 3 where it is if you have it installed and work around it, see their comment for details
Q: Help! There's an ASCII error when I run this!
A: Make sure the script is in a location where all the folders leading up to it only have alphanumeric characters, no é's and no ü's or any special letters like that
Q: I'm getting some other weird error not listed here!
A: This script is being continually developed with new features from many different users, inevitably, stuff will break and bugs will be introduced. Report the issue somewhere, and go back to using a previous version if you have one saved (I highly suggest making back-ups of any versions you find work well for you)
And contact the devs on Discord or Github if you need more support
Alright, I'm tired, that's enough playing tech support for today.
