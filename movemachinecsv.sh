for id in $(cat nodes.csv); 
do echo $id; 
curl -X DELETE "https://api.tailscale.com/api/v2/device/${id}" -u "$(cat ~/keys/tskey):"; 
sleep 0.1;
done
