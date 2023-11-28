echo -e "\e[32m>>>>>>>>>>>>>>>> Create Catalogue Service <<<<<<<<<<<<\e[om"
cp catalogue.service /etc/systemd/system/catalogue.service
echo-e "\e[32m>>>>>>>>>>>>>>>> Create Mongodb Repo <<<<<<<<<<<<\e[om"
cp mongo.repo /etc/yum.repos.d/mongo.repo
echo "\e[32m>>>>>>>>>>>>>>>> Download nodejs <<<<<<<<<<<<\e[om"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo "\e[32m>>>>>>>>>>>>>>>> Install nodejs Repos <<<<<<<<<<<<\e[om"
dnf install nodejs -y
echo "\e[32m>>>>>>>>>>>>>>>> Create Application user <<<<<<<<<<<<\e[om"
useradd roboshop
echo "\e[32m>>>>>>>>>>>>>>>> Remove unwanted <<<<<<<<<<<<\e[om"
rm -rf /app
echo "\e[32m>>>>>>>>>>>>>>>> Create Application directory <<<<<<<<<<<<\e[om"
mkdir /app
echo "\e[32m>>>>>>>>>>>>>>>>> download Application directory <<<<<<<<<<<<\e[om"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip >tmp/roboshop.log
echo "\e[32>>>>>>>>>>>>>>>> Extract Application Content <<<<<<<<<<<<\e[om"
cd /app
unzip /tmp/catalogue.zip >tmp/roboshop.log
cd /app

echo "\e[32>>>>>>>>>>>>>>>> Download Nodejs dependency <<<<<<<<<<<<\e[om"

npm install
echo "\e[32>>>>>>>>>>>>>>>> Install Mongo Client <<<<<<<<<<<<\e[om"
dnf install mongodb-org-shell -y
echo "\e[32>>>>>>>>>>>>>>>> Load Catalogue Schema  <<<<<<<<<<<<\e[om"
mongo --host mongodb.devopsb17.online </app/schema/catalogue.js
echo "\e[32>>>>>>>>>>>>>>>> Start Catalogue Server <<<<<<<<<<<<\e[om"
systemctl daemon-reload


systemctl enable catalogue
systemctl restart catalogue


