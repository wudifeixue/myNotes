:Loop
::Insert what you need to run minecraft
java -Xms2G -Xmx4G -jar server.jar nogui
::Server Script complete
echo Server will restart in 10 seconds......
timeout 10
echo Restarting......
goto Loop
