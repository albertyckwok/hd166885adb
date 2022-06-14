locals { 
    ecc_num = substr(data.oci_identity_compartment.exa_compartment.name, -1, 1)
    clu_num = substr(data.oci_identity_compartment.cluster_compartment.name, -1, 1)
    cdb_num = substr(data.oci_identity_compartment.fleet_compartment.name, -1, 1)
    adb_num = substr(data.oci_identity_compartment.adb_compartment.name, -1, 1)
}
#Great-Grandparent Compartment for Exa infra
data "oci_identity_compartment" "exa_compartment" {
    id = data.oci_identity_compartment.cluster_compartment.compartment_id
}
#Grandparent Compartment for VM Cluster
data "oci_identity_compartment" "cluster_compartment" {
    id = data.oci_identity_compartment.fleet_compartment.compartment_id
}
#Parent Compartment for Fleet/Container DB
data "oci_identity_compartment" "fleet_compartment" {
    id = data.oci_identity_compartment.adb_compartment.compartment_id
}
#Get current Compartment is for ADB's
data "oci_identity_compartment" "adb_compartment" {
    id = var.compartment_ocid
}
output fleet_compartment {
    value = data.oci_identity_compartment.fleet_compartment.name
}
output adb_compartment {
    value = data.oci_identity_compartment.adb_compartment.name
}
output autonomous_vm_cluster {
    value = data.oci_database_autonomous_vm_clusters.test_autonomous_vm_clusters.autonomous_vm_clusters[*].display_name
}