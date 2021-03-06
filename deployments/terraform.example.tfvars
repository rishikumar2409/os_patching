project                                                         = "<Project_id>"
labels                                                          = {labels}
instance_name_prefixes                                          = ["<instance_prefixes>"]
zones                                                           = ["<zones>"]
patch_reboot_config                                             = "<reboot_config>"
apt_type                                                        = "<type>"
apt_excludes                                                    = ["<excludes>"]
yum_security                                                    = <true|false>
yum_minimal                                                     = <true|false>
yum_excludes                                                    = ["<excludes>"]
goo_enabled                                                     = <true|false>
zypper_categories                                               = ["<categories>"]
windows_update_classifications                                  = ["<classifications>"]
pre_step_linux_exec_step_config_allowed_success_codes           = <allowed_success_codes>
pre_step_linux_exec_step_config_local_path                      = "<local_path>"
pre_step_windows_exec_step_config_interpreter                   = "<interpreter>"
pre_step_windows_exec_step_config_allowed_success_codes         = <allowed_success_codes>
pre_step_windows_exec_step_config_local_path                    = "<local_path>"
post_step_linux_exec_step_config_gcs_object_bucket              = "<bucket>"
post_step_linux_exec_step_config_gcs_object_generation_number   = "<generation_number>"
post_step_linux_exec_step_config_gcs_object_object              = "<object>"
post_step_windows_exec_step_config_interpreter                  = "<interpreter>"
post_step_windows_exec_step_config_gcs_object_bucket            = "<bucket>"
post_step_windows_exec_step_config_gcs_object_generation_number = "<generation_number>"
post_step_windows_exec_step_config_gcs_object_object            = "<object>"
duration                                                        = "<duration in sec.>"
recurring_schedule_time_zone_id                                 = "<time_zone>"
recurring_schedule_time_of_day_hours                            = <hours>
recurring_schedule_time_of_day_minutes                          = <minutes>
recurring_schedule_time_of_day_seconds                          = <seconds>
recurring_schedule_time_of_day_nanos                            = <nanos>
monthly_week_day_of_month_week_ordinal                          = <week_ordinal>
monthly_week_day_of_month_day_of_week                           = "<day_of_week>"
rollout_mode                                                    = "<mode>"
rollout_disruption_budget_fixed                                 = <fixed>