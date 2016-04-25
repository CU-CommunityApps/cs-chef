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
