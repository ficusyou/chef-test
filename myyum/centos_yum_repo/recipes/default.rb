#
# Cookbook Name:: centos_yum_repo
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

myyum_repository "custom" do
  description "centos"
  url "http://pkg.jenkins-ci.org/redhat/jenkins.repo"
  repo_name "custom"
  action :add
end

yum_package "abrt" do
  action :install
  flush_cache [:before]
end
