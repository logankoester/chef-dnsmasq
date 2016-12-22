require 'spec_helper'

describe file('/etc/dnsmasq.conf') do
  it { should be_file }
end

describe package('dnsmasq') do
  it { should be_installed }
end

describe service('dnsmasq') do
  it { should be_enabled }
  it { should be_running }
end
