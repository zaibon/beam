# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

# Random string generator resource. To generate source code buckets name
resource "random_string" "id" {
  length = 4
  upper = false
  special = false
}

# Variable for prefix. Used in generated source code buckets name
variable "resource_name_prefix" {
  type = string
  description = "The resource name prefix applied to all resource naming for the application"
  default = "tour-of-beam"
}

# Local value to store generated GCS bucket name for source code (Cloud Functions)
locals {
  cloudfunctions_bucket = "${var.resource_name_prefix}-cfstorage-${random_string.id.result}"
}