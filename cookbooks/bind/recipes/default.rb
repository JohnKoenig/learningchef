#
# Cookbook:: bind
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
#
yum -y update

package 'bind-chroot' do
	package_name 'named-chroot'
	action :install
end

yum -y install bind-chroot
yum -y install bind-utils

#/usr/libexec/setup-named-chroot.sh /var/named/chroot on

#systemctl stop named
#systemctl disable named

service 'bind' do
        service_name 'bind'
        action [:stop, :disable]
end

#systemctl start named-chroot
#systemctl enable named-chroot

service 'dns' do
        service_name 'named-chroot'
        action [:start, :enable]
end

#touch /var/named/chroot/var/named/data/cache_dump.db
#touch /var/named/chroot/var/named/data/named_stats.txt
#touch /var/named/chroot/var/named/data/named_mem_stats.txt
#touch /var/named/chroot/var/named/data/named.run

execute 'initiate files' do
	command 'touch /var/named/chroot/var/named/data/cache_dump.db'
	command 'touch /var/named/chroot/var/named/data/named_stats.txt'
	command 'touch /var/named/chroot/var/named/data/named_mem_stats.txt'
	command 'touch /var/named/chroot/var/named/data/named.run'
end

#chown named.named /var/named/chroot/var/named/data/ -R
#chmod -R 760 /var/named/chroot/var/named/data

directory '/var/named/chroot/var/named/data/' do
	action :create
	mode '0760'
	owner 'named'
	group 'named'
end


#chmod -R 760 /var/named/chroot/var/named/dynamic

directory '/var/named/chroot/var/named/dynamic' do
	action :create
	mode '0760'
	owner 'named'
	group 'named'
end


#create /var/named/chroot/var/named/data/kemi.com.db

file '/var/named/chroot/var/named/data/kemi.com.db' do
        #create /var/named/chroot/var/named/data/reversezones.db
end

file '/var/named/chroot/var/named/data/10.1.10.db' do
        #create /var/named/chroot/var/named/data/10.1.10.db
end

file '/var/named/chroot/var/named/data/10.1.20.db' do
	#create /var/named/chroot/var/named/data/10.1.20.db
end

file '/var/named/chroot/var/named.config' do # /etc/named.config
	#content 'something'
end

#vim /etc/resolv.conf (update search namespace and nameservers)

file '/etc/resolv.conf' do
        #content 'something'
end
