# Setting up https://github.com/yahoo/kafka-manager
class kafka_manager(
  $url,
  $version = '1.0-SNAPSHOT',
) {

  $artifact = "kafka-manager-${version}"
  $dest = "/opt/kafka-manager/${artifact}"

  package{'unzip':
    ensure  => present
  } ->

  archive {'kafka-manager':
    ensure     => present,
    url        => $url,
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
