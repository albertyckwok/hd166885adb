#!/bin/bash
export TF_VAR_region="us-ashburn-1"
echo Using Compartment /ExaCC/ExaCC5/ExaCCVM8/c8CDB/c8ADB
export TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaaaaaaats5fijnehawsg5kke3epg3xrp22ljysdrvvxvvxk2zep4qszmunq"
#Note: the index is not in order, see output for actual ordering to pick the right server
echo Make sure to reset the following that match the tenancy
echo export TF_VAR_user_ocid=
echo 'set |grep TF_VAR'
### Authentication details that is user specific so it should be in .profile
#export TF_VAR_tenancy_ocid="<tenancy OCID>"
#export TF_VAR_user_ocid="<user OCID>"
#export TF_VAR_fingerprint="<PEM key fingerprint>"
#export TF_VAR_private_key_path="<path to the private key that matches the fingerprint above>"
