log=/tmp/roboshop.log

echo -e "\e[32m>>>>>>>>>>>>>>>> Create Catalogue Service <<<<<<<<<<<<\e[om"
cp catalogue.service /etc/systemd/system/catalogue.service &>>${log}
echo -e "\e[32m>>>>>>>>>>>>>>>> Create Mongodb Repo <<<<<<<<<<<<\e[om"
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>${log}
echo "\e[32m>>>>>>>>>>>>>>>> Download nodejs <<<<<<<<<<<<\e[om"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${log}
echo -e "\e[32m>>>>>>>>>>>>>>>> Install nodejs Repos <<<<<<<<<<<<\e[om"
dnf install nodejs -y &>>${log}
echo  -e "\e[32m>>>>>>>>>>>>>>>> Create Application user <<<<<<<<<<<<\e[om"
useradd roboshop &>>${log}
echo  -e "\e[32m>>>>>>>>>>>>>>>> Remove unwanted <<<<<<<<<<<<\e[om"
rm -rf /app &>>${log}
echo -e "\e[32m>>>>>>>>>>>>>>>> Create Application directory <<<<<<<<<<<<\e[om"
mkdir /app >/tmp/roboshop
echo  -e "\e[32m>>>>>>>>>>>>>>>>> download Application directory <<<<<<<<<<<<\e[om"
curl -o //tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>${log}
echo -e  "\e[32>>>>>>>>>>>>>>>> Extract Application Content <<<<<<<<<<<<\e[om"
cd /app &>>${log}
unzip //tmp/catalogue.zip >/tmp/roboshop
cd /app &>>${log}

echo -e "\e[32>>>>>>>>>>>>>>>> Download Nodejs dependency <<<<<<<<<<<<\e[om"

npm install &>>${log}
echo -e "\e[32>>>>>>>>>>>>>>>> Install Mongo Client <<<<<<<<<<<<\e[om"
dnf install mongodb-org-shell -y &>>${log}
echo -e "\e[32>>>>>>>>>>>>>>>> Load Catalogue Schema  <<<<<<<<<<<<\e[om"
mongo --host mongodb.devopsb17.online </app/schema/catalogue.js&>>${log}
echo -e "\e[32>>>>>>>>>>>>>>>> Start Catalogue Server <<<<<<<<<<<<\e[om"
systemctl daemon-reload&>>${log}


systemctl enable catalogue &>>${log}
systemctl restart catalogue &>>${log}


