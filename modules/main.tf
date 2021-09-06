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

locals {
  name_suffix = random_pet.suffix.id
}

resource "random_pet" "suffix" {
  length = 2
}

resource "google_os_config_patch_deployment" "patch" {
  patch_deployment_id = "patch-deploy-inst-${local.name_suffix}"
  project             = var.project
  instance_filter {
    group_labels {
      labels = var.labels
    }

    instance_name_prefixes = var.instance_name_prefixes

    zones = var.zones
  }

  patch_config {
    reboot_config = var.patch_reboot_config

    apt {
      type     = var.apt_type
      excludes = var.apt_excludes
    }

    yum {
      security = var.yum_security
      minimal  = var.yum_minimal
      excludes = var.yum_excludes
    }

    goo {
      enabled = var.goo_enabled
    }

    zypper {
      categories = var.zypper_categories
    }

    windows_update {
      classifications = var.windows_update_classifications
    }

    pre_step {
      linux_exec_step_config {
        allowed_success_codes = var.pre_step_linux_exec_step_config_allowed_success_codes
        local_path            = var.pre_step_linux_exec_step_config_local_path
      }

      windows_exec_step_config {
        interpreter           = var.pre_step_windows_exec_step_config_interpreter
        allowed_success_codes = var.pre_step_windows_exec_step_config_allowed_success_codes
        local_path            = var.pre_step_windows_exec_step_config_local_path
      }
    }

    post_step {
      linux_exec_step_config {
        gcs_object {
          bucket            = var.post_step_linux_exec_step_config_gcs_object_bucket
          generation_number = var.post_step_linux_exec_step_config_gcs_object_generation_number
          object            = var.post_step_linux_exec_step_config_gcs_object_object
        }
      }

      windows_exec_step_config {
        interpreter = var.post_step_windows_exec_step_config_interpreter
        gcs_object {
          bucket            = var.post_step_windows_exec_step_config_gcs_object_bucket
          generation_number = var.post_step_windows_exec_step_config_gcs_object_generation_number
          object            = var.post_step_windows_exec_step_config_gcs_object_object
        }
      }
    }
  }

  duration = var.duration

  recurring_schedule {
    time_zone {
      id = var.recurring_schedule_time_zone_id
    }

    time_of_day {
      hours   = var.recurring_schedule_time_of_day_hours
      minutes = var.recurring_schedule_time_of_day_minutes
      seconds = var.recurring_schedule_time_of_day_seconds
      nanos   = var.recurring_schedule_time_of_day_nanos
    }

    monthly {
      week_day_of_month {
        week_ordinal = var.monthly_week_day_of_month_week_ordinal
        day_of_week  = var.monthly_week_day_of_month_day_of_week
      }
    }
  }

  rollout {
    mode = var.rollout_mode
    disruption_budget {
      fixed = var.rollout_disruption_budget_fixed
    }
  }
}