# spinning VMS
vagrant up

# Setting PMM
ansible-playbook provision/playbook_pmm.yml

# Setting MongoDB
ansible-playbook provision/playbook_mongo.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key

# Setting MySQL
ansible-playbook provision/playbook_mysql.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key

# Setting Postgres
ansible-playbook provision/playbook_postgres.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key

# Setting App Server
ansible-playbook provision/playbook_extra.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key
