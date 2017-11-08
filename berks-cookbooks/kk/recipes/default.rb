
# Cookbook Name:: kk-
# Recipe:: default
#
# Copyright (C) 2017 
#
    s3_file "/home/ec2-user/Mycode.jar" do
        remote_path "Mycode.jar"
        bucket "jenkinsbucket123"
        s3_url "https://s3-eu-west-1.amazonaws.com/jenkinsbucket123"
        action :create
    end


execute "running Mycode" do
  command "java -jar /home/ec2-user/Mycode.jar >> output.txt"
  cwd "/home/ec2-user"
  action "run"
end

execute "copying output file to s3" do
command "aws s3 cp /home/ec2-user/output.txt s3://myautomationscailing/myfolder/output.txt"
 action "run"
end
