name 'prometheus'
maintainer 'Stefan Freitag'
maintainer_email 'stefan@stefreitag.de'
license 'Apache-2.0'
description 'Installs/Configures prometheus'
long_description 'Installs/Configures prometheus'
version '0.0.1'
chef_version '>= 12.14' if respond_to?(:chef_version)

supports 'centos', '= 6.10'

issues_url 'https://github.com/stefanfreitag/prometheus/issues'
source_url 'https://github.com/stefanfreitag/prometheus'
