#
# Cookbook:: prometheus
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'prometheus::default' do
  context 'When all attributes are default, on CentOS 6.9' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.9')
      runner.converge(described_recipe)
    end

    it 'starts the service prometheus' do
      expect(chef_run).to start_service('prometheus')
    end

    it 'starts the service grafana' do
      expect(chef_run).to start_service('grafana')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
