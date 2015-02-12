# Setting up https://github.com/yahoo/kafka-manager
class kafka_manager(
  $url,
  $version = '1.0-SNAPSHOT',
) {

  $artifact = "kafka-manager-${version}"
  $dest = "/opt/kafka-manager/${artifact}"

  archive {'kafka-manager':
    ensure     => present,
    url        => $url,
    checksum   => false,
    src_target => '/usr/src',
    target     => '/opt',
    extension  => 'zip',
    notify     => Service['kafka-manager']
  } ->

  upstart::service{'kafka-manager':
    exec  => 'bin/kafka-manager',
    user  => 'root',
    group => 'root',
    chdir => $dest
  }
}
