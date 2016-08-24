#安装并开启PokemonGo实时地图方法  

首先安装**Python 2.7** 是的只支持2.7  
去https://www.python.org/downloads/ 选择适合你的系统的Python  
然后去PokemonGo-Map/releases[下载](https://github.com/PokemonGoMap/PokemonGo-Map/releases) PokemonGo-Map最新安装包  

解压后Windows用户可以直接进入Easy Setup文件夹  
双击里面的setup.bat即可安装pip（Python的库管理器）以及地图服务器  
安装成功后即可开启服务器

##手动开启服务器的命令如下  
python example.py -a ptc使用TrainerClub账号 -u 用户名 -p 密码 -l "地址或经度纬度" -st 10 -ds -dg  
替换-a ptc成为-a google是使用Google账号  

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
[http://localhost:5000](http://localhost:5000)  
即可看到你输入的地址附近的所有精灵，补给站和道馆了  

-------------------------------------------
#高级命令详细应用与解释
###下面是一段英文的原版解释和使用方法，我讲一一作出中文对应的解释和使用  
```shell
$ python example.py -a ptc -u * -p * -l "21.288476, -157.709944" -dg -ds -st 11
usage: example.py [-h] [-a AUTH_SERVICE] -u USERNAME [-p PASSWORD] -l
                    LOCATION -st STEP_LIMIT [-i IGNORE | -o ONLY]
                    [-ar AUTO_REFRESH] [-dp] [-dl] [-dg] [-H HOST] [-P PORT]
                    [-L LOCALE] [-c] [-d] [-m] [-k GMAPS_KEY]
example.py: error: argument -d/--debug: ignored explicit argument 's'
```
##详细参数设置  
**python example.py的后缀参数说明**  
* -a是登陆方式 这里采用的-a ptc是Pokemon Club的账号，也可以换成-a google来使用Google账号登陆
* -u是用户名 
* -p是密码
* 括号里面 "填写地址" 例如："Calgary, AB" ，也可以填写经度和纬度 "51.0486, 114.0708"
* -st 10是范围（越大刷新越慢）
* -i忽略小精灵（可以输入名字或者编号） 例如：-i 13,36,weedle,等
* -o是只显示哪些小精灵
* -ar是自动刷新浏览器（单位秒）
* -ds是显示补给点 
* -dg是显示道馆 
* -H 是HOST IP地址外网用0.0.0.0即可，也可以针对域名绑定，例如wiki.wa2.info
* -P是端口号默认是localhost:5000的这个5000可以在不更改example.py里面在这里设置参数。-H绑定好域名还可以多个80端口
* -L是本地语言，现在有四个语言可以输入-L zh_cn切换中文输入-L en切换英文也可以在example.py设置
* -c是坐标转换中国
* -m是mock数据
* -d是debug模式


-------------------------------------------
##如何更改API成新的Google Maps JavaScript API  
用记事本（notepad)或者notepad++等编辑器打开credentials.json  
###credentials.json源码：  
{  
	"ptc_client_secret"	: "w8ScCUXJQc6kXKw8FiOhd8Fixzht18Dq3PEVkUCP5ZPxtgyWsbTvWHFLm2wNY0JR",  
	"android_id"		: "9774d56d682e549c",  
	"service"			:   "audience:server:client_id:848232511240-7so421jotr2609rmqakceuu1luuq0ptb.apps.googleusercontent.com",  
	"client_sig"		: "321187995bc7cdc2b5fc91b11a96e2baa8602c62",  
	"gmaps_key"			: "AIzaSyCsWm4TULH3DL6iatLcgfowKGwTFrPlEtw"  
}  
  
**在Credentials.json**里面替换掉**gmaps_key**后面的**AIzaSyCsWm4TULH3DL6iatLcgfowKGwTFrPlEtw**  
成为你的[Google Maps JavaScript API](https://console.developers.google.com/flows/enableapi?apiid=maps_backend,geocoding_backend,directions_backend,distance_matrix_backend,elevation_backend,places_backend&keyType=CLIENT_SIDE&reusekey=true)  
如果你没有的话就替换成我的API（如果太多人用可能会超流量）：__AIzaSyCsWm4TULH3DL6iatLcgfowKGwTFrPlEtw__  

##---API申请教程预留位置---  
[点击申请你自己的Google Maps API](https://console.developers.google.com/flows/enableapi?apiid=maps_backend,geocoding_backend,directions_backend,distance_matrix_backend,elevation_backend,places_backend&keyType=CLIENT_SIDE&reusekey=true "Google Maps JavaScript API")  

#English Guide Review Wiki  
https://github.com/PokemonGoMap/PokemonGo-Map/  
