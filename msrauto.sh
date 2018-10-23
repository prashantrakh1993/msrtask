#script for automation of git process
cd /home/ubuntu/msrtask
git pull 
echo "$(date)-todays data  updated"

#making docker-compose up

cd /home/ubuntu/webapp
docker-compose up


