#!/bin/bash
# Fix Debian Buster repositories inside containers only
# This script updates sources.list to use archive.debian.org

echo "Checking if this is a Debian Buster system..."
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$VERSION_CODENAME" == "buster" ]] || [[ "$VERSION" == *"buster"* ]]; then
        echo "Detected Debian Buster - fixing repositories..."
        
        # Backup original
        cp /etc/apt/sources.list /etc/apt/sources.list.original
        
        # Replace with working archived repositories
        cat > /etc/apt/sources.list << 'REPOS'
# Debian 10 Buster (archived repositories)
deb http://archive.debian.org/debian buster main contrib non-free
deb http://archive.debian.org/debian buster-updates main contrib non-free

# Note: Security updates no longer available for EOL Debian Buster
# This is intentional for penetration testing labs with vulnerable software
REPOS
        
        echo "✓ Updated repositories to use archive.debian.org"
        echo "✓ Old vulnerable software versions preserved for security testing"
    else
        echo "Not Debian Buster, skipping repository fix"
    fi
else
    echo "Cannot detect OS version, skipping"
fi
