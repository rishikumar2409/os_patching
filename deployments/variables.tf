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

variable "project" {
  description = "Project sample project id."
  type        = string
}

variable "labels" {
  description = "Targets VM instances matching ANY of these GroupLabels."
  type        = map(string)
  default = {
    env = "dev",
    app = "web"
  }
}

variable "instance_name_prefixes" {
  description = "Targets VMs whose name starts with one of these prefixes."
  type        = list(string)
  default     = ["test-"]
}

variable "zones" {
  description = "Targets VM instances in ANY of these zones."
  type        = list(string)
  default     = ["us-central1-a", "us-central-1c"]
}

variable "patch_reboot_config" {
  description = "Post-patch reboot settings."
  type        = string
  default     = "ALWAYS"
}

variable "apt_type" {
  description = "By changing the type to DIST, the patching is performed using apt-get dist-upgrade instead."
  type        = string
  default     = "DIST"
}

variable "apt_excludes" {
  description = "List of packages to exclude from update."
  type        = list(string)
  default     = ["python"]
}

variable "yum_security" {
  description = "Adds the --security flag to yum update."
  type        = bool
  default     = true
}

variable "yum_minimal" {
  description = "Will cause patch to run yum update-minimal instead."
  type        = bool
  default     = true
}

variable "yum_excludes" {
  description = "List of packages to exclude from update."
  type        = list(string)
  default     = ["bash"]
}

variable "goo_enabled" {
  description = "goo update settings. Use this setting to override the default goo patch rules."
  type        = bool
  default     = true
}

variable "zypper_categories" {
  description = "Install only patches with these categories. Common categories include security, recommended, and feature."
  type        = list(string)
  default     = ["security"]
}

variable "windows_update_classifications" {
  description = "Only apply updates of these windows update classifications. If empty, all updates are applied."
  type        = list(string)
  default     = ["CRITICAL", "SECURITY", "UPDATE"]
}

variable "pre_step_linux_exec_step_config_allowed_success_codes" {
  description = "Defaults to [0]. A list of possible return values that the execution can return to indicate a success."
  type        = list(number)
  default     = [0, 3]
}

variable "pre_step_linux_exec_step_config_local_path" {
  description = "An absolute path to the executable on the VM."
  type        = string
  default     = "/tmp/pre_patch_script.sh"
}

variable "pre_step_windows_exec_step_config_interpreter" {
  description = "The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are SHELL and POWERSHELL."
  type        = string
  default     = "SHELL"
}

variable "pre_step_windows_exec_step_config_allowed_success_codes" {
  description = "Defaults to [0]. A list of possible return values that the execution can return to indicate a success."
  type        = list(number)
  default     = [0, 2]
}

variable "pre_step_windows_exec_step_config_local_path" {
  description = "An absolute path to the executable on the VM."
  type        = string
  default     = "C:\\Users\\user\\pre-patch-script.cmd"
}

variable "post_step_linux_exec_step_config_gcs_object_bucket" {
  description = "Bucket of the Cloud Storage object."
  type        = string
  default     = "my-patch-scripts"
}

variable "post_step_linux_exec_step_config_gcs_object_generation_number" {
  description = "Generation number of the Cloud Storage object. This is used to ensure that the ExecStep specified by this PatchJob does not change."
  type        = string
  default     = "1523477886880"
}

variable "post_step_linux_exec_step_config_gcs_object_object" {
  description = "Name of the Cloud Storage object."
  type        = string
  default     = "linux/post_patch_script"
}

variable "post_step_windows_exec_step_config_interpreter" {
  description = "The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are SHELL and POWERSHELL."
  type        = string
  default     = "POWERSHELL"
}

variable "post_step_windows_exec_step_config_gcs_object_bucket" {
  description = "Bucket of the Cloud Storage object."
  type        = string
  default     = "my-patch-scripts"
}

variable "post_step_windows_exec_step_config_gcs_object_generation_number" {
  description = "Generation number of the Cloud Storage object. This is used to ensure that the ExecStep specified by this PatchJob does not change."
  type        = string
  default     = "135920493447"
}

variable "post_step_windows_exec_step_config_gcs_object_object" {
  description = "Name of the Cloud Storage object."
  type        = string
  default     = "windows/post_patch_script.ps1"
}

variable "duration" {
  description = "Duration of the patch. After the duration ends, the patch times out. A duration in seconds with up to nine fractional digits, terminated by 's'."
  type        = string
  default     = "10s"
}

variable "recurring_schedule_time_zone_id" {
  description = "IANA Time Zone Database time zone, e.g. 'America/New_York'."
  type        = string
  default     = "America/New_York"
}

variable "recurring_schedule_time_of_day_hours" {
  description = "Hours of day in 24 hour format. Should be from 0 to 23."
  type        = number
  default     = 0
}

variable "recurring_schedule_time_of_day_minutes" {
  description = "Minutes of hour of day. Must be from 0 to 59."
  type        = number
  default     = 30
}

variable "recurring_schedule_time_of_day_seconds" {
  description = "Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds."
  type        = number
  default     = 30
}

variable "recurring_schedule_time_of_day_nanos" {
  description = "Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999."
  type        = number
  default     = 20
}

variable "monthly_week_day_of_month_week_ordinal" {
  description = "Week number in a month. 1-4 indicates the 1st to 4th week of the month. -1 indicates the last week of the month."
  type        = number
  default     = -1
}

variable "monthly_week_day_of_month_day_of_week" {
  description = "A day of the week. Possible values are MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, and SUNDAY."
  type        = string
  default     = "TUESDAY"
}

variable "rollout_mode" {
  description = "Mode of the patch rollout. Possible values are ZONE_BY_ZONE and CONCURRENT_ZONES."
  type        = string
  default     = "ZONE_BY_ZONE"
}

variable "rollout_disruption_budget_fixed" {
  description = "Specifies a fixed value."
  type        = number
  default     = 1
}