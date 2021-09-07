# Os Config Patch Deployment Full - Terraform

Use OS patch management to apply operating system patches across a set of Compute Engine VM instances (VMs). Long running VMs require periodic system updates to protect against defects and vulnerabilities.<br>
A patch deployment is initiated by making a call to the Patch API (also known as the Cloud OS Config API). This can be done by using either the Google Cloud Console, gcloud command-line tool, or a direct API call. Then the Patch API notifies the OS Config agent that is running on the target VMs to start patching.

This module allows easy creation of os config patch deployment.

The resources that this module will create/trigger are:

- Patch deployment, which automates the operating system and software patch update process. A patch deployment schedules patch jobs. A patch job runs across VM instances and applies patches.

## Usage

Basic usage of this module is as follows:

```hcl
module "os_config_patch_deployment_full" {
  source                                                          = "../modules"
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
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apt\_excludes | List of packages to exclude from update. | `list(string)` | <pre>[<br>  "python"<br>]</pre> | no |
| apt\_type | By changing the type to DIST, the patching is performed using apt-get dist-upgrade instead. | `string` | `"DIST"` | no |
| duration | Duration of the patch. After the duration ends, the patch times out. A duration in seconds with up to nine fractional digits, terminated by 's'. | `string` | `"10s"` | no |
| goo\_enabled | goo update settings. Use this setting to override the default goo patch rules. | `bool` | `true` | no |
| instance\_name\_prefixes | Targets VMs whose name starts with one of these prefixes. | `list(string)` | <pre>[<br>  "test-"<br>]</pre> | no |
| labels | Targets VM instances matching ANY of these GroupLabels. | `map(string)` | <pre>{<br>  "app": "web",<br>  "env": "dev"<br>}</pre> | no |
| monthly\_week\_day\_of\_month\_day\_of\_week | A day of the week. Possible values are MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, and SUNDAY. | `string` | `"TUESDAY"` | no |
| monthly\_week\_day\_of\_month\_week\_ordinal | Week number in a month. 1-4 indicates the 1st to 4th week of the month. -1 indicates the last week of the month. | `number` | `-1` | no |
| patch\_reboot\_config | Post-patch reboot settings. | `string` | `"ALWAYS"` | no |
| post\_step\_linux\_exec\_step\_config\_gcs\_object\_bucket | Bucket of the Cloud Storage object. | `string` | `"my-patch-scripts"` | no |
| post\_step\_linux\_exec\_step\_config\_gcs\_object\_generation\_number | Generation number of the Cloud Storage object. This is used to ensure that the ExecStep specified by this PatchJob does not change. | `string` | `"1523477886880"` | no |
| post\_step\_linux\_exec\_step\_config\_gcs\_object\_object | Name of the Cloud Storage object. | `string` | `"linux/post_patch_script"` | no |
| post\_step\_windows\_exec\_step\_config\_gcs\_object\_bucket | Bucket of the Cloud Storage object. | `string` | `"my-patch-scripts"` | no |
| post\_step\_windows\_exec\_step\_config\_gcs\_object\_generation\_number | Generation number of the Cloud Storage object. This is used to ensure that the ExecStep specified by this PatchJob does not change. | `string` | `"135920493447"` | no |
| post\_step\_windows\_exec\_step\_config\_gcs\_object\_object | Name of the Cloud Storage object. | `string` | `"windows/post_patch_script.ps1"` | no |
| post\_step\_windows\_exec\_step\_config\_interpreter | The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are SHELL and POWERSHELL. | `string` | `"POWERSHELL"` | no |
| pre\_step\_linux\_exec\_step\_config\_allowed\_success\_codes | Defaults to [0]. A list of possible return values that the execution can return to indicate a success. | `list(number)` | <pre>[<br>  0,<br>  3<br>]</pre> | no |
| pre\_step\_linux\_exec\_step\_config\_local\_path | An absolute path to the executable on the VM. | `string` | `"/tmp/pre_patch_script.sh"` | no |
| pre\_step\_windows\_exec\_step\_config\_allowed\_success\_codes | Defaults to [0]. A list of possible return values that the execution can return to indicate a success. | `list(number)` | <pre>[<br>  0,<br>  2<br>]</pre> | no |
| pre\_step\_windows\_exec\_step\_config\_interpreter | The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are SHELL and POWERSHELL. | `string` | `"SHELL"` | no |
| pre\_step\_windows\_exec\_step\_config\_local\_path | An absolute path to the executable on the VM. | `string` | `"C:\\Users\\user\\pre-patch-script.cmd"` | no |
| project | Project sample project id. | `string` | `N/A` | Yes |
| recurring\_schedule\_time\_of\_day\_hours | Hours of day in 24 hour format. Should be from 0 to 23. | `number` | `0` | no |
| recurring\_schedule\_time\_of\_day\_minutes | Minutes of hour of day. Must be from 0 to 59. | `number` | `30` | no |
| recurring\_schedule\_time\_of\_day\_nanos | Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. | `number` | `20` | no |
| recurring\_schedule\_time\_of\_day\_seconds | Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds. | `number` | `30` | no |
| recurring\_schedule\_time\_zone\_id | IANA Time Zone Database time zone, e.g. 'America/New\_York'. | `string` | `"America/New_York"` | no |
| rollout\_disruption\_budget\_fixed | Specifies a fixed value. | `number` | `1` | no |
| rollout\_mode | Mode of the patch rollout. Possible values are ZONE\_BY\_ZONE and CONCURRENT\_ZONES. | `string` | `"ZONE_BY_ZONE"` | no |
| windows\_update\_classifications | Only apply updates of these windows update classifications. If empty, all updates are applied. | `list(string)` | <pre>[<br>  "CRITICAL",<br>  "SECURITY",<br>  "UPDATE"<br>]</pre> | no |
| yum\_excludes | List of packages to exclude from update. | `list(string)` | <pre>[<br>  "bash"<br>]</pre> | no |
| yum\_minimal | Will cause patch to run yum update-minimal instead. | `bool` | `true` | no |
| yum\_security | Adds the --security flag to yum update. | `bool` | `true` | no |
| zones | Targets VM instances in ANY of these zones. | `list(string)` | <pre>[<br>  "us-central1-a",<br>  "us-central-1c"<br>]</pre> | no |
| zypper\_categories | Install only patches with these categories. Common categories include security, recommended, and feature. | `list(string)` | <pre>[<br>  "security"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| output\_id | An identifier for the resource with format {{name}}. |
| name | Unique name for the patch deployment resource in a project. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### IAM

Service account or user credentials with the following roles must be used to provision the resources of this module:

- PatchDeployment Admin: `roles/osconfig.patchDeploymentAdmin` to create os config patch deployment

### API

- Enable `VM Manager (OS Config API)`.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->