#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

echo "daemon off;" >> /etc/nginx/nginx.conf

sed -i "s/SERVER_NAME/${SERVER_NAME}/g" /etc/nginx/conf.d/proxy.conf
sed -i "s/AUTH_HOST/${AUTH_HOST}/g" /etc/nginx/conf.d/proxy.conf

/usr/sbin/nginx
