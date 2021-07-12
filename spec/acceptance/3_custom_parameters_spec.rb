require 'spec_helper_acceptance'

# It is sometimes faster to host confluence / java files on a local webserver.
# Set environment variable download_url to use local webserver
# export BEAKER_FACTER_DOWNLOAD_URL = 'http://10.0.0.XXX/'

describe 'confluence' do
  it 'change params of server.xml' do
    pp = <<-EOS
      $jh = '/opt/java'
      $allow_virtual_packages = hiera('allow_virtual_packages',false)
      Package {
        allow_virtual => $allow_virtual_packages,
      }
      class { 'confluence':
        version             => '5.7',
        download_url        => fact('download_url'),
        javahome            => $jh,
        tomcat_port         => '8091',
        tomcat_max_threads  => 999,
        tomcat_accept_count => 999,
        context_path        => '/confluence1',
      }
    EOS
    apply_manifest(pp, catch_failures: true)
    shell 'wget -q --tries=240 --retry-connrefused --read-timeout=10 localhost:8091/confluence1', acceptable_exit_codes: [0]
    sleep 60
    shell 'wget -q --tries=240 --retry-connrefused --read-timeout=10 localhost:8091/confluence1', acceptable_exit_codes: [0]
    sleep 30
    apply_manifest(pp, catch_changes: true)
  end

  describe process('java') do
    it { is_expected.to be_running }
  end

  describe port(8091) do
    it { is_expected.to be_listening }
  end

  describe service('confluence') do
    it { is_expected.to be_enabled }
  end

  describe user('confluence') do
    it { is_expected.to exist }
  end

  describe user('confluence') do
    it { is_expected.to belong_to_group 'confluence' }
  end

  describe user('confluence') do
    it { is_expected.to have_login_shell '/bin/true' }
  end

  describe command('wget -q --tries=240 --retry-connrefused --read-timeout=10 -O- localhost:8091/confluence1') do
    its(:stdout) { is_expected.to match %r{http://www.atlassian.com/} }
  end

  describe file('/opt/confluence/atlassian-confluence-5.7/conf/server.xml') do
    it { is_expected.to contain 'maxThreads="999"' }
    it { is_expected.to contain 'acceptCount="999"' }
    it { is_expected.to contain 'Context path="/confluence"' }
  end
end
