# kafka_manager configuration,
# zkhosts is an array of zookeeper connection strings with the form:
# [10.0.0.1:2181, 10.0.0.2:2181, ...]
class kafka_manager::config(
  $zkhosts
){

  $joined = join($zkhosts,',')

  editfile::config { 'zkhosts':
    ensure  => "\"${joined}\"",
    path    => "${::kafka_manager::dest}/conf/application.conf",
    entry   => 'kafka-manager.zkhosts',
    require => Archive['kafka-manager'],
    notify  => Service['kafka-manager']
  }

}
