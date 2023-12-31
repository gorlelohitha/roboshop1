cp user.service /etc/systemd/system/user.service
cp mongo.repo /ect/yum.repos.d/mongo.repo
dnf module disable nodejs -y
dnf module enable nodejs:18 -y
dnf install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
cd /app
npm install
dnf install mongodb-org-shell -y
mongo --host mongodb.devopsb17.online </app/schema/user.js
systemctl daemon-reload


systemctl enable user
systemctl restart user
