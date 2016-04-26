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

if node[:platform_family].include?("debian")
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
else
  remote_file '/tmp/amazon-ssm-agent.rpm' do
    source 'https://amazon-ssm-us-east-1.s3.amazonaws.com/latest/linux_amd64/amazon-ssm-agent.rpm'
    action :create
  end

  rpm_package 'ssm-agent' do
    source '/tmp/amazon-ssm-agent.rpm'
  end

  file '/tmp/amazon-ssm-agent.rpm' do
    action :delete
  end
end
