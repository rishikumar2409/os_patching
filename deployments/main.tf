/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "os_config_patch_deployment_full" {
  source                                                          = "../modules"
  project                                                         = var.project
  labels                                                          = var.labels
  instance_name_prefixes                                          = var.instance_name_prefixes
  zones                                                           = var.zones
  patch_reboot_config                                             = var.patch_reboot_config
  apt_type                                                        = var.apt_type
  apt_excludes                                                    = var.apt_excludes
  yum_security                                                    = var.yum_security
  yum_minimal                                                     = var.yum_minimal
  yum_excludes                                                    = var.yum_excludes
  goo_enabled                                                     = var.goo_enabled
  zypper_categories                                               = var.zypper_categories
  windows_update_classifications                                  = var.windows_update_classifications
  pre_step_linux_exec_step_config_allowed_success_codes           = var.pre_step_linux_exec_step_config_allowed_success_codes
  pre_step_linux_exec_step_config_local_path                      = var.pre_step_linux_exec_step_config_local_path
  pre_step_windows_exec_step_config_interpreter                   = var.pre_step_windows_exec_step_config_interpreter
  pre_step_windows_exec_step_config_allowed_success_codes         = var.pre_step_windows_exec_step_config_allowed_success_codes
  pre_step_windows_exec_step_config_local_path                    = var.pre_step_windows_exec_step_config_local_path
  post_step_linux_exec_step_config_gcs_object_bucket              = var.post_step_linux_exec_step_config_gcs_object_bucket
  post_step_linux_exec_step_config_gcs_object_generation_number   = var.post_step_linux_exec_step_config_gcs_object_generation_number
  post_step_linux_exec_step_config_gcs_object_object              = var.post_step_linux_exec_step_config_gcs_object_object
  post_step_windows_exec_step_config_interpreter                  = var.post_step_windows_exec_step_config_interpreter
  post_step_windows_exec_step_config_gcs_object_bucket            = var.post_step_windows_exec_step_config_gcs_object_bucket
  post_step_windows_exec_step_config_gcs_object_generation_number = var.post_step_windows_exec_step_config_gcs_object_generation_number
  post_step_windows_exec_step_config_gcs_object_object            = var.post_step_windows_exec_step_config_gcs_object_object
  duration                                                        = var.duration
  recurring_schedule_time_zone_id                                 = var.recurring_schedule_time_zone_id
  recurring_schedule_time_of_day_hours                            = var.recurring_schedule_time_of_day_hours
  recurring_schedule_time_of_day_minutes                          = var.recurring_schedule_time_of_day_minutes
  recurring_schedule_time_of_day_seconds                          = var.recurring_schedule_time_of_day_seconds
  recurring_schedule_time_of_day_nanos                            = var.recurring_schedule_time_of_day_nanos
  monthly_week_day_of_month_week_ordinal                          = var.monthly_week_day_of_month_week_ordinal
  monthly_week_day_of_month_day_of_week                           = var.monthly_week_day_of_month_day_of_week
  rollout_mode                                                    = var.rollout_mode
  rollout_disruption_budget_fixed                                 = var.rollout_disruption_budget_fixed
}