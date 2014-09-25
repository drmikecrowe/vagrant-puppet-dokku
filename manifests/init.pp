class dokku {
    $params = hiera('params')
    $base = $params['dokkuversion']

    $url = "https://raw.github.com/progrium/dokku"

    package{"python-software-properties": ensure => installed}->
    exec { "InstallDokku":
      cwd    => "/root",
      command => "wget -qO- $url/$base/bootstrap.sh | sudo DOKKU_TAG=$base bash",
      creates => '/home/dokku',
      timeout => 1800,
    }
}

class dokku::mariadb {
  vcsrepo { "/var/lib/dokku/plugins/dokku-md-plugin":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'https://github.com/Kloadut/dokku-md-plugin.git',
  }
}

class dokku::docker::options {
  vcsrepo { "/var/lib/dokku/plugins/dokku-docker-options":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::mongodb {
  vcsrepo { "/var/lib/dokku/plugins/dokku-mongodb-plugin":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
  exec { "start_mongodb":
    command => "dokku mongodb:start",
    require => Exec['install_plugins'],
  }
}

class dokku::bower::grunt::build {
  vcsrepo { "/var/lib/dokku/plugins/dokku-bower-grunt-build-plugin":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::domains {
  vcsrepo { "/var/lib/dokku/plugins/dokku-domains-plugin":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::debug {
  vcsrepo { "/var/lib/dokku/plugins/dokku-debug":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::docker::direct {
  vcsrepo { "/var/lib/dokku/plugins/dokku-docker-direct":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::rebuild {
  vcsrepo { "/var/lib/dokku/plugins/dokku-rebuild":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::supervisord {
  vcsrepo { "/var/lib/dokku/plugins/dokku-supervisord":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::docker::options {
  vcsrepo { "/var/lib/dokku/plugins/dokku-docker-options":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::secure::apps {
  vcsrepo { "/var/lib/dokku/plugins/dokku-secure-apps":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::app::predeploy::tasks {
  vcsrepo { "/var/lib/dokku/plugins/dokku-app-predeploy-tasks":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::rebuild {
  vcsrepo { "/var/lib/dokku/plugins/dokku-rebuild":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::custom::domains {
  vcsrepo { "/var/lib/dokku/plugins/dokku-custom-domains":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::domains {
  vcsrepo { "/var/lib/dokku/plugins/dokku-domains-plugin":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}

class dokku::bower::install {
  vcsrepo { "/var/lib/dokku/plugins/dokku-bower-install":
    ensure  => present,
    require  => Dokku,
    provider => git,
    source  => 'git://github.com/bewest/dokku-console-plugins.git',
  }
}
