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

# set centos-base
yum_repository "centos-base" do
  description "centos-base"
  mirrorlist "http://mirrorlist.centos.org/?release=6&arch=$basearch&repo=os"
  gpgcheck false
  action :create
end

# abrt install would currently fail because of dependence on old library
#yum_package "abrt" do
#  action :install
#  flush_cache [:before]
#end