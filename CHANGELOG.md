# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## v5.0.0 (2020-07-xx)

[Full Changelog]

**Breaking changes:**

- drop support for deprecated puppet/staging module

## [v4.0.0](https://github.com/voxpupuli/puppet-confluence/tree/v4.0.0) (2020-05-09)

[Full Changelog](https://github.com/voxpupuli/puppet-confluence/compare/v3.2.0...v4.0.0)

**Breaking changes:**

- drop EOL Ubuntu 14.04 [\#187](https://github.com/voxpupuli/puppet-confluence/pull/187) ([bastelfreak](https://github.com/bastelfreak))
- modulesync 2.5.1 & drop Puppet 4 [\#184](https://github.com/voxpupuli/puppet-confluence/pull/184) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Add support for Java11 \(logging options\) [\#197](https://github.com/voxpupuli/puppet-confluence/pull/197) ([jake2184](https://github.com/jake2184))
- Manage mysql connector [\#189](https://github.com/voxpupuli/puppet-confluence/pull/189) ([hdep](https://github.com/hdep))
- use service\_provider fact to detect systemd, support Debian 9 [\#183](https://github.com/voxpupuli/puppet-confluence/pull/183) ([rrotter](https://github.com/rrotter))
- Add support for 18.04 [\#180](https://github.com/voxpupuli/puppet-confluence/pull/180) ([baurmatt](https://github.com/baurmatt))

**Fixed bugs:**

- Don't create confluence.cfg.xml [\#182](https://github.com/voxpupuli/puppet-confluence/pull/182) ([rrotter](https://github.com/rrotter))

**Closed issues:**

- Support Ubuntu 18.04 [\#179](https://github.com/voxpupuli/puppet-confluence/issues/179)
- check debian support [\#158](https://github.com/voxpupuli/puppet-confluence/issues/158)
- spec tests fail when run on non-Debian OSes [\#135](https://github.com/voxpupuli/puppet-confluence/issues/135)
- example request [\#127](https://github.com/voxpupuli/puppet-confluence/issues/127)
- Module puppet/staging marked deprecated [\#123](https://github.com/voxpupuli/puppet-confluence/issues/123)
- Should default to https for Confluence download URL [\#61](https://github.com/voxpupuli/puppet-confluence/issues/61)
- Support the mysql connector natively [\#34](https://github.com/voxpupuli/puppet-confluence/issues/34)

**Merged pull requests:**

- Use voxpupuli-acceptance [\#199](https://github.com/voxpupuli/puppet-confluence/pull/199) ([ekohl](https://github.com/ekohl))
- Remove duplicate CONTRIBUTING.md file [\#195](https://github.com/voxpupuli/puppet-confluence/pull/195) ([dhoppe](https://github.com/dhoppe))
- Clean up acceptance spec helper [\#192](https://github.com/voxpupuli/puppet-confluence/pull/192) ([ekohl](https://github.com/ekohl))
- Add mysql\_connector parameters to README [\#190](https://github.com/voxpupuli/puppet-confluence/pull/190) ([hdep](https://github.com/hdep))
- Allow `puppetlabs/stdlib` 6.x and `puppet/archive` 4.x [\#186](https://github.com/voxpupuli/puppet-confluence/pull/186) ([alexjfisher](https://github.com/alexjfisher))
- replace deprecated has\_key\(\) with `in` [\#176](https://github.com/voxpupuli/puppet-confluence/pull/176) ([bastelfreak](https://github.com/bastelfreak))
- replace validate\_\* with assert\_type in init.pp [\#175](https://github.com/voxpupuli/puppet-confluence/pull/175) ([bastelfreak](https://github.com/bastelfreak))
- confluence.cfg.xml little automation [\#170](https://github.com/voxpupuli/puppet-confluence/pull/170) ([posteingang](https://github.com/posteingang))

## [v3.2.0](https://github.com/voxpupuli/puppet-confluence/tree/v3.2.0) (2018-10-20)

[Full Changelog](https://github.com/voxpupuli/puppet-confluence/compare/v3.1.2...v3.2.0)

**Implemented enhancements:**

- Update setenv.sh to support CATALINA\_OPTS [\#167](https://github.com/voxpupuli/puppet-confluence/pull/167) ([TJM](https://github.com/TJM))

**Fixed bugs:**

- setenv.sh is being broken by the puppet-confluence module [\#155](https://github.com/voxpupuli/puppet-confluence/issues/155)

**Merged pull requests:**

- modulesync 2.1.0 and allow puppet 6.x [\#168](https://github.com/voxpupuli/puppet-confluence/pull/168) ([bastelfreak](https://github.com/bastelfreak))

## [v3.1.2](https://github.com/voxpupuli/puppet-confluence/tree/v3.1.2) (2018-09-07)

[Full Changelog](https://github.com/voxpupuli/puppet-confluence/compare/v3.1.1...v3.1.2)

**Fixed bugs:**

- User 'confluence' isn't being created in /etc/passwd [\#153](https://github.com/voxpupuli/puppet-confluence/issues/153)

**Merged pull requests:**

- allow puppetlabs/stdlib 5.x [\#164](https://github.com/voxpupuli/puppet-confluence/pull/164) ([bastelfreak](https://github.com/bastelfreak))
- puppet/archive 3.x and puppet/staging 3.x [\#162](https://github.com/voxpupuli/puppet-confluence/pull/162) ([bastelfreak](https://github.com/bastelfreak))
- Remove docker nodesets [\#159](https://github.com/voxpupuli/puppet-confluence/pull/159) ([bastelfreak](https://github.com/bastelfreak))
- drop EOL OSs; fix puppet version range [\#157](https://github.com/voxpupuli/puppet-confluence/pull/157) ([bastelfreak](https://github.com/bastelfreak))

## [v3.1.1](https://github.com/voxpupuli/puppet-confluence/tree/v3.1.1) (2018-03-28)

[Full Changelog](https://github.com/voxpupuli/puppet-confluence/compare/v3.1.0...v3.1.1)

**Closed issues:**

- Something wrong in puppet-confluence/manifests/init.pp [\#131](https://github.com/voxpupuli/puppet-confluence/issues/131)

**Merged pull requests:**

- bump puppet to latest supported version 4.10.0 [\#151](https://github.com/voxpupuli/puppet-confluence/pull/151) ([bastelfreak](https://github.com/bastelfreak))
- allow camptocamp/systemd 2.X [\#149](https://github.com/voxpupuli/puppet-confluence/pull/149) ([bastelfreak](https://github.com/bastelfreak))

## [v3.1.0](https://github.com/voxpupuli/puppet-confluence/tree/v3.1.0) (2017-11-26)

[Full Changelog](https://github.com/voxpupuli/puppet-confluence/compare/v3.0.0...v3.1.0)

**Implemented enhancements:**

- Ubuntu 16.04 Support \(systemd\)  [\#142](https://github.com/voxpupuli/puppet-confluence/pull/142) ([KoenDierckx](https://github.com/KoenDierckx))

**Merged pull requests:**

- release 3.1.0 [\#144](https://github.com/voxpupuli/puppet-confluence/pull/144) ([bastelfreak](https://github.com/bastelfreak))
- migrate from topscope variables to facts hash [\#143](https://github.com/voxpupuli/puppet-confluence/pull/143) ([bastelfreak](https://github.com/bastelfreak))
- Ubuntu 16.04 Support \(systemd\) [\#133](https://github.com/voxpupuli/puppet-confluence/pull/133) ([marcofl](https://github.com/marcofl))

## [v3.0.0](https://github.com/voxpupuli/puppet-confluence/tree/v3.0.0) (2017-10-11)

[Full Changelog](https://github.com/voxpupuli/puppet-confluence/compare/v2.3.0...v3.0.0)

**Implemented enhancements:**

- Add proxy support when using 'archive' [\#138](https://github.com/voxpupuli/puppet-confluence/pull/138) ([bt-lemery](https://github.com/bt-lemery))
- set confluence.home to homedir if data\_dir is empty [\#112](https://github.com/voxpupuli/puppet-confluence/pull/112) ([kpankonen](https://github.com/kpankonen))

**Fixed bugs:**

- confluence.home isn't set if data\_dir isn't parameter isn't set [\#111](https://github.com/voxpupuli/puppet-confluence/issues/111)
- Fix augeas expression to properly set context path instead of failing silently with multiple contexts [\#130](https://github.com/voxpupuli/puppet-confluence/pull/130) ([Tokynet](https://github.com/Tokynet))
- Fix $homedir typo [\#128](https://github.com/voxpupuli/puppet-confluence/pull/128) ([binford2k](https://github.com/binford2k))

**Closed issues:**

- $data\_dir should be documented in ReadMe [\#129](https://github.com/voxpupuli/puppet-confluence/issues/129)
- Support for Puppet 4 [\#39](https://github.com/voxpupuli/puppet-confluence/issues/39)

**Merged pull requests:**

- release 3.0.0 [\#139](https://github.com/voxpupuli/puppet-confluence/pull/139) ([bastelfreak](https://github.com/bastelfreak))
- Use 'ps' for version fact [\#137](https://github.com/voxpupuli/puppet-confluence/pull/137) ([joshbeard](https://github.com/joshbeard))
- Fix incorrect failures with rspec-puppet-facts [\#136](https://github.com/voxpupuli/puppet-confluence/pull/136) ([op-ct](https://github.com/op-ct))
- Issue 119: updated facter script to not report java version [\#124](https://github.com/voxpupuli/puppet-confluence/pull/124) ([senax](https://github.com/senax))
- replace validate\_\* with puppet4 datatypes & fix archive errors [\#122](https://github.com/voxpupuli/puppet-confluence/pull/122) ([bastelfreak](https://github.com/bastelfreak))

## [v2.3.0](https://github.com/voxpupuli/puppet-confluence/tree/v2.3.0) (2017-02-11)

[Full Changelog](https://github.com/voxpupuli/puppet-confluence/compare/v2.2.2...v2.3.0)

**Closed issues:**

- Error in /etc/facter/facts.d/confluence\_facts.sh - \[\[: not found [\#82](https://github.com/voxpupuli/puppet-confluence/issues/82)

**Merged pull requests:**

- modulesync 0.16.8 [\#110](https://github.com/voxpupuli/puppet-confluence/pull/110) ([nibalizer](https://github.com/nibalizer))
- modulesync 0.16.7 [\#109](https://github.com/voxpupuli/puppet-confluence/pull/109) ([bastelfreak](https://github.com/bastelfreak))
- Bump minimum version dependencies \(for Puppet 4\) [\#108](https://github.com/voxpupuli/puppet-confluence/pull/108) ([juniorsysadmin](https://github.com/juniorsysadmin))
- modulesync 0.16.6 [\#107](https://github.com/voxpupuli/puppet-confluence/pull/107) ([bastelfreak](https://github.com/bastelfreak))
- modulesync 0.16.4 [\#106](https://github.com/voxpupuli/puppet-confluence/pull/106) ([bastelfreak](https://github.com/bastelfreak))
- Bump puppet minimum version\_requirement to 3.8.7 [\#105](https://github.com/voxpupuli/puppet-confluence/pull/105) ([juniorsysadmin](https://github.com/juniorsysadmin))
- Exposes checksum\_verify in init.pp w/ conditional. [\#103](https://github.com/voxpupuli/puppet-confluence/pull/103) ([sacres](https://github.com/sacres))
- modulesync 0.16.3 [\#102](https://github.com/voxpupuli/puppet-confluence/pull/102) ([bastelfreak](https://github.com/bastelfreak))
- Use https instead of http [\#101](https://github.com/voxpupuli/puppet-confluence/pull/101) ([dhoppe](https://github.com/dhoppe))
- Add support for configuring an AJP connector [\#98](https://github.com/voxpupuli/puppet-confluence/pull/98) ([JCotton1123](https://github.com/JCotton1123))
- Update based on voxpupuli/modulesync\_config 0.16.2 [\#96](https://github.com/voxpupuli/puppet-confluence/pull/96) ([dhoppe](https://github.com/dhoppe))
- Make confluence\_version a First Class Fact [\#95](https://github.com/voxpupuli/puppet-confluence/pull/95) ([spjmurray](https://github.com/spjmurray))
- Revert "Make confluence\_version a First Class Fact" [\#94](https://github.com/voxpupuli/puppet-confluence/pull/94) ([dhoppe](https://github.com/dhoppe))
- Allow System Group [\#93](https://github.com/voxpupuli/puppet-confluence/pull/93) ([spjmurray](https://github.com/spjmurray))
- Make confluence\_version a First Class Fact [\#92](https://github.com/voxpupuli/puppet-confluence/pull/92) ([spjmurray](https://github.com/spjmurray))
- Modulesync 0.15.0 [\#91](https://github.com/voxpupuli/puppet-confluence/pull/91) ([alexjfisher](https://github.com/alexjfisher))
- Added parameter for alternative data dir [\#90](https://github.com/voxpupuli/puppet-confluence/pull/90) ([tgeci](https://github.com/tgeci))
- Add missing badges [\#89](https://github.com/voxpupuli/puppet-confluence/pull/89) ([dhoppe](https://github.com/dhoppe))
- Update based on voxpupuli/modulesync\_config 0.14.1 [\#88](https://github.com/voxpupuli/puppet-confluence/pull/88) ([dhoppe](https://github.com/dhoppe))
- Update based on voxpupuli/modulesync\_config 0.13.3 [\#87](https://github.com/voxpupuli/puppet-confluence/pull/87) ([dhoppe](https://github.com/dhoppe))
- modulesync 0.13.0 [\#86](https://github.com/voxpupuli/puppet-confluence/pull/86) ([bbriggs](https://github.com/bbriggs))
- Update based on voxpupuli/modulesync\_config 0.12.7 [\#85](https://github.com/voxpupuli/puppet-confluence/pull/85) ([dhoppe](https://github.com/dhoppe))
- Update based on voxpupuli/modulesync\_config 0.12.6 [\#84](https://github.com/voxpupuli/puppet-confluence/pull/84) ([dhoppe](https://github.com/dhoppe))
- make facts.sh sh compatible [\#83](https://github.com/voxpupuli/puppet-confluence/pull/83) ([mookie-](https://github.com/mookie-))

## [v2.2.2](https://github.com/voxpupuli/puppet-confluence/tree/v2.2.2) (2016-08-18)

[Full Changelog](https://github.com/voxpupuli/puppet-confluence/compare/v2.2.1...v2.2.2)

**Closed issues:**

- Parameter name in README is wrong [\#76](https://github.com/voxpupuli/puppet-confluence/issues/76)
- Clean install fails [\#74](https://github.com/voxpupuli/puppet-confluence/issues/74)

**Merged pull requests:**

- Modulesync 0.12.1 & Release 2.2.2 [\#81](https://github.com/voxpupuli/puppet-confluence/pull/81) ([bastelfreak](https://github.com/bastelfreak))
- modulesync 0.11.1 [\#80](https://github.com/voxpupuli/puppet-confluence/pull/80) ([bastelfreak](https://github.com/bastelfreak))
- modulesync 0.11.0 [\#79](https://github.com/voxpupuli/puppet-confluence/pull/79) ([bastelfreak](https://github.com/bastelfreak))
- Update README.md [\#78](https://github.com/voxpupuli/puppet-confluence/pull/78) ([circuitousNerd](https://github.com/circuitousNerd))
- modulesync 0.9.1 [\#77](https://github.com/voxpupuli/puppet-confluence/pull/77) ([bastelfreak](https://github.com/bastelfreak))
- Fixes \#74 : Correct confluence\_version to fix clean install on Puppet 4 [\#75](https://github.com/voxpupuli/puppet-confluence/pull/75) ([jhg03a](https://github.com/jhg03a))
- Modulesync 0.8.0 [\#73](https://github.com/voxpupuli/puppet-confluence/pull/73) ([bastelfreak](https://github.com/bastelfreak))
- Update based on voxpupuli/modulesync\_config [\#72](https://github.com/voxpupuli/puppet-confluence/pull/72) ([dhoppe](https://github.com/dhoppe))

## [v2.2.1](https://github.com/voxpupuli/puppet-confluence/tree/v2.2.1) (2016-05-12)

[Full Changelog](https://github.com/voxpupuli/puppet-confluence/compare/v2.2.0...v2.2.1)

**Merged pull requests:**

- Release 2.2.1 [\#71](https://github.com/voxpupuli/puppet-confluence/pull/71) ([bastelfreak](https://github.com/bastelfreak))

## [v2.2.0](https://github.com/voxpupuli/puppet-confluence/tree/v2.2.0) (2016-05-08)

[Full Changelog](https://github.com/voxpupuli/puppet-confluence/compare/2.1.1...v2.2.0)

**Closed issues:**

- Where is the template confluence.service.erb [\#47](https://github.com/voxpupuli/puppet-confluence/issues/47)
- Missing default value for $javahome. [\#43](https://github.com/voxpupuli/puppet-confluence/issues/43)
- Add SSL Support [\#38](https://github.com/voxpupuli/puppet-confluence/issues/38)
- Need ability to set context path. [\#36](https://github.com/voxpupuli/puppet-confluence/issues/36)
- Submit to puppet forge under "puppetcommunity" vendor [\#32](https://github.com/voxpupuli/puppet-confluence/issues/32)
- Add \<Context\> path attribute as a parameter for jira class [\#21](https://github.com/voxpupuli/puppet-confluence/issues/21)
- Add systemd service file for RHEL7 [\#19](https://github.com/voxpupuli/puppet-confluence/issues/19)
- Readme needs to be rewritten to comply with puppetlabs guidelines. [\#17](https://github.com/voxpupuli/puppet-confluence/issues/17)

**Merged pull requests:**

- add note about the original author [\#70](https://github.com/voxpupuli/puppet-confluence/pull/70) ([bastelfreak](https://github.com/bastelfreak))
- prepare for 2.2.0 release [\#68](https://github.com/voxpupuli/puppet-confluence/pull/68) ([bastelfreak](https://github.com/bastelfreak))
- modulesync 0.6.0 [\#67](https://github.com/voxpupuli/puppet-confluence/pull/67) ([bastelfreak](https://github.com/bastelfreak))
- Update based on voxpupuli/modulesync\_config [\#66](https://github.com/voxpupuli/puppet-confluence/pull/66) ([dhoppe](https://github.com/dhoppe))
- Update based on voxpupuli/modulesync\_config [\#64](https://github.com/voxpupuli/puppet-confluence/pull/64) ([dhoppe](https://github.com/dhoppe))
- Update based on voxpupuli/modulesync\_config [\#63](https://github.com/voxpupuli/puppet-confluence/pull/63) ([dhoppe](https://github.com/dhoppe))
- Use module voxpupuli/archive instead of mkrakowitzer/deploy [\#60](https://github.com/voxpupuli/puppet-confluence/pull/60) ([dhoppe](https://github.com/dhoppe))
- Remove uppercase parameters [\#59](https://github.com/voxpupuli/puppet-confluence/pull/59) ([dhoppe](https://github.com/dhoppe))
- Check for required parameter javahome [\#58](https://github.com/voxpupuli/puppet-confluence/pull/58) ([dhoppe](https://github.com/dhoppe))
- Add crowd SSO functionality [\#57](https://github.com/voxpupuli/puppet-confluence/pull/57) ([patricktoelle](https://github.com/patricktoelle))
- Update based on voxpupuli/modulesync\_config [\#56](https://github.com/voxpupuli/puppet-confluence/pull/56) ([dhoppe](https://github.com/dhoppe))
- Fix TravisCI badge [\#52](https://github.com/voxpupuli/puppet-confluence/pull/52) ([juniorsysadmin](https://github.com/juniorsysadmin))
- centos 7 service template fixes [\#51](https://github.com/voxpupuli/puppet-confluence/pull/51) ([hypertext418](https://github.com/hypertext418))
- Prepare for 2.2.0 release [\#50](https://github.com/voxpupuli/puppet-confluence/pull/50) ([juniorsysadmin](https://github.com/juniorsysadmin))
- Deprecate the downloadURL parameter [\#49](https://github.com/voxpupuli/puppet-confluence/pull/49) ([juniorsysadmin](https://github.com/juniorsysadmin))
- Install systemd file before starting [\#48](https://github.com/voxpupuli/puppet-confluence/pull/48) ([ericlaflamme](https://github.com/ericlaflamme))
- Add systemd unit file [\#46](https://github.com/voxpupuli/puppet-confluence/pull/46) ([jasonhancock](https://github.com/jasonhancock))
- Moved initscript into service module and template uses variable [\#41](https://github.com/voxpupuli/puppet-confluence/pull/41) ([jacobmw](https://github.com/jacobmw))
- Manage context\_path [\#40](https://github.com/voxpupuli/puppet-confluence/pull/40) ([joshbeard](https://github.com/joshbeard))
- Add manage\_user parameter [\#37](https://github.com/voxpupuli/puppet-confluence/pull/37) ([choffee](https://github.com/choffee))
- Update metadata.json w/ stdlib 4 [\#35](https://github.com/voxpupuli/puppet-confluence/pull/35) ([dudemcbacon](https://github.com/dudemcbacon))

## [2.1.1](https://github.com/voxpupuli/puppet-confluence/tree/2.1.1) (2015-03-22)

[Full Changelog](https://github.com/voxpupuli/puppet-confluence/compare/48eea5b380e9b7920ceb25d14924fd879e92051f...2.1.1)

**Closed issues:**

- update .travis.yaml to deploy to puppet-community [\#28](https://github.com/voxpupuli/puppet-confluence/issues/28)
- make confluence users shell configurable. [\#25](https://github.com/voxpupuli/puppet-confluence/issues/25)
- confluence\_version fact does not correctly pick up running version [\#22](https://github.com/voxpupuli/puppet-confluence/issues/22)
- When using param manage\_server\_xml =\> 'template' acceptCount option is duplicated. [\#20](https://github.com/voxpupuli/puppet-confluence/issues/20)
- Init script for Debian is missing LSB-Tags [\#9](https://github.com/voxpupuli/puppet-confluence/issues/9)
- Make MaxPermSize parameter configurable [\#8](https://github.com/voxpupuli/puppet-confluence/issues/8)
- Make tomcat port / tomcat parameters configurable [\#7](https://github.com/voxpupuli/puppet-confluence/issues/7)
- handle confluence upgrades smoothly [\#6](https://github.com/voxpupuli/puppet-confluence/issues/6)
- replace deploy module with staging as the default. [\#5](https://github.com/voxpupuli/puppet-confluence/issues/5)

**Merged pull requests:**

- Namespace change [\#31](https://github.com/voxpupuli/puppet-confluence/pull/31) ([mkrakowitzer](https://github.com/mkrakowitzer))
- \(Issue \#28\) Update .travis.yml to autodeploy module [\#30](https://github.com/voxpupuli/puppet-confluence/pull/30) ([mkrakowitzer](https://github.com/mkrakowitzer))
- Bump to version 2.1.0 [\#27](https://github.com/voxpupuli/puppet-confluence/pull/27) ([mkrakowitzer](https://github.com/mkrakowitzer))
- Issue \#25 Make confluence users shell configurable. [\#26](https://github.com/voxpupuli/puppet-confluence/pull/26) ([mkrakowitzer](https://github.com/mkrakowitzer))
- Issue20 [\#24](https://github.com/voxpupuli/puppet-confluence/pull/24) ([mkrakowitzer](https://github.com/mkrakowitzer))
- Resolve \#22 - confluence\_version fact detects wrong version [\#23](https://github.com/voxpupuli/puppet-confluence/pull/23) ([mkrakowitzer](https://github.com/mkrakowitzer))
- Issue6 [\#18](https://github.com/voxpupuli/puppet-confluence/pull/18) ([mkrakowitzer](https://github.com/mkrakowitzer))
- Make tomcat port / tomcat parameters configurable \#7 [\#16](https://github.com/voxpupuli/puppet-confluence/pull/16) ([mkrakowitzer](https://github.com/mkrakowitzer))
- Enable strict mode for travis tests [\#15](https://github.com/voxpupuli/puppet-confluence/pull/15) ([mkrakowitzer](https://github.com/mkrakowitzer))
- F3792625/prep for v2 [\#14](https://github.com/voxpupuli/puppet-confluence/pull/14) ([mkrakowitzer](https://github.com/mkrakowitzer))
- \(Issue \#5\) Replace mkrakowitzer-deploy with nanliu-staging [\#13](https://github.com/voxpupuli/puppet-confluence/pull/13) ([mkrakowitzer](https://github.com/mkrakowitzer))
- Add initial beaker acceptance tests [\#12](https://github.com/voxpupuli/puppet-confluence/pull/12) ([mkrakowitzer](https://github.com/mkrakowitzer))
- Update and add missing LSB information to init script. Resolves issue \#9 [\#11](https://github.com/voxpupuli/puppet-confluence/pull/11) ([mkrakowitzer](https://github.com/mkrakowitzer))
- rename rspec-tests and add test for the main class [\#10](https://github.com/voxpupuli/puppet-confluence/pull/10) ([gerhardsam](https://github.com/gerhardsam))
- F3792625/permgen [\#4](https://github.com/voxpupuli/puppet-confluence/pull/4) ([mkrakowitzer](https://github.com/mkrakowitzer))
- F3792625/add tests [\#2](https://github.com/voxpupuli/puppet-confluence/pull/2) ([mkrakowitzer](https://github.com/mkrakowitzer))
- Changes to ensure confluence service starts on reboot [\#1](https://github.com/voxpupuli/puppet-confluence/pull/1) ([brucem](https://github.com/brucem))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
