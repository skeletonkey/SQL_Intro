# SQL Intro
Small repo for instructions and documentation about an introduction to SQL.

Following these steps will run and setup a Docker container running MySQL with a sample database.  It's a sandbox - so experiment and enjoy.  If you destroy it beyond use simply stop the container and start over.

Enjoy!

Slides available via [Slide Share](https://www.slideshare.net/ErikTank/sql-why-little-bobby-tables-is-funny)

# Requirements
* Docker

## Optional Requirments
* album_data.sql
  * this file sets up the 'music' database

# Starting Your MySQL Sandbox
## Start DB Server
*Important*: __These steps need to be followed completely!__

It is assumed that these commands are run in the same directory as this repo.
Run the mysql docker container in 'daemon' mode:

```
docker run --rm --name sql_intro --network host -d mysql/mysql-server
```

Now you have a local running MySQL server.  As long as this runs anything you do in the DB will persist.  Once you stop this container everything will be lost.

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

```
docker exec -it sql_intro mysql -u root -ptemp123!
```

Using your favorite editor open the file `album_data.sql`.  Copy the entire file and simply paste it into the MySQL CLI that you start above.

Congratulations!  You now have a database.

Either start a new connection to the database as described below in `Connect to the DB Server`

## Connect to the DB Server
```
docker exec -it sql_intro mysql -u root -ptemp123! music
```

_Remember_: Data will only persist as long as you don't stop the server by turning off Docker or running: `docker stop sql_intro`

# Resources
* Slide Template: [https://www.slidescarnival.com/kate-free-presentation-template/3530](https://www.slidescarnival.com/kate-free-presentation-template/3530)
