#
# Cookbook Name:: vline_yum_repos
# Recipe:: default
#
# Copyright (C) 2014 Airtime
#
# All rights reserved - Do Not Redistribute
#

# install s3 yum tools
git "/tmp" do
  repository "https://github.com/seporaitis/yum-s3-iam"
  revision "master"
  action :sync
end

cookbook_file "/usr/lib/yum-plugins/s3iam.py" do
  source "/tmp/yum-s3-iam/s3iam.py"
  owner "root"
  group "root"
  mode 00755
  action :create_if_missing
end

cookbook_file "/etc/yum/pluginconf.d/s3iam.conf" do
  source "/tmp/yum-s3-iam/s3iam.conf"
  owner "root"
  group "root"
  mode 00644
  action :create_if_missing
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
