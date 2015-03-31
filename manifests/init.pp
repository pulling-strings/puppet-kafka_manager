# Setting up https://github.com/yahoo/kafka-manager
class kafka_manager(
  $repo,
  $version = '1.1',
) {

  $artifact = "kafka-manager-${version}"
  $dest = "/opt/kafka-manager/${artifact}"

  package{'unzip':
    ensure  => present
  } ->

  archive {'kafka-manager':
    ensure     => present,
    url        => "${repo}/kafka-manager-${version}.zip",
    checksum   => false,
    src_target => '/usr/src/',
    target     => '/opt/',
    extension  => 'zip',
  } ->

  upstart::service{'kafka-manager':
    exec  => "./bin/kafka-manager -Dconfig.file=${dest}/conf/application.conf",
    user  => 'root',
    group => 'root',
    chdir => $dest
  }
}
