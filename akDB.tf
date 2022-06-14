variable "ak_db_count" {
  description = "Number of database created by ak"
  default=1
}
resource "oci_database_autonomous_database" "ak_autonomous_database" {
  count = var.ak_db_count
  #Required
  compartment_id           = var.compartment_ocid
  cpu_core_count           = "0.1"
  data_storage_size_in_tbs = "1"
  db_name                  = "akADB${count.index}"
  display_name             = "akADB${count.index}"
  admin_password           = "BEstr0ng###${count.index}"

  #Optional
  autonomous_container_database_id = oci_database_autonomous_container_database.test_autonomous_container_database.id
  db_workload                      = "OLTP"
  is_dedicated                     = "true"
}
