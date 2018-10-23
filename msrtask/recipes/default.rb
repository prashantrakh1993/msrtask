#
# Cookbook:: msrtest
# Recipe:: default
# Copyright:: 2018, The Authors

#updatingUbuntuPackages
bash 'Execute my script' do
  cwd  '/home/ubuntu'
  code <<-EOH
  apt-get update
  EOH
end
#************* Installing package of git ********************
package 'git' do
  action:install
end

#**************Installing apache-2 && start the service**************************

package 'apache2' do
  action:install
end

service "apache2" do
  action :start
end

#************Installtion of SVN***************************
package 'subversion' do
  action:install
end

#***********Installation of docker***********************
package 'docker' do
  action:install
end

#***********Instllation of docker compose***************
# ****************through bash script *************
cookbook_file '/home/ubuntu/myscript.sh' do
  source 'myscript.sh'
  action :create
end

execute "install my script" do
  command "sh /home/ubuntu/myscript.sh"
end

#instllation of open-ssl***************
# ****************through bash script *************
cookbook_file '/home/ubuntu/openssl.sh' do
  source 'openssl.sh'
  action :create
end

execute "install my script" do
  command "sh /home/ubuntu/openssl.sh"
end

#creating a docker-compose file*********************
remote_file '/home/ubuntu/msrtask/webapp' do
  source '/home/ubuntu/msrtask/webapp'
   action :create
end
#executing docker up ********************************
bash 'Execute docker script' do
  cwd  '/home/ubuntu/msrtask/webapp'
  code <<-EOH
  sudo docker-compose up
  EOH
end


