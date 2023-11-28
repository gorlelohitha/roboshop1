cp catalogue.service /etc/systemd/system/catalogue.service
cp mongo.repo /ect/yum.repos.d/mongo.repo
dnf module disable nodejs -y
dnf module enable nodejs:18 -y
dnf install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install
dnf install mongodb-org-shell -y
mongo --host mongo.devopsb17.online </app/schema/catalogue.js
systemctl daemon-reload


systemctl enable catalogue
systemctl restart catalogue


