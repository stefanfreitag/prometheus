#
# Cookbook Name:: prometheus
# Attribute:: default
#

# Home directory of the prometheus user
default['prometheus']['dir'] = '/opt/prometheus'

# Location of Prometheus binary
default['prometheus']['binary'] = "#{node['prometheus']['dir']}/prometheus"

# Location for Prometheus logs
default['prometheus']['log_dir'] = '/var/log/prometheus'

# Location for Prometheus logs
default['prometheus']['tsdb_dir'] = "#{node['prometheus']['dir']}/data"

# System user to use
default['prometheus']['user'] = 'prometheus'

# System group to use
default['prometheus']['group'] = 'prometheus'

# URL of the Prometheus tar.gz to download
default['prometheus']['url'] = 'https://github.com/prometheus/prometheus/releases/download/v2.3.2/prometheus-2.3.2.linux-amd64.tar.gz'

# Name of the stored tar.gz on local system
default['prometheus']['local'] = '/tmp/prometheus-2.3.2.linux-amd64.tar.gz'

# Path to the prometheus configuration file
default['prometheus']['flags']['config.file'] = "#{node['prometheus']['dir']}/prometheus.yml"

#
# Default attributes for the node exporter
#

# Directory where the prometheus binary will be installed
default['prometheus']['node_exporter']['dir'] = '/opt/node_exporter'

# URL of the Prometheus node exporter tar.gz to download
default['prometheus']['node_exporter']['url'] = 'https://github.com/prometheus/node_exporter/releases/download/v0.16.0/node_exporter-0.16.0.linux-amd64.tar.gz'

# Name of the stored tar.gz on local system
default['prometheus']['node_exporter']['local'] = '/tmp/node_exporter-0.16.0.linux-amd64.tar.gz'

# Location for Prometheus node_exporter logs
default['prometheus']['node_exporter']['log_dir'] = '/opt/node_exporter'
