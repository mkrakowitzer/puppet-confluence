# == Class: confluence::install
#
# Install confluence, See README.md for more.
#
class confluence::install {

  include 'archive'

  if $confluence::manage_user {
    group { $confluence::group:
      ensure => present,
      system => true,
      gid    => $confluence::gid,
    }
    -> user { $confluence::user:
      comment          => 'Confluence daemon account',
      shell            => $confluence::shell,
      home             => $confluence::homedir,
      password         => '*',
      password_min_age => '0',
      password_max_age => '99999',
      managehome       => true,
      system           => true,
      uid              => $confluence::uid,
      gid              => $confluence::gid,
    }
  }



  if ! defined(File[$confluence::installdir]) {
    file { $confluence::installdir:
      ensure => 'directory',
      owner  => $confluence::user,
      group  => $confluence::group,
    }
  }

  $file = "atlassian-${confluence::product}-${confluence::version}.${confluence::format}"

  if ! defined(File[$confluence::webappdir]) {
    file { $confluence::webappdir:
      ensure => 'directory',
      owner  => $confluence::user,
      group  => $confluence::group,
    }
  }

  case $confluence::deploy_module {
    'staging': {
      require staging
      staging::file { $file:
        source  => "${confluence::download_url}/${file}",
        timeout => 1800,
      }
      -> staging::extract { $file:
        target  => $confluence::webappdir,
        creates => "${confluence::webappdir}/conf",
        strip   => 1,
        user    => $confluence::user,
        group   => $confluence::group,
        notify  => Exec["chown_${confluence::webappdir}"],
        before  => File[$confluence::homedir],
        require => [
          File[$confluence::installdir],
          File[$confluence::webappdir] ],
      }
      if $confluence::manage_user {
        User[$confluence::user] -> Staging::Extract[$file]
      }
    }
    'archive': {
      archive { "/tmp/${file}":
        ensure          => present,
        extract         => true,
        extract_command => 'tar xfz %s --strip-components=1',
        extract_path    => $confluence::webappdir,
        source          => "${confluence::download_url}/${file}",
        creates         => "${confluence::webappdir}/conf",
        cleanup         => true,
        checksum_verify => $confluence::checksum_verify,
        checksum_type   => 'md5',
        checksum        => $confluence::checksum,
        user            => $confluence::user,
        group           => $confluence::group,
        proxy_server    => $confluence::proxy_server,
        proxy_type      => $confluence::proxy_type,
        before          => File[$confluence::homedir],
        require         => [
          File[$confluence::installdir],
          File[$confluence::webappdir],
        ],
      }
      if $confluence::manage_user {
        User[$confluence::user] -> Archive["/tmp/${file}"]
      }
    }
    default: {
      fail('deploy_module parameter must equal "archive" or "staging"')
    }
  }

  file { [ $confluence::homedir, "${confluence::homedir}/logs" ]:
    ensure => 'directory',
    group  => $confluence::group,
    owner  => $confluence::user,
  }
  -> exec { "chown_${confluence::webappdir}":
    command     => "/bin/chown -R ${confluence::user}:${confluence::group} ${confluence::webappdir}",
    refreshonly => true,
  }
  if $confluence::manage_user{
    User[$confluence::user] ~> Exec["chown_${confluence::webappdir}"]
  }
}
