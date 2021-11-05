#
class thanos::compactor(
  String $http_address = $thanos::http_address,
  String $grpc_address = $thanos::grpc_address,
  String $s3cfgfolder = $thanos::s3cfgfolder,
  String $init_style = $thanos::init_style,
  String $data_dir = '/var/thanos/compact',
  String $extra_options = '',
  String $daemon_name = 'thanos-compactor',
) inherits thanos
{

  $options = " --data-dir=${thanos::tsdb_path} --objstore.config-file=${s3cfgfolder}/s3.yaml --wait --http-address=${http_address} ${extra_options}" # lint:ignore:140chars

  thanos::daemon{ $daemon_name :
    options          => $options,
    thanos_component => 'compact',
    daemon_user      => 'root',
    daemon_name      => $daemon_name,
    init_style       => $init_style,
  }

  thanos::s3config { 'Config' : }

}
