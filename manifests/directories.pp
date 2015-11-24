# Class: galaxy::directories
# inherits galaxy::params, where we set a number of paths needed here.
#
class galaxy::directories (
  $cluster_files       = "${app_dir}/database/pbs",
  $compiled_templates  = "${app_dir}/database/compiled_templates",
  $file_path           = "${app_dir}/database/files",
  $ftp                 = "${app_dir}/database/ftp/",
  $genetrack_plots     = "${app_dir}/static/genetrack/plots",
  $job_working         = "${app_dir}/database/job_working_directory",
  $object_store_cache  = "${app_dir}/database/object_store_cache",
  $object_store_object = "${app_dir}/database/object_store_object",
  $tmp_file            = "${app_dir}/database/tmp",
  $tool_data_jars      = "${app_dir}/tool-data/shared/jars",
  $tool_dependency     = "${app_dir}/tool_dependencies",
  $whoosh_index        = "${app_dir}/database/whoosh_indexes",
  ) inherits galaxy::params {
  $paths= [
    $cluster_files,
    $compiled_templates,
    $file_path,
    $ftp,
    $genetrack_plots
    $job_working,
    $object_store_cache,
    $object_store_object,
    $tmp_file,
    $tool_data_jars,
    $tool_dependency,
    $whoosh_index,
  ]
 file  { $paths:
    before => Class['galaxy::universe'],
    ensure => directory,
    owner  => $galaxy_user,
    group  => $galaxy_group,
    mode   => '0755',
  }
}
