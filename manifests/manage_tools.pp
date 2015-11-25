# Class: galaxy::manage_tools
# (fill in details about params and function)
#
#
#
class galaxy::manage_tools (
  $directory    = $galaxy::params::app_directory,
  $cmd          = "python ${galaxy::params::app_directory}/scripts/manage_tools.py",
  $galaxy_user  = $galaxy::params::galaxy_user,
  $galaxy_group = $galaxy::params::galaxy_group,
  ) inherits galaxy::params {
  exec { 'Manage Tools Upgrade':
    path        => '/usr/bin:/usr/sbin:/bin:/sbin',
    environment => ["PYTHONPATH=${directory}/lib"],
    cwd         => $directory,
    command     => "$cmd upgrade",
    user        => $galaxy_user,
    group       => $galaxy_group,
    unless      => "test \"\$($cmd db_version)\" -eq \"\$($cmd version)\"",
    provider    => shell,
    require     => Class['galaxy::create_db'],
  }
}
