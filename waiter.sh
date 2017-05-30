#!/bin/sh

# Configure Flynn.
echo "Configuring Flynn CLI.";
flynn cluster remove default;
flynn cluster add --no-git -p $FLYNN_CERTIFICATE_PIN default $FLYNN_DOMAIN $FLYNN_KEY;

echo "Will backup every hour.";

while true; do
  sh ./backup.sh || true;
  sleep 3600;
done