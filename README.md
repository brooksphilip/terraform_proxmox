### Creating an RKE2 Cluster in Proxmox

Fill in the <variables> in main.tf and ansible_terraform.yml

init terraform 
```bash
terraform init
```

Run Ansible to start the terraform

```bash
ansible-playbook ansible_terraform.yml
```

NOTE***

ssh user must have passwordless auth and passwordless sudo. 

cloud-init template must already be created

terraform does not create the cloud-init