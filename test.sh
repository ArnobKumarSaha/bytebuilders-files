#!/bin/bash

DATABASE="MongoDB MySQL MariaDB"

# arr=(${DATABASE})
arr=(`echo ${DATABASE}`);

echo "==> ${arr[@]}"

for db in ${arr[@]}; do \
    echo "Processing database: $db"; \
    # Add your commands here for each database entry \
done