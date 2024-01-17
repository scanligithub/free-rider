#!/bin/bash

tailnet="example.com"
# Replace with a path to your Tailscale API key.
apikey=tskey-api-kmFNNv6CNTRL-LknwqGVVuK2foXf2TEbNL2XYVG5G29vWf
targetname=ljc-tailscale-host

curl -s "https://api.tailscale.com/api/v2/tailnet/$tailnet/devices" -u "$apikey:" |jq -r '.devices[] |  "\(.id) \(.name)"' |
  while read id name; do
    if [[ $name = *"$targetname"* ]]
    then
      echo $name $id " includes " $name " in its name - getting rid of it"
      curl -s -X DELETE "https://api.tailscale.com/api/v2/device/$id" -u "$apikey:"
    else
      echo $name" does not have that string in its name, keeping it"
    fi
  done
