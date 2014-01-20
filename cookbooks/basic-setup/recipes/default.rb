%w(git vim vim-scripts tmux).each do |pkg|
  package pkg
end

# setup ssh keys
file "#{home_dir}/.ssh/id_rsa" do
  owner node['sshkey']['user']
  group node['sshkey']['group']
  mode "0600"
  content node['sshkey']['private_key']
  action :create
end

file "#{home_dir}/.ssh/id_rsa.pub" do
  owner node['sshkey']['user']
  group node['sshkey']['group']
  mode "0600"
  content node['sshkey']['public_key']
  action :create
end
