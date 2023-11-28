echo ">>>>>>>>>>>>>>>> Create Catalogue Service <<<<<<<<<<<<"
cp catalogue.service /etc/systemd/system/catalogue.service
echo ">>>>>>>>>>>>>>>> Create Mongodb Repo <<<<<<<<<<<<"
cp mongo.repo /etc/yum.repos.d/mongo.repo
echo ">>>>>>>>>>>>>>>> Download nodejs <<<<<<<<<<<<"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo ">>>>>>>>>>>>>>>> Install nodejs Repos <<<<<<<<<<<<"
dnf install nodejs -y
echo ">>>>>>>>>>>>>>>> Create Application user <<<<<<<<<<<<"
useradd roboshop
echo ">>>>>>>>>>>>>>>> Remove unwanted <<<<<<<<<<<<"
rm -rf /app
echo ">>>>>>>>>>>>>>>> Create Application directory <<<<<<<<<<<<"
mkdir /app
echo ">>>>>>>>>>>>>>>> download Application directory <<<<<<<<<<<<"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
echo ">>>>>>>>>>>>>>>> Extract Application Content <<<<<<<<<<<<"
cd /app
unzip /tmp/catalogue.zip
cd /app

echo ">>>>>>>>>>>>>>>> Download Nodejs dependency <<<<<<<<<<<<"

npm install
echo ">>>>>>>>>>>>>>>> Install Mongo Client <<<<<<<<<<<<"
dnf install mongodb-org-shell -y
echo ">>>>>>>>>>>>>>>> Load Catalogue Schema  <<<<<<<<<<<<"
mongo --host mongodb.devopsb17.online </app/schema/catalogue.js
echo ">>>>>>>>>>>>>>>> Start Catalogue Server <<<<<<<<<<<<"
systemctl daemon-reload


systemctl enable catalogue
systemctl restart catalogue


