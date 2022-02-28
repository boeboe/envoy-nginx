#!/bin/bash

echo "Starting envoy"
exec envoy -c /etc/envoy/envoy.yaml
