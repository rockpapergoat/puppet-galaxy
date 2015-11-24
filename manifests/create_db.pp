# Class: galaxy::create_db
#
#
#
#
#
class galaxy::create_db (
  $directory    = $galaxy::params::app_directory,
  $galaxy_user  = $galaxy::params::galaxy_user,
  $galaxy_group = $galaxy::params::galaxy_group,
  ) inherits galaxy::params {

  include ::galaxy::universe


  # run create_db.sh only if the conection string changes
  file { "$directory/.db_connection":
    owner   => 'galaxy',
    group   => 'galaxy',
    mode    => '0600',
    content => "$::galaxy::universe::db_connection\n",
  } ~>
  exec { 'create_db.sh':
    require     => Class['galaxy::universe'],
    path        => '/usr/bin:/usr/sbin:/bin:/sbin',
    cwd         => $directory,
    user        => $galaxy_user,
    group       => $galaxy_group,
    command     => "$directory/create_db.sh",
    timeout     => 500,
    refreshonly => true,
  }
}
