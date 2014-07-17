#
# Cookbook Name:: centos_yum_repo
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

yum_repository "centos-base" do
  description "centos-base"
  baseurl "http://mirrorlist.centos.org/?release=6&arch=$basearch&repo=os"
  gpgcheck false
  action :create
end

yum_package "abrt" do
  action :install
  flush_cache [:before]
end
