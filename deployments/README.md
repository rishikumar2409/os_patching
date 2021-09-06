Copyright 2021 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_os_config_patch_deployment_full"></a> [os\_config\_patch\_deployment\_full](#module\_os\_config\_patch\_deployment\_full) | ../modules | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apt_excludes"></a> [apt\_excludes](#input\_apt\_excludes) | List of packages to exclude from update. | `list(string)` | <pre>[<br>  "python"<br>]</pre> | no |
| <a name="input_apt_type"></a> [apt\_type](#input\_apt\_type) | By changing the type to DIST, the patching is performed using apt-get dist-upgrade instead. | `string` | `"DIST"` | no |
| <a name="input_duration"></a> [duration](#input\_duration) | Duration of the patch. After the duration ends, the patch times out. A duration in seconds with up to nine fractional digits, terminated by 's'. | `string` | `"10s"` | no |
| <a name="input_goo_enabled"></a> [goo\_enabled](#input\_goo\_enabled) | goo update settings. Use this setting to override the default goo patch rules. | `bool` | `true` | no |
| <a name="input_instance_name_prefixes"></a> [instance\_name\_prefixes](#input\_instance\_name\_prefixes) | Targets VMs whose name starts with one of these prefixes. | `list(string)` | <pre>[<br>  "test-"<br>]</pre> | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Targets VM instances matching ANY of these GroupLabels. | `map(string)` | <pre>{<br>  "app": "web",<br>  "env": "dev"<br>}</pre> | no |
| <a name="input_monthly_week_day_of_month_day_of_week"></a> [monthly\_week\_day\_of\_month\_day\_of\_week](#input\_monthly\_week\_day\_of\_month\_day\_of\_week) | A day of the week. Possible values are MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, and SUNDAY. | `string` | `"TUESDAY"` | no |
| <a name="input_monthly_week_day_of_month_week_ordinal"></a> [monthly\_week\_day\_of\_month\_week\_ordinal](#input\_monthly\_week\_day\_of\_month\_week\_ordinal) | Week number in a month. 1-4 indicates the 1st to 4th week of the month. -1 indicates the last week of the month. | `number` | `-1` | no |
| <a name="input_patch_reboot_config"></a> [patch\_reboot\_config](#input\_patch\_reboot\_config) | Post-patch reboot settings. | `string` | `"ALWAYS"` | no |
| <a name="input_post_step_linux_exec_step_config_gcs_object_bucket"></a> [post\_step\_linux\_exec\_step\_config\_gcs\_object\_bucket](#input\_post\_step\_linux\_exec\_step\_config\_gcs\_object\_bucket) | Bucket of the Cloud Storage object. | `string` | `"my-patch-scripts"` | no |
| <a name="input_post_step_linux_exec_step_config_gcs_object_generation_number"></a> [post\_step\_linux\_exec\_step\_config\_gcs\_object\_generation\_number](#input\_post\_step\_linux\_exec\_step\_config\_gcs\_object\_generation\_number) | Generation number of the Cloud Storage object. This is used to ensure that the ExecStep specified by this PatchJob does not change. | `string` | `"1523477886880"` | no |
| <a name="input_post_step_linux_exec_step_config_gcs_object_object"></a> [post\_step\_linux\_exec\_step\_config\_gcs\_object\_object](#input\_post\_step\_linux\_exec\_step\_config\_gcs\_object\_object) | Name of the Cloud Storage object. | `string` | `"linux/post_patch_script"` | no |
| <a name="input_post_step_windows_exec_step_config_gcs_object_bucket"></a> [post\_step\_windows\_exec\_step\_config\_gcs\_object\_bucket](#input\_post\_step\_windows\_exec\_step\_config\_gcs\_object\_bucket) | Bucket of the Cloud Storage object. | `string` | `"my-patch-scripts"` | no |
| <a name="input_post_step_windows_exec_step_config_gcs_object_generation_number"></a> [post\_step\_windows\_exec\_step\_config\_gcs\_object\_generation\_number](#input\_post\_step\_windows\_exec\_step\_config\_gcs\_object\_generation\_number) | Generation number of the Cloud Storage object. This is used to ensure that the ExecStep specified by this PatchJob does not change. | `string` | `"135920493447"` | no |
| <a name="input_post_step_windows_exec_step_config_gcs_object_object"></a> [post\_step\_windows\_exec\_step\_config\_gcs\_object\_object](#input\_post\_step\_windows\_exec\_step\_config\_gcs\_object\_object) | Name of the Cloud Storage object. | `string` | `"windows/post_patch_script.ps1"` | no |
| <a name="input_post_step_windows_exec_step_config_interpreter"></a> [post\_step\_windows\_exec\_step\_config\_interpreter](#input\_post\_step\_windows\_exec\_step\_config\_interpreter) | The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are SHELL and POWERSHELL. | `string` | `"POWERSHELL"` | no |
| <a name="input_pre_step_linux_exec_step_config_allowed_success_codes"></a> [pre\_step\_linux\_exec\_step\_config\_allowed\_success\_codes](#input\_pre\_step\_linux\_exec\_step\_config\_allowed\_success\_codes) | Defaults to [0]. A list of possible return values that the execution can return to indicate a success. | `list(number)` | <pre>[<br>  0,<br>  3<br>]</pre> | no |
| <a name="input_pre_step_linux_exec_step_config_local_path"></a> [pre\_step\_linux\_exec\_step\_config\_local\_path](#input\_pre\_step\_linux\_exec\_step\_config\_local\_path) | An absolute path to the executable on the VM. | `string` | `"/tmp/pre_patch_script.sh"` | no |
| <a name="input_pre_step_windows_exec_step_config_allowed_success_codes"></a> [pre\_step\_windows\_exec\_step\_config\_allowed\_success\_codes](#input\_pre\_step\_windows\_exec\_step\_config\_allowed\_success\_codes) | Defaults to [0]. A list of possible return values that the execution can return to indicate a success. | `list(number)` | <pre>[<br>  0,<br>  2<br>]</pre> | no |
| <a name="input_pre_step_windows_exec_step_config_interpreter"></a> [pre\_step\_windows\_exec\_step\_config\_interpreter](#input\_pre\_step\_windows\_exec\_step\_config\_interpreter) | The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are SHELL and POWERSHELL. | `string` | `"SHELL"` | no |
| <a name="input_pre_step_windows_exec_step_config_local_path"></a> [pre\_step\_windows\_exec\_step\_config\_local\_path](#input\_pre\_step\_windows\_exec\_step\_config\_local\_path) | An absolute path to the executable on the VM. | `string` | `"C:\\Users\\user\\pre-patch-script.cmd"` | no |
| <a name="input_recurring_schedule_time_of_day_hours"></a> [recurring\_schedule\_time\_of\_day\_hours](#input\_recurring\_schedule\_time\_of\_day\_hours) | Hours of day in 24 hour format. Should be from 0 to 23. | `number` | `0` | no |
| <a name="input_recurring_schedule_time_of_day_minutes"></a> [recurring\_schedule\_time\_of\_day\_minutes](#input\_recurring\_schedule\_time\_of\_day\_minutes) | Minutes of hour of day. Must be from 0 to 59. | `number` | `30` | no |
| <a name="input_recurring_schedule_time_of_day_nanos"></a> [recurring\_schedule\_time\_of\_day\_nanos](#input\_recurring\_schedule\_time\_of\_day\_nanos) | Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. | `number` | `20` | no |
| <a name="input_recurring_schedule_time_of_day_seconds"></a> [recurring\_schedule\_time\_of\_day\_seconds](#input\_recurring\_schedule\_time\_of\_day\_seconds) | Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds. | `number` | `30` | no |
| <a name="input_recurring_schedule_time_zone_id"></a> [recurring\_schedule\_time\_zone\_id](#input\_recurring\_schedule\_time\_zone\_id) | IANA Time Zone Database time zone, e.g. 'America/New\_York'. | `string` | `"America/New_York"` | no |
| <a name="input_rollout_disruption_budget_fixed"></a> [rollout\_disruption\_budget\_fixed](#input\_rollout\_disruption\_budget\_fixed) | Specifies a fixed value. | `number` | `1` | no |
| <a name="input_rollout_mode"></a> [rollout\_mode](#input\_rollout\_mode) | Mode of the patch rollout. Possible values are ZONE\_BY\_ZONE and CONCURRENT\_ZONES. | `string` | `"ZONE_BY_ZONE"` | no |
| <a name="input_windows_update_classifications"></a> [windows\_update\_classifications](#input\_windows\_update\_classifications) | Only apply updates of these windows update classifications. If empty, all updates are applied. | `list(string)` | <pre>[<br>  "CRITICAL",<br>  "SECURITY",<br>  "UPDATE"<br>]</pre> | no |
| <a name="input_yum_excludes"></a> [yum\_excludes](#input\_yum\_excludes) | List of packages to exclude from update. | `list(string)` | <pre>[<br>  "bash"<br>]</pre> | no |
| <a name="input_yum_minimal"></a> [yum\_minimal](#input\_yum\_minimal) | Will cause patch to run yum update-minimal instead. | `bool` | `true` | no |
| <a name="input_yum_security"></a> [yum\_security](#input\_yum\_security) | Adds the --security flag to yum update. | `bool` | `true` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Targets VM instances in ANY of these zones. | `list(string)` | <pre>[<br>  "us-central1-a",<br>  "us-central-1c"<br>]</pre> | no |
| <a name="input_zypper_categories"></a> [zypper\_categories](#input\_zypper\_categories) | Install only patches with these categories. Common categories include security, recommended, and feature. | `list(string)` | <pre>[<br>  "security"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | An identifier for the resource with format {{name}}. |
| <a name="output_last_execute_time"></a> [last\_execute\_time](#output\_last\_execute\_time) | The last time a patch job was started by this deployment. |
| <a name="output_name"></a> [name](#output\_name) | Unique name for the patch deployment resource in a project. |
