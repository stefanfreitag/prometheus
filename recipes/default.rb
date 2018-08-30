#
# Cookbook:: prometheus
# Recipe:: default
#

include_recipe 'prometheus::setup'
include_recipe 'prometheus::node_exporter'
