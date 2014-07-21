#
# Cookbook Name:: vline_yum_repos
# Recipe:: default
#
# Copyright (C) 2014 Airtime
#
# All rights reserved - Do Not Redistribute
#

# install tecate server
yum_package "vline-tecate-server" do
  version node[:tecate_version]
  allow_downgrade true
  action :upgrade
  flush_cache [:before]
end
