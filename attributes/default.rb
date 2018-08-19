#
# Cookbook Name:: prometheus
# Attribute:: default
#

# Directory where the prometheus binary will be installed
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
