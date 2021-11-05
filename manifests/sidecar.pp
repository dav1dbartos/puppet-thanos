#
class thanos::sidecar(
  Boolean $s3config = true,
  String $s3cfgfolder = $thanos::s3cfgfolder,
  String $http_address = $thanos::http_address,
  String $grpc_address = $thanos::grpc_address,
  String $prometheus_url = $thanos::prometheus_url,
  String $init_style = $thanos::init_style,
  String $daemon_name = 'thanos-sidecar',
) inherits thanos
{

  if $s3config == true {
    $objstore = "--objstore.config-file=${s3cfgfolder}/s3.yaml"
    thanos::s3config { 'Config' : }
  }
  else {
    $objstore = ''
  }


  thanos::daemon{ $daemon_name :
    options          => " --tsdb.path=${thanos::tsdb_path} ${objstore} --prometheus.url=${prometheus_url} --http-address=${http_address} --grpc-address=${grpc_address} ", # lint:ignore:140chars
    thanos_component => 'sidecar',
    daemon_user      => 'prometheus',
    daemon_name      => $daemon_name,
    init_style       => $init_style,
  }

}
