# Inspec test for recipe prometheus::default

# Users and groups

describe user('alertmanager') do
  it { should exist }
  its('shell') { should eq '/bin/false' }
  its('group') { should eq 'alertmanager' }
end

describe group('alertmanager') do
  it { should exist }
end

# Ports

describe port(22) do
  it { should be_listening }
end

describe port(9093) do
  it { should be_listening }
end

# Files and directories

describe directory('/opt/alertmanager') do
  its('link_path') { should eq '/opt/alertmanager-0.15.2.linux-amd64' }
  its('group') { should eq 'alertmanager' }
  its('owner') { should eq 'alertmanager' }
end

describe directory('/etc/init.d/alertmanager') do
  its('group') { should eq 'root' }
  its('owner') { should eq 'root' }
end

