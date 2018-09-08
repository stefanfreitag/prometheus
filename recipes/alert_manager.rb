# Create alert manager user
user node['prometheus']['alertmanager']['user'] do
  system true
  shell '/bin/false'
  home node['prometheus']['alertmanager']['dir']
end

# Create alert manager group
group node['prometheus']['alertmanager']['group'] do
  action :create
  members node['prometheus']['alertmanager']['user']
  append true
end

# Download prometheus alert manager to local directory
remote_file node['prometheus']['alertmanager']['local'] do
  source node['prometheus']['alertmanager']['url']
  owner node['prometheus']['alertmanager']['user']
  group node['prometheus']['alertmanager']['group']
  mode '0755'
  action :create
end

# Extract alert manager to directory
execute 'Extract alert manager' do
  command "tar xzvf #{node['prometheus']['alertmanager']['local']} -C /opt"
end

execute 'Change ownership' do
  command "chown -R #{node['prometheus']['alertmanager']['user']}:#{node['prometheus']['alertmanager']['group']} /opt/alertmanager-0.15.2.linux-amd64"
end

link '/opt/alertmanager' do
  owner node['prometheus']['alertmanager']['user']
  group node['prometheus']['alertmanager']['group']
  to '/opt/alertmanager-0.15.2.linux-amd64'
  link_type :symbolic
end


# Create prometheus alert manager log directory
directory node['prometheus']['alertmanager']['log_dir'] do
  owner node['prometheus']['alertmanager']['user']
  group node['prometheus']['alertmanager']['group']
  mode '0755'
  recursive true
end


template '/etc/init.d/alertmanager' do
  source 'alert_manager.erb'
  mode '0755'
  owner 'root'
  group 'root'
  variables(alertmanager_user: node['prometheus']['alertmanager']['user'],
            alertmanager_path: '/opt/alertmanager',
            alertmanager_logdir: node['prometheus']['alertmanager']['log_dir'])
end

service 'alertmanager' do
  supports status: true, restart: true, reload: true
  action %i[enable start]
end
