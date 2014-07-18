#
# Cookbook Name:: centos_yum_repo
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

yum_repository "vline-libcxx" do
  description "vline libcxx s3 yum repository"
  baseurl "http://airtime-stage-repos.s3.amazonaws.com/libcxx"
  gpgcheck false
  source "s3_enabled=1"
  action :create
end

yum_package "vline-libcxx" do
  action :install
  flush_cache [:before]
end
