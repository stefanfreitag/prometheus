# Inspec test for recipe prometheus::default

# Users and groups

describe user('prometheus') do
  it { should exist }
  its('shell') { should eq '/bin/false' }
  its('group') { should eq 'prometheus' }
end

describe group('prometheus') do
  it { should exist }
end

# Ports

describe port(22) do
  it { should be_listening }
end

describe port(9090) do
  it { should be_listening }
end

# Files and directories

describe directory('/opt/prometheus') do
  its('link_path') { should eq '/opt/prometheus-2.3.2.linux-amd64' }
  its('group') { should eq 'prometheus' }
  its('owner') { should eq 'prometheus' }
end

describe directory('/var/log/prometheus') do
  its('group') { should eq 'prometheus' }
  its('owner') { should eq 'prometheus' }
end


describe directory('/etc/init.d/prometheus') do
  its('group') { should eq 'root' }
  its('owner') { should eq 'root' }
end

