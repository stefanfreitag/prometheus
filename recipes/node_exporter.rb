# TODO: Create log direcetory

# Download prometheus node exporter to local directory
remote_file node['prometheus']['node_exporter']['local'] do
  source node['prometheus']['node_exporter']['url']
  owner node['prometheus']['user']
  group node['prometheus']['group']
  mode '0755'
  action :create
end


# Extract prometheus to directory
execute 'Extract prometheus' do
  command "tar xzvf #{node['prometheus']['node_exporter']['local']} -C /opt"
  cwd '/tmp'
end

link '/opt/node_exporter' do
  owner node['prometheus']['user']
  group node['prometheus']['group']
  to '/opt/node_exporter-0.16.0.linux-amd64'
  link_type :symbolic
end

template '/etc/init.d/node_exporter' do
  source 'node_exporter.erb'
  mode '0755'
  owner 'root'
  group 'root'
  variables(node_exporter_user: node['prometheus']['user'],
            node_exporter_path: '/opt/node_exporter',
            node_exporter_logdir: node['prometheus']['node_exporter']['log_dir'])
end
  
service 'node_exporter' do
  supports status: true, restart: true, reload: true
  action %i[enable start]
end
  

# TODO
# scrape_configs:
#  - job_name: "node"
#    scrape_interval: "15s"
#  target_groups:
# - targets: ['localhost:9100']
