# == Class: confluence
#
# Install confluence, See README.md for more.
#
class confluence (

  # JVM Settings
  $javahome                                                      = undef,
  $jvm_xms                                                       = '256m',
  $jvm_xmx                                                       = '1024m',
  $jvm_permgen                                                   = '256m',
  $java_opts                                                     = '',
  Variant[String,Array[String]] $catalina_opts                   = '',
  # Confluence Settings
  Pattern[/^(?:(\d+)\.)?(?:(\d+)\.)?(\*|\d+)(|[a-z])$/] $version = '5.7.1',
  $product                                                       = 'confluence',
  $format                                                        = 'tar.gz',
  Stdlib::Absolutepath $installdir                               = '/opt/confluence',
  Stdlib::Absolutepath $homedir                                  = '/home/confluence',
  $data_dir                                                      = undef,
  $user                                                          = 'confluence',
  $group                                                         = 'confluence',
  $uid                                                           = undef,
  $gid                                                           = undef,
  Boolean $manage_user                                           = true,
  $shell                                                         = '/bin/true',
  # Misc Settings
  $download_url                                                  = 'https://www.atlassian.com/software/confluence/downloads/binary',
  $checksum                                                      = undef,
  # Manage confluence server
  $manage_service                                                = true,
  # Tomcat Tunables
  # Should we use augeas to manage server.xml or a template file
  Enum['augeas', 'template'] $manage_server_xml                  = 'augeas',
  $tomcat_port                                                   = 8090,
  $tomcat_max_threads                                            = 150,
  $tomcat_accept_count                                           = 100,
  # Reverse https proxy setting for tomcat
  Hash $tomcat_proxy                                             = {},
  # Any additional tomcat params for server.xml
  Hash $tomcat_extras                                            = {},
  $context_path                                                  = '',
  # Options for the AJP connector
  Hash $ajp                                                      = {},
  # Command to stop confluence in preparation to updgrade. This is configurable
  # incase the confluence service is managed outside of puppet. eg: using the
  # puppetlabs-corosync module: 'crm resource stop confluence && sleep 15'
  $stop_confluence                                               = 'service confluence stop && sleep 15',
  # Enable SingleSignOn via Crowd
  $enable_sso                                                    = false,
  $application_name                                              = 'crowd',
  $application_password                                          = '1234',
  $application_login_url                                         = 'https://crowd.example.com/console/',
  $crowd_server_url                                              = 'https://crowd.example.com/services/',
  $crowd_base_url                                                = 'https://crowd.example.com/',
  $session_isauthenticated                                       = 'session.isauthenticated',
  $session_tokenkey                                              = 'session.tokenkey',
  $session_validationinterval                                    = 5,
  $session_lastvalidation                                        = 'session.lastvalidation',
  $proxy_server                                                  = undef,
  $proxy_type                                                    = undef,
  String[1] $mysql_connector_version                             = '5.1.47',
  Stdlib::Absolutepath $mysql_connector_install                  = '/opt/MySQL-connector',
  Boolean $mysql_connector                                       = false,
) inherits confluence::params {

  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

  $webappdir    = "${installdir}/atlassian-${product}-${version}"

  if $facts['confluence_version'] and $facts['confluence_version'] != 'unknown' {
    # If the running version of CONFLUENCE is less than the expected version of CONFLUENCE
    # Shut it down in preparation for upgrade.
    # lint:ignore:only_variable_string
    if versioncmp($version, $facts['confluence_version']) > 0 {
      # lint:endignore
      notify { 'Attempting to upgrade CONFLUENCE': }
      exec { $stop_confluence: before => Class['confluence::facts'] }
    }
  }

  if $javahome == undef {
    fail('You need to specify a value for javahome')
  }

  # Archive module checksum_verify = true; this verifies checksum if provided, doesn't if not.
  if $checksum == undef {
    $checksum_verify = false
  } else {
    $checksum_verify = true
  }

  if ! empty($ajp) {
    if $manage_server_xml != 'template' {
      fail('An AJP connector can only be configured with manage_server_xml = template.')
    }
    if ! ('port' in $ajp) {
      fail('You need to specify a valid port for the AJP connector.')
    } else {
      assert_type(Variant[Pattern[/^\d+$/], Stdlib::Port], $ajp['port'])
    }
    if ! ('protocol' in $ajp) {
      fail('You need to specify a valid protocol for the AJP connector.')
    } else {
      assert_type(Enum['AJP/1.3', 'org.apache.coyote.ajp'], $ajp['protocol'])
    }
  }

  contain confluence::facts
  contain confluence::install
  contain confluence::config
  contain confluence::service

  Class['confluence::facts'] -> Class['confluence::install'] -> Class['confluence::config'] ~> Class['confluence::service']

  if $mysql_connector {
    class { 'confluence::mysql_connector': }
  }

  if ($enable_sso) {
    class { 'confluence::sso':
    }
  }
}
