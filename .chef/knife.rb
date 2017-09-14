# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "svc_chef"
client_key               "#{current_dir}/svc_chef.pem"
chef_server_url          "https://ip-172-31-22-100.us-west-1.compute.internal/organizations/kemi"
cookbook_path            ["#{current_dir}/../cookbooks"]
