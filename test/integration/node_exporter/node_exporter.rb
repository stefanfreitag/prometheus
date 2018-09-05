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

describe port(9182) do
  it { should be_listening }
end

# Files and directories

describe directory('/opt/node_exporter') do
  its('link_path') { should eq '/opt/node_exporter-0.16.0.linux-amd64' }
  its('group') { should eq 'prometheus' }
  its('owner') { should eq 'prometheus' }
end
