# == Class: solr::params
#
# Full description of class solr here.
#
# === Parameters
#
# [*url*]
#   The url of the source repository for apache jetty.
#   Default: 'http://mirrors.gigenet.com/apache/lucene/solr',
#
# [*version*]
#   The version to install.
#   Default: '4.10.3'.
#
# [*jetty_user*]
#   Run Jetty as this user ID (default: solr)
#   Note, creates this user.
#
# [*jetty_host*]
#   Listen to connections from this network host
#   Use 0.0.0.0 as host to accept all connections.
#   Default: 127.0.0.1
#
# [*jetty_port*]
#   The network port used by Jetty
#   Default Port: 8983
#
# === Variables
#
# [*solr_home*]
#   The home directory for solr.
#
# [*solr_home_src*]
#   The source directory for solr.
#
# === Examples
#
#
# === Copyright
#
# GPL-3.0+
#
class solr::params (
  $url        = 'http://mirrors.gigenet.com/apache/lucene/solr',
  $version    = '4.10.3',
  $jetty_user = 'solr',
  $jetty_host = '127.0.0.1',
  $jetty_port = '8983',
){

  $solr_home = '/opt/solr'
  $solr_home_src = "/opt/solr-${solr::params::version}"

  # OS Specific configuration
  case $::osfamily {
      'redhat': {
        $required_packages  = ['java-1.7.0-openjdk']

      }
      'debian':{
        #$required_packages = ['openjdk-7-jre','jsvc','apache2-utils']
        $required_packages = ['openjdk-7-jre']
      }
      default: {
        fail("Unsupported OS ${::osfamily}.  Please use a debian or \
redhat based system")
      }
  }
}