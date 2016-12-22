require 'spec_helper'

describe 'dnsmasq::default' do
  before do
    Fauxhai.mock(path: 'spec/fixtures/arch.json') do |node|
    end
  end

  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      set_attributes_for node
      node.set['dnsmasq']['options'] = ['server=/consul/127.0.0.1#8600']
    end.converge(described_recipe)
  end

  it 'should install dnsmasq' do
    expect(chef_run).to install_package 'dnsmasq' 
  end

  it 'should render the dnsmasq.conf template' do
    expect(chef_run).to render_file('/etc/dnsmasq.conf').with_content(/server=\/consul\/127\.0\.0\.1#8600/)
  end

  it 'should render the resolvconf.conf template' do
    expect(chef_run).to render_file('/etc/resolvconf.conf')
  end

  it 'should enable and start the dnsmasq service' do
    expect(chef_run).to enable_service 'dnsmasq'
    expect(chef_run).to start_service 'dnsmasq'
  end

end
