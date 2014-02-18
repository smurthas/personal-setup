packer build \
  -var "do_client_id=$DO_CLIENT_ID" \
  -var "do_api_key=$DO_API_KEY" \
  -var "new_relic_license_key=$NEW_RELIC_LICENSE_KEY" \
  ubuntu.json
