#!/bin/bash

curl -s -G 'https://arxiv.org/search/' \
     --data-urlencode "query=$*" \
     -d 'searchtype=all' \
  | tr -d '\n' \
  | tr '<' '\n' \
  | grep -o 'href="https://arxiv.org/abs/[^"]*"' \
  | sed -e 's|.*/abs/||' -e 's|"$||' -e 's|v[0-9]*$||' \
  | sort -u
