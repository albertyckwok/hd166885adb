resource "oci_database_autonomous_container_database" "test_autonomous_container_database" {
  autonomous_vm_cluster_id = data.oci_database_autonomous_vm_clusters.test_autonomous_vm_clusters.autonomous_vm_clusters[0].id
  # Need to ignore vm id in case we move other vm for DG lab
  lifecycle {
    ignore_changes = [autonomous_vm_cluster_id, defined_tags]
  }
  display_name = "e${local.ecc_num}c${local.clu_num}cdb${local.cdb_num}"
  patch_model  = "RELEASE_UPDATES"

  backup_config {
    recovery_window_in_days = 7
    backup_destination_details {
      type = "LOCAL"
    }
  }
  compartment_id = data.oci_identity_compartment.fleet_compartment.id
}

resource "oci_database_autonomous_database" "test_autonomous_database" {
  count = var.db_count
  #Required
  compartment_id           = var.compartment_ocid
  cpu_core_count           = "1"
  data_storage_size_in_tbs = "1"
  # Prevent change of items that is done as specified in the lab
  lifecycle {
    ignore_changes = [cpu_core_count, data_storage_size_in_tbs, defined_tags]
  }
  db_name        = "e${local.ecc_num}c${local.clu_num}f${local.cdb_num}a${local.adb_num}db${count.index}"
  display_name   = "e${local.ecc_num}c${local.clu_num}f${local.cdb_num}a${local.adb_num}db${count.index}"
  admin_password           = "BEstr0ng###${count.index}"

  #Optional
  autonomous_container_database_id = oci_database_autonomous_container_database.test_autonomous_container_database.id
  db_workload                      = "OLTP"
  is_dedicated                     = "true"
}

