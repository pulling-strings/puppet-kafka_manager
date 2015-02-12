# kafka_manager configuration
class kafka_manager::config(
  $zkhosts
){
  editfile::config { 'zkhosts':
    ensure  => $zkhosts,
    path    => "${::kafka_manager::dest}/conf/application.conf",
    entry   => 'kafka-manager.zkhosts',
    require => Archive['kafka-manager']
  }

}
