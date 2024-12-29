# exit on errror
set -e

# update and install
apt update

# remove cache
rm -rf /var/lib/apt/lists/*
