# spinning VMS
vagrant up

# Setting PMM
nohup ansible-playbook provision/playbook_pmm.yml &

# Setting MongoDB
nohup ansible-playbook provision/playbook_mongo.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key &

# Setting MySQL
nohup ansible-playbook provision/playbook_mysql.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key &

# Setting Postgres
nohup ansible-playbook provision/playbook_postgres.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key &

# Setting App Server
# Sleeping a few minutes to wait for MySQL and Postgres get ready
sleep 720;
ansible-playbook provision/playbook_extra.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key
