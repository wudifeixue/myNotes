:Loop
::Insert what you need to run minecraft
java -Xms2G -Xmx4G -jar server.jar nogui
::Server Script complete
echo Server will restart in 10 seconds......
timeout 10
echo Restarting......
goto Loop



::while true
::do
::java -Xms2G -Xmx4G -jar server.jar nogui
::echo "Server will restart in 10 seconds......"
::sleep 10
::echo "Restarting......"
::done


::bash for linux is very simliar so remove the comment to use on Linux
