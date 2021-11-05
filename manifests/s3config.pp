#
define thanos::s3config(
  String $s3bucket = $thanos::s3bucket,
  String $s3endpoint = $thanos::s3endpoint,
  String $s3access_key = $thanos::s3access_key,
  String $s3secret_key = $thanos::s3secret_key,
)
{

  file { '/etc/thanos':
    ensure => directory,
  }

  file { "${thanos::s3cfgfolder}/s3.yaml":
      content => template('thanos/s3.config.erb'),
      owner   => $thanos::config_owner,
      group   => $thanos::config_owner,
      mode    => '0644',
  }


}
