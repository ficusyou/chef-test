#
# Cookbook Name:: centos_yum_repo
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

yum_repository "jenkins" do
  description "jenkins"
  baseurl "http://pkg.jenkins-ci.org/redhat/jenkins.repo"
  action :create
end

yum_package "jenkins" do
  action :install
  flush_cache [:before]
end
