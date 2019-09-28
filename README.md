
#SLQ Intro
Small repo for instructions and documentation about an introduction to SQL.

#Requirements
* Docker

##Optional Requirments
* album_data.sql
  * this file sets up the 'music' database

#Starting Your MySQL Sandbox
## Start DB Server
*Important*: __These steps need to followed completely!__

Run the mysql docker container in 'daemon' mode:

```
docker run --rm --name sql_intro --network host -d mysql/mysql-server
```

Now you have a local running MySQL server.  As long as this runs anything you do in the DB will persist.  Once you've stop this container everything will be lost.

```
# Find the root password (this may take a minute before the info is in the logs)
docker logs sql_intro 2>&1 | grep GENERATED

# Start your client - you'll be prompted for the root password you found above
docker exec -it sql_intro mysql -u root -p
```
Once logged in you'll need to change the root password:

```
ALTER USER root@localhost IDENTIFIED BY 'temp123!';
```

## Load the 'music' DB
Once the DB has been started and root password has been changed (steps above). Run the following to create the music DB.
__This command needs to be run from the directory containing this repo__

```
docker exec -it sql_intro mysql -u root -ptemp123! music < 
```


Once logged into the CLI (follow above steps) open the file album_data.sql and past everything 

Once you are at the CLI then you can paste in the contents of album_data.sql to create and populate the 'artist' data.  Use `\u music` when this is done to 'use' (or switch to) the music database.

Data will persis as long as you don't stop the server by turning off Docker or running: `docker stop sql_intro`

#Resources
* Slide Template: [https://www.slidescarnival.com/kate-free-presentation-template/3530](https://www.slidescarnival.com/kate-free-presentation-template/3530)