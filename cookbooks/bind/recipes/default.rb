#
# Cookbook:: bind
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
package 'dns' do
	package_name 'bind'
	action :install
end

service 'dns' do
	service_name 'named'
	action [:start, :enable]
end
