#
# Cookbook Name:: prometheus
# Recipe: setup
#

# Create prometheus user
user node['prometheus']['user'] do
  system true
  shell '/bin/false'
  home node['prometheus']['dir']
end

# Create prometheus log directory
directory node['prometheus']['log_dir'] do
  owner node['prometheus']['user']
  group node['prometheus']['group']
  mode '0755'
  recursive true
end

# Download prometheus to local directory
remote_file node['prometheus']['local'] do
  source node['prometheus']['url']
  owner node['prometheus']['user']
  group node['prometheus']['group']
  mode '0755'
  action :create
end

# Extract prometheus to directory
execute 'Extract prometheus' do
  command "tar xzvf #{node['prometheus']['local']} -C /opt"
  cwd '/tmp'
end

link '/opt/prometheus' do
  owner node['prometheus']['user']
  group node['prometheus']['group']
  to '/opt/prometheus-2.3.2.linux-amd64'
  link_type :symbolic
end

# TODO: Ownership of files and directories no ok
directory '/opt/prometheus-2.3.2.linux-amd64' do
  owner node['prometheus']['user']
  group node['prometheus']['group']
  mode '0755'
  recursive true
end

# TODO: Does this work?
directory '/opt/prometheus-2.3.2.linux-amd64/data' do
  owner node['prometheus']['user']
  group node['prometheus']['group']
  mode '0755'
  recursive true
end

template '/etc/init.d/prometheus' do
  source 'prometheus.erb'
  mode '0755'
  owner 'root'
  group 'root'
  variables(prometheus_user: node['prometheus']['user'],
            prometheus_path: '/opt/prometheus',
            prometheus_logdir: node['prometheus']['log_dir'])
end

service 'prometheus' do
  supports status: true, restart: true, reload: true
  action %i[enable start]
end
