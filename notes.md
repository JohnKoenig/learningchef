Do these commands:
On the node:
sudo vi /etc/ssh/sshd_config
PasswordAuthentication yes
sudo passwd user
sudo service sshd reload

knife bootstrap 1.2.3.4 -N ec2-1-2-3-4.us-west-1.compute.amazonaws.com -x user -P password --sudo


chef generate cookbook cookbooks/xyz
knife cookbook upload xyz
knife node run_list add ec2-1-2-3-4.us-west-1.compute.amazonaws.com 'recipe[xyz]'
knife node show ec2-1-2-3-4.us-west-1.compute.amazonaws.com


Other notes:
Knife search INDEX "key:search_pattern"
-INDEX = role, node, client, environment, or data bag
-Key = field name in JSON
-Example: Web_nodes = search('role', 'role:web')
-Example: knife search node 'platform_family:rhel'
-Example: knife search node 'recipes:apache\:\:default'
-- \: is the way to pass ":"
-Example: knife search '*:*' -r
-- Default role is Node. Will return all runlists

-Example:
knife search node 'platfor?:centos' -a hostname
1 items found

ec2-1-2-3-4.us-west-1.compute.amazonaws.com:
  hostname: ip-1-2-3-4

-Example: knife search "*:*" -a recipes


