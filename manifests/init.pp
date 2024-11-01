class elk {
  class {'logstash':}
  logstash::plugin {'logstash-input-beats':}
  logstash::configfile{'beats':
    source => 'puppet:///modules/elk/beats.conf',
  }


  include ::java
  class { 'elasticsearch':
    jvm_options => ['-Xms256m','-Xmx256m']  
  }
  elasticsearch::instance { 'es-01': }

  class {'kibana': 
    config => {
      'server.host' => '0.0.0.0'
    }
  }
}

