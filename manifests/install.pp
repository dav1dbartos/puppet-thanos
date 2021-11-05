#
class thanos::install(
  Boolean $restart_on_change = false,
  $package_ensure = present,
  String $version = '0.15.0',
  String $install_method = 'url',
  String $package_name = 'thanos-cloudevelops'
) {
  case $install_method {
    'url' : {

      $path_check = find_file("/opt/thanos-${version}.linux-amd64")

      if $path_check {
        debug("archive exists")
      } else {
        archive { "/tmp/thanos-${version}.tar.gz":
          ensure          => present,
          extract         => true,
          extract_path    => '/opt',
          source          => "https://github.com/thanos-io/thanos/releases/download/v${version}/thanos-${version}.linux-amd64.tar.gz",
          checksum_verify => false,
          creates         => "/opt/thanos-${version}.linux-amd64/thanos",
          cleanup         => true,
        }
        -> file {
          "/opt/thanos-${version}.linux-amd64/thanos":
            owner => 'root',
            group => 0, # 0 instead of root because OS X uses "wheel".
            mode  => '0555';
          "/bin/thanos":
            ensure => link,
            target => "/opt/thanos-${version}.linux-amd64/thanos";
        }
      }
    }
    'package' : {
      if ! defined(Package[$package_name]) {
        package { $package_name :
          ensure => $package_ensure,
        }
      }
    }
    default:
    {
      fail("Provided install method is invalid")
    }
  }

}
