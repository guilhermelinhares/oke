#!/bin/sh

# === OCI Configuration ===
export TF_VAR_tenancy_ocid="<your-tenancy-ocid>"
export TF_VAR_user_ocid="<your-user-ocid>"
export TF_VAR_fingerprint="<your-api-key-fingerprint>"
export TF_VAR_private_key_path="$HOME/.oci/oci_api_key.pem"

# === SSH Public Key ===
export TF_VAR_ssh_public_key=$(cat ssh/id_rsa.pub)

# === OCI Profile (Optional) ===
export TF_VAR_oci_profile="DEFAULT"

echo "[✓] Environment variables exported successfully!"