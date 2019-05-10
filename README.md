Just launch run.sh, it will deploy a basic instance of OSRM container in localhost:5000
Edit the script and relaunch it if port change is needed

Script run.sh checks if the serv exists, and if not, creates it (see the bash file, multiple docker runs with directory data creation). When container is ready, YOU DO NOT WANT TO DELETE THE DATA DIRECTORY, unless you love to wait for a looooong time for OSRM server recreation. So, basically, stuff is stored in data directory

BTW : If something goes wrong, delete the data directory, and run run.sh
if it doesn't work after that, well... ¯\_( '-' )_/¯