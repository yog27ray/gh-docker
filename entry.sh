#!/bin/sh
cd /root || exit
mkdir -p .config/gh
cd .config/gh || exit
if [ "$PLUGIN_TOKEN" = "" ] || [ "$PLUGIN_USER" = "" ]; then
  exec "$@"
  exit 0;
fi
if [ "$PLUGIN_PROTOCOL" = "" ]; then
  PLUGIN_PROTOCOL='https'
fi
echo "github.com:" > hosts.yml
echo "    oauth_token: $PLUGIN_TOKEN" >> hosts.yml
echo "    git_protocol: $PLUGIN_PROTOCOL" >> hosts.yml
echo "    user: $PLUGIN_USER" >> hosts.yml

exec "$@"
