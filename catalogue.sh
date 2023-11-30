echo -e "\e[32m>>>>>>>>>>>>>>>> Create Catalogue Service <<<<<<<<<<<<\e[om"
cp catalogue.service /etc/systemd/system/catalogue.service >tmp/roboshop1
echo -e "\e[32m>>>>>>>>>>>>>>>> Create Mongodb Repo <<<<<<<<<<<<\e[om"
cp mongo.repo /etc/yum.repos.d/mongo.repo >tmp/roboshop1
echo "\e[32m>>>>>>>>>>>>>>>> Download nodejs <<<<<<<<<<<<\e[om"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash >tmp/roboshop1
echo -e "\e[32m>>>>>>>>>>>>>>>> Install nodejs Repos <<<<<<<<<<<<\e[om"
dnf install nodejs -y >tmp/roboshop1
echo  -e "\e[32m>>>>>>>>>>>>>>>> Create Application user <<<<<<<<<<<<\e[om"
useradd roboshop >tmp/roboshop1
echo  -e "\e[32m>>>>>>>>>>>>>>>> Remove unwanted <<<<<<<<<<<<\e[om"
rm -rf /app >tmp/roboshop1
echo -e "\e[32m>>>>>>>>>>>>>>>> Create Application directory <<<<<<<<<<<<\e[om"
mkdir /app >tmp/roboshop
echo  -e "\e[32m>>>>>>>>>>>>>>>>> download Application directory <<<<<<<<<<<<\e[om"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip >tmp/roboshop1
echo -e  "\e[32>>>>>>>>>>>>>>>> Extract Application Content <<<<<<<<<<<<\e[om"
cd /app >tmp/roboshop1
unzip /tmp/catalogue.zip >tmp/roboshop
cd /app >tmp/roboshop1

echo -e "\e[32>>>>>>>>>>>>>>>> Download Nodejs dependency <<<<<<<<<<<<\e[om"

npm install >tmp/roboshop1
echo -e "\e[32>>>>>>>>>>>>>>>> Install Mongo Client <<<<<<<<<<<<\e[om"
dnf install mongodb-org-shell -y >tmp/roboshop1
echo -e "\e[32>>>>>>>>>>>>>>>> Load Catalogue Schema  <<<<<<<<<<<<\e[om"
mongo --host mongodb.devopsb17.online </app/schema/catalogue.js>tmp/roboshop1
echo -e "\e[32>>>>>>>>>>>>>>>> Start Catalogue Server <<<<<<<<<<<<\e[om"
systemctl daemon-reload>tmp/roboshop1


systemctl enable catalogue >tmp/roboshop1
systemctl restart catalogue >tmp/roboshop1


