# Setting PMM
ansible-playbook provision/playbook_pmm.yml

# Setting MongoDB
ansible-playbook provision/playbooks/playbook_mongo.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key

# Setting MySQL
ansible-playbook provision/playbooks/playbook_mysql.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key

# Setting Postgres
ansible-playbook provision/playbooks/playbook_postgres.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key

# Setting App Server
ansible-playbook provision/playbooks/playbook_extra.yml -i provision/hosts  --key-file /root/.vagrant.d/insecure_private_key
