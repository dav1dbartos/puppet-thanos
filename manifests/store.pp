#
class thanos::store(
  String $http_address = '0.0.0.0:19192',
  String $grpc_address = '0.0.0.0:19091',
  String $data_dir = '/var/thanos/store',
  String $s3cfgfolder = $thanos::s3cfgfolder,
  String $cache_size = '512MB',
  String $extra_options = '',
  String $daemon_name = 'thanos-storegw',
  String $init_style = $thanos::init_style,
) inherits thanos
{

  $options = " --data-dir=${thanos::tsdb_path} --objstore.config-file=${s3cfgfolder}/s3.yaml --http-address=${http_address} --grpc-address=${grpc_address} --index-cache-size=${cache_size} ${extra_options}" # lint:ignore:140chars

  thanos::daemon{ $daemon_name :
    options          => $options,
    thanos_component => 'store',
    daemon_user      => 'root',
    daemon_name      => $daemon_name,
    init_style       => $init_style,
  }

  thanos::s3config { 'Config' : }
}
