#
# Cookbook Name:: tomcat-web-app-deploy
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
###Clearing tomcat7 webapps ROOT folder###
bash 'Clearing tomcat7 webapps ROOT folder' do
  user 'root'
  cwd '/home/ec2-user'
  code <<-EOH
  sudo rm -rf /var/lib/tomcat7/webapps/ROOT
  EOH
end
 
###copying and replacing existing ROOT.war with new ROOT.war in our cookbook files/default directory###
cookbook_file "/var/lib/tomcat7/webapps/ROOT.war" do
  source "ROOT.war"
  mode "0644"
  notifies :restart, "service[tomcat7]"
end
 
###restarting tomcat7 service###
service 'tomcat7' do
  supports :restart => true
end
 
