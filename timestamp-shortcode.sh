#!/bin/bash

# Encloses timestamps in the form [nn:nn:nn] with the timestamp shortcode

filename=$1

sed -i '' 's/\(\[..:..:..]\)/{{< timestamp "\1" >}}/g' $filename
