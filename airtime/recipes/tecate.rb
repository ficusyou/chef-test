#
# Cookbook Name:: vline_yum_repos
# Recipe:: default
#
# Copyright (C) 2014 Airtime
#
# All rights reserved - Do Not Redistribute
#

# install vline tools
yum_package "vline-libcxx" do
  action :install
  flush_cache [:before]
end

yum_package "vline-tecate-server" do
  action :install
  flush_cache [:before]
end
