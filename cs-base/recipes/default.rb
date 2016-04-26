#
# Cookbook Name:: cs-base
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package 'docker' do
  action :install
end

service 'docker' do
  action :start
end

docker_registry 'https://docker.cucloud.net/' do
  username node['dtr']['user']
  password node['dtr']['password']
  email ''
end

docker_registry 'https://dtr.cucloud.net/' do
  username node['dtr']['user']
  password node['dtr']['password']
  email ''
end

remote_file '/tmp/amazon-ssm-agent.deb' do
  source 'https://amazon-ssm-us-east-1.s3.amazonaws.com/latest/debian_amd64/amazon-ssm-agent.deb'
  action :create
end

dpkg_package 'ssm-agent' do
  source '/tmp/amazon-ssm-agent.deb'
end

file '/tmp/amazon-ssm-agent.deb' do
  action :delete
end
