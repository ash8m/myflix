# myflix
an minimal implementation of netflix

To run jenkins, make sure the AWS credentials are available as env variables or in ~/.aws/credentials
Run the terraform script by using terrafrom init, terraform plan and terraform apply -auto-approve commands
Then run the ansible script update the hosts file with the IP and the location of the ssh key and then run ansible-playbook -i hosts playbook.yaml 
Add the following to ~/.ansible.cfg to avoid ssh security prompt when connecting to a remote host for the first time
[defaults]
host_key_checking = False

