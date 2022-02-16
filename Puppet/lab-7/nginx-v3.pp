$app = "nginx"
$version = "v3"

package { "install $app":
  name => $app,
  ensure => present,
}

service { "start $app":
  name => $app,
  ensure => "running",
  enable => "true",
  subscribe => [
    Package["install $app"],
    File["/usr/share/nginx/html/index.html"],
  ]
}


file { "/usr/share/nginx/html/index.html":
  content => "Welcome to ${app} server by Pierre ${version}",
  notify => Service["start $app"],
}


