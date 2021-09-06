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

output "id" {
  description = "An identifier for the resource with format {{name}}."
  value       = module.os_config_patch_deployment_full.id
}

output "name" {
  description = "Unique name for the patch deployment resource in a project."
  value       = module.os_config_patch_deployment_full.name
}

output "last_execute_time" {
  description = "The last time a patch job was started by this deployment."
  value       = module.os_config_patch_deployment_full.last_execute_time
}