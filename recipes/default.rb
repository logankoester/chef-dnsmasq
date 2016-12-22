package('dnsmasq') { action :install }

template '/etc/dnsmasq.conf' do
  source 'dnsmasq.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables options: node['dnsmasq']['options']
  notifies :reload, 'service[dnsmasq]', :immediate unless node['dnsmasq']['supervisor']
end

template '/etc/resolvconf.conf' do
  source 'resolvconf.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :run, 'bash[resolvconf]', :immediate
end

bash 'resolvconf' do
  user 'root'
  code 'resolvconf -u'
  action :nothing
end

if node['dnsmasq']['supervisor']
  supervisor_service 'dnsmasq' do
    action [:enable, :start]
    directory '/'
    command '/usr/bin/dnsmasq -C /etc/dnsmasq.conf -d'
  end
else
  service 'dnsmasq' do
    supports status: true, start: true, stop: true, restart: true, reload: true
    action [:enable, :start]
  end
end
