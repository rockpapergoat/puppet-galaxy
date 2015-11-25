# Class: galaxy::directories
# inherits galaxy::params, where we set a number of paths needed here.
# uses the dirtree module here: https://github.com/AlexCline/dirtree
#
class galaxy::directories (
  $app_dir             = $galaxy::params::app_dir,
  $db_path             = "${app_dir}/database",
  $cluster_files       = "${db_path}/pbs",
  $compiled_templates  = "${db_path}/compiled_templates",
  $file_path           = "${db_path}/files",
  $ftp                 = "${db_path}/ftp/",
  $genetrack_plots     = "${app_dir}/static/genetrack/plots",
  $job_working         = "${db_path}/job_working_directory",
  $object_store_cache  = "${db_path}/object_store_cache",
  $object_store_object = "${db_path}/object_store_object",
  $tmp_file            = "${db_path}/tmp",
  $tool_data_jars      = "${app_dir}/tool-data/shared/jars",
  $tool_dependency     = "${app_dir}/tool_dependencies",
  $whoosh_index        = "${app_dir}/database/whoosh_indexes",
  ) inherits galaxy::params {
  $paths = [
    $app_dir,
    $cluster_files,
    $compiled_templates,
    $db_path,
    $file_path,
    $ftp,
    $genetrack_plots,
    $job_working,
    $object_store_cache,
    $object_store_object,
    $tmp_file,
    $tool_data_jars,
    $tool_dependency,
    $whoosh_index,
  ]
  $all_paths = dirtree($paths)
 file  { $all_paths:
    before => Class['galaxy::universe'],
    ensure => directory,
    owner  => $galaxy_user,
    group  => $galaxy_group,
    mode   => '0755',
  }
}
