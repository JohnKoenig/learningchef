#
# Cookbook:: bind
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
#
execute 'linux update' do
	command 'yum -y update'
	command 'yum -y install bind-chroot'
	command 'yum -y install bind-utils'
end

package 'bind-chroot' do
	package_name 'named-chroot'
	action :install
end

execute 'named-chroot setup' do
	command '/usr/libexec/setup-named-chroot.sh /var/named/chroot on'
end

service 'bind' do
        service_name 'bind'
        action [:stop, :disable]
end

service 'dns' do
        service_name 'named-chroot'
        action [:start, :enable]
end

execute 'initiate files' do
	command 'touch /var/named/chroot/var/named/data/cache_dump.db'
	command 'touch /var/named/chroot/var/named/data/named_stats.txt'
	command 'touch /var/named/chroot/var/named/data/named_mem_stats.txt'
	command 'touch /var/named/chroot/var/named/data/named.run'
end

directory '/var/named/chroot/var/named/data/' do
	action :create
	mode '0760'
	owner 'named'
	group 'named'
end

directory '/var/named/chroot/var/named/dynamic' do
	action :create
	mode '0760'
	owner 'named'
	group 'named'
end

#file '/var/named/chroot/var/named/data/kemi.com.db' do
        #create /var/named/chroot/var/named/data/reversezones.db
#end

#file '/var/named/chroot/var/named/data/10.1.10.db' do
        #create /var/named/chroot/var/named/data/10.1.10.db
#end

#file '/var/named/chroot/var/named/data/10.1.20.db' do
	#create /var/named/chroot/var/named/data/10.1.20.db
#end

#file '/var/named/chroot/var/named.config' do # /etc/named.config
	#content 'something'
#end

#file '/etc/resolv.conf' do
        #content 'something'
#end
