#
# Cookbook Name:: vline_yum_repos
# Recipe:: default
#
# Copyright (C) 2014 Airtime
#
# All rights reserved - Do Not Redistribute
#

# setup vline-libcxx repo
yum_repository "vline-libcxx" do
  description "vline libcxx s3 yum repository"
  baseurl "http://airtime-stage-repos.s3.amazonaws.com/libcxx"
  gpgcheck false
  action :create
end

yum_package "vline-libcxx" do
  action :install
  flush_cache [:before]
end

# setup tecate-server repo
yum_repository "vline-tecate-server" do
  description "vline tecate server s3 yum repository"
  baseurl "http://airtime-stage-repos.s3.amazonaws.com/tecate-server"
  gpgcheck false
  action :create
end

yum_package "vline-tecate-server" do
  action :install
  flush_cache [:before]
end
