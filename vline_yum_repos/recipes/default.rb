#
# Cookbook Name:: vline_yum_repos
# Recipe:: default
#
# Copyright (C) 2014 Airtime
#
# All rights reserved - Do Not Redistribute
#

# install s3 yum tools
cookbook_file "s3iam.py" do
  path "/usr/lib/yum-plugins/s3iam.py"
  owner "root"
  group "root"
  mode 00755
  action :create
end

cookbook_file "s3iam.conf" do
  path "/etc/yum/pluginconf.d/s3iam.conf"
  owner "root"
  group "root"
  mode 00644
  action :create
end

# setup vline-libcxx repo
yum_repository "vline-libcxx" do
  description "vline libcxx s3 yum repository"
  baseurl "http://airtime-stage-repos.s3.amazonaws.com/libcxx"
  gpgcheck false
  action :create
end

execute "add special s3_enabled flag for libcxx" do
  user "root"
  command "echo s3_enabled=1 >> /etc/yum.repos.d/vline-libcxx.repo"
end

yum_package "vline-libcxx" do
  action :install
  flush_cache [:before]
end
