cp mongo.repo /etc/yum.repo.d/mongo.repo

dnf install mongodb-org -y
# update listen address 127.0.0.1 to 0.0.0.0
 systemctl enable mongod
 systemctl restart mongod



