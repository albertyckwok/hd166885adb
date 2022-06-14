variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "region" {}
variable "db_count" {
  description = "Number of Database to create"
  type = number
  default = 0
}
