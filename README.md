# Intro

This module sets up [kafka manager](https://github.com/yahoo/kafka-manager)


# Usage

The module sets up the service and deploys the artifact:

```puppet
  class {'kafka_manager':
    url     => 'http://yourhost/kafka-manager-1.0-SNAPSHOT.zip'
  }
  
  class {'kafka_manager::config':
    zkhosts => '192.168.1.3:2181'
  }
```

Java has to be supplied externally see [jdk](https://github.com/pulling-strings/puppet-jdk)


# Copyright and license

Copyright [2015] [Ronen Narkis]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.

You may obtain a copy of the License at:

  [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
