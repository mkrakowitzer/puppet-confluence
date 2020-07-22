# puppet-confluence

[![Build Status](https://travis-ci.org/voxpupuli/puppet-confluence.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-confluence)
[![Code Coverage](https://coveralls.io/repos/github/voxpupuli/puppet-confluence/badge.svg?branch=master)](https://coveralls.io/github/voxpupuli/puppet-confluence)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/confluence.svg)](https://forge.puppetlabs.com/puppet/confluence)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/confluence.svg)](https://forge.puppetlabs.com/puppet/confluence)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/confluence.svg)](https://forge.puppetlabs.com/puppet/confluence)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/confluence.svg)](https://forge.puppetlabs.com/puppet/confluence)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with Confluence](#setup)
    * [Confluence Prerequisites](#confluence-prerequisites)
    * [What Confluence affects](#what-confluence-affects)
    * [Beginning with Confluence](#beginning-with-confluence)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This is a puppet module to install and handle upgrades of Atlassian Confluence.
Confluence is team collaboration software.

## Module Description

This module installs/upgrades Atlassian Confluence. The Confluence module also
manages the Confluence configuration files with Puppet.

## Setup

### Confluence Prerequisites

* Confluence require a Java Developers Kit (JDK) or Java Run-time Environment
  (JRE) platform to be installed on your server's operating system. Oracle JDK
  / JRE (formerly Sun JDK / JRE) versions 1.7 and 1.8 are currently supported by
  Atlassian.

:warning: There's a known issue with Java 1.8.0_25 and 1.8.0_31, and another
known issue with 1.7.0_25 and 1.7.0_45. Atlassian don't recommend running
Confluence on these versions.

* Confluence requires a relational database to store its configuration data.
  Unfortunatly it is not possible to do the initial configuration
  (Database setup) of confluence with puppet (See issue #3 - No database support
  ). The configuration needs to be done via the web GUI.

### What Confluence affects

If installing to an existing Confluence instance, it is your responsibility to
backup your database. We also recommend that you backup your Confluence home
directory and that you align your current Confluence version with the version
you intend to use with puppet Confluence module.

You must have your database setup with the account user that Confluence will
use. This can be done using the puppetlabs-postgresql and puppetlabs-mysql
modules.

When using this module to upgrade Confluence, please make sure you have a
database/Confluence home backup.

The following resources are potentially effected by this module:

* confluence user
* confluence init script
* setenv.sh
* confluence-init.properties
* server.xml

### Beginning with Confluence

This puppet module will automatically download the Confluence tar.gz from
Atlassian and extracts it into /opt/confluence/atlassian-confluence-$version.
The default Confluence home is /home/confluence.

```puppet
  class { 'confluence':
    javahome => '/opt/java',
  }
```

## Usage

This module also allows for direct customization of the JVM, following
[atlassians recommendations](https://confluence.atlassian.com/display/JIRA/Setting+Properties+and+Options+on+Startup)

This is especially useful for setting properties such as http/https proxy settings.
Support has also been added for reverse proxying confluence via apache or nginx.

### A more complex example

```puppet
  class { 'confluence':
    version        => '5.7.1',
    installdir     => '/opt/atlassian/atlassian-confluence',
    homedir        => '/opt/atlassian/application-data/confluence-home',
    javahome       => '/opt/java',
    java_opts      => '-Dhttp.proxyHost=proxy.example.com -Dhttp.proxyPort=3128 -Dhttps.proxyHost=secure-proxy.example.com -Dhttps.proxyPort=3128'
    tomcat_proxy   => {
      scheme       => 'https',
      proxyName    => 'confluence.example.co.za',
      proxyPort    => '443',
    },
  }
```

#### Hiera example

This example is used in production for 2000+ users in an traditional enterprise
environment. Your mileage may vary.

```yaml
confluence::user:           'confluence'
confluence::group:          'confluence'
confluence::shell:          '/bin/bash'
confluence::dbserver:       'dbvip.example.co.za'
confluence::version:        '5.7.1'
confluence::installdir:     '/opt/atlassian/atlassian-confluence'
confluence::homedir:        '/opt/atlassian/application-data/confluence-home'
confluence::javahome:       '/opt/java'
confluence::java_opts:      '-Dhttp.proxyHost=proxy.example.co.za -Dhttp.proxyPort=8080 -Dhttps.proxyHost=proxy.example.co.za -Dhttps.proxyPort=8080 -Dhttp.nonProxyHosts=localhost\|127.0.0.1\|172.*.*.*\|10.*.*.*\|*.example.co.za -XX:+UseLargePages'
confluence::manage_service: false
confluence::tomcat_port:    '8090'
confluence::jvm_xms:        '4G'
confluence::jvm_xmx:        '8G'
confluence::jvm_permgen:    '512m'
confluence::download_url:    'http://webserver.example.co.za/pub/software/development-tools/atlassian'
confluence::catalina_opts:
  - -Dconfluence.cluster.node.name=%{hostname}
  - -Dconfluence.upgrade.recovery.file.enabled=false
confluence::tomcat_proxy:
  scheme:    'https'
  proxyName: 'webvip.example.co.za'
  proxyPort: '443'
```

## Reference

### Classes

#### Public Classes

* `confluence`: Main class, manages the installation and configuration of Confluence.

#### Private Classes

* `confluence::install`: Installs Confluence binaries
* `confluence::config`: Modifies Confluence/tomcat configuration files
* `confluence::service`: Manage the Confluence service
* `confluence::facts`: Class to get the running version of confluence
* `confluence::params`: Default params

### Parameters

#### Confluence parameters

##### `javahome`

Specify the java home directory. No assumptions are made re the location of java
and therefor this option is required. Default: undef

##### `version`

The version of confluence to install. Default: '5.5.6'

##### `format`

The format of the file confluence will be installed from. Default: 'tar.gz'

##### `installdir`

The installation directory of the confluence binaries. Default: '/opt/confluence'

##### `homedir`

The home directory of confluence. Configuration files are stored here. Default: '/home/confluence'

##### `user`

The user that confluence should run as, as well as the ownership of confluence
related files. Default: 'confluence'

##### `group`

The group that confluence files should be owned by. Default: 'confluence'

##### `uid`

Specify a uid of the confluence user. Default: undef

##### `gid`

Specify a gid of the confluence user. Default: undef

##### `shell`

Specify the shell of the confluence user. Default: undef

##### `manage_user`

Whether or not to manage the confluence user. Default: true

##### `context_path`

Specify context path, defaults to ''. If modified, Once Confluence has started,
go to the administration area and click General Configuration.
Append the new context path to your base URL.

#### JVM Java parameters

##### `jvm_xms`

The initial memory allocation pool for a Java Virtual Machine. Default: '256m'

##### `jvm_xmx`

Maximum memory allocation pool for a Java Virtual Machine. Default: '1024m'

##### `jvm_permgen`

Increase max permgen size for a Java Virtual Machine. Default: '256m'

##### `java_opts`

Additional java options can be specified here. Default: ''

##### `catalina_opts`

Additional catalina options can be specified either as a simple string or array of strings. Default: ''

#### Tomcat parameters

#### `tomcat_proxy`

Reverse https proxy configuration. See customization section for more detail.
Default: {}

##### `tomcat_port`

Port to listen on, defaults to '8090'

##### `tomcat_max_threads`

Defaults to '150'

##### `tomcat_accept_count`

Defaults to  '100'

##### `tomcat_extras`

Any additional tomcat params for server.xml. Takes same format as
`tomcat_proxy`. Default: {}

#### Crowd single sign on parameters

#### `enable_sso`

Enable crowd single sign on configuration as described in <https://confluence.atlassian.com/display/CROWD/Integrating+Crowd+with+Atlassian+Confluence#IntegratingCrowdwithAtlassianConfluence-2.2EnableSSOintegrationwithCrowd(Optional)>

#### `application_name`

Set crowd application name

#### `application_password`

Set crowd application password

#### `application_login_url`

Set crowd application login url, where to login into crowd (e.g. <https://crowd.example.com/console/>)

#### `crowd_server_url`

Set crowd application services url, e.g. <https://crowd.example.com/services/>

#### `crowd_base_url`

Set crowd base url, e.g. <https://crowd.example.com/>

#### `session_isauthenticated`

Some more crowd.properties for SSO, see atlassian documentation for details

#### `session_tokenkey`

Some more crowd.properties for SSO, see atlassian documentation for details

#### `session_validationinterval`

Some more crowd.properties for SSO, see atlassian documentation for details

#### `session_lastvalidation`

Some more crowd.properties for SSO, see atlassian documentation for details

#### Miscellaneous parameters

##### `manage_server_xml`

Should we use augeas to manage server.xml or a template file. Defaults to
'augeas'. Operating systems that do not have a support version of Augeas such
as Ubuntu 12.04 can use 'template'.

##### `download_url`

The URL used to download the JIRA installation file.
Defaults to '<https://www.atlassian.com/software/confluence/downloads/binary>'

##### `checksum`

The md5 checksum of the archive file. Only supported with

#### `proxy_server`

Specify a proxy server, with port number if needed. ie: https://example.com:8080.

#### `proxy_type`

Proxy server type (none|http|https|ftp)

##### `manage_service`

Should puppet manage this service? Default: true

##### `stop_confluence`

If the Confluence service is managed outside of puppet the stop_confluence
paramater can be used to shut down confluence for upgrades. Defaults to
'service confluence stop && sleep 15'

##### `facts_ensure`

Enable external facts for confluence version. Defaults to present.

##### `mysql_connector_version`

Specify the version of mysql_connector_version you want to use. Defaults to 5.1.47.

##### `mysql_connector_install`

Specify where you want to install mysql connector . Defaults to /opt/MySQL-connector

##### `mysql_connector`

Should the module deploy mysql_connector for mysql databases ? . Default to false


## Limitations

* Puppet 5.5.8 or newer

The puppetlabs repositories can be found at:
<http://yum.puppetlabs.com/> and <http://apt.puppetlabs.com/>

* RedHat / CentOS 6/7
* Ubuntu 16.04 / 18.04
* Debian 9

Operating Systems without an Augueas version >= 1 such as Ubuntu 12.04 must use
the paramater:

```puppet
manage_server_xml => 'template',
```

We plan to support other Linux distributions and possibly Windows in the near future.

## Development

See CONTRIBUTING.md

## Contributors

See CONTRIBUTORS
