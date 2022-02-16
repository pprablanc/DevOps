package { 'nginx':
  ensure => present,
}


service { 'nginx':
  ensure => 'running',
  enable => 'true',
  subscribe => [
    Package['nginx'],
    File['/usr/share/nginx/html/index.html'],
  ]
}


file { '/usr/share/nginx/html/index.html':
  content => 'Welcome Pierre to puppet server v2',
  notify => Service['nginx'],
}


