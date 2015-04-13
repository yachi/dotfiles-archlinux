#!/usr/bin/env bash
set -e
sudo -v
sudo ln -sf /etc/ssl/certs/CNNIC_ROOT.pem /etc/ca-certificates/trust-source/blacklist/
sudo ln -sf /etc/ssl/certs/*China* /etc/ca-certificates/trust-source/blacklist/
sudo ln -sf /etc/ssl/certs/WoSign*  /etc/ca-certificates/trust-source/blacklist
sudo update-ca-trust
