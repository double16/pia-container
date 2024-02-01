#
# Configure return route to host
#
return_route() {
    local network="$1" gw="$(ip route |awk '/default/ {print $3}')"
    ip route | grep -q "$network" ||
        ip route add to $network via $gw dev eth0
    iptables -A INPUT -s $network -j ACCEPT
    iptables -A FORWARD -d $network -j ACCEPT
    iptables -A FORWARD -s $network -j ACCEPT
    iptables -A OUTPUT -d $network -j ACCEPT
}

if [[ -n "${HOST_NETWORK}" ]] && ! iptables-save | grep -q "${HOST_NETWORK}"; then
    return_route "${HOST_NETWORK}"
fi
