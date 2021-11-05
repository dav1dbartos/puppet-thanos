# Class: thanos
# ===========================
#
# Full description of class thanos here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'thanos':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2020 Your name here, unless otherwise noted.
#
class thanos(
  String $s3bucket = '',
  String $s3endpoint = '',
  String $s3access_key = '',
  String $s3secret_key = '',
  String $bin_dir = '/bin',
  String $bin_name = 'thanos',
  String $package_name = 'thanos-pkg',
  String $package_ensure = 'installed',
  String $tsdb_path = '/var/lib/prometheus',
  String $http_address = '0.0.0.0:19191',
  String $grpc_address = '0.0.0.0:19090',
  String $prometheus_url = 'http://localhost:9090',
  String $s3cfgfolder = '/etc/thanos',
  String $config_owner = 'root',
  String $version = '0.15.0',
  String $install_method = 'url',
  String $init_style = $facts['service_provider'],
) {

}
