#! /usr/bin/env bash

# Run this script to generate a debug version of the extcap executable, which enables debug
# logging and writes them to /tmp/btsnoop-extcap.log.

set -ex

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cat <<EOF > ~/.config/wireshark/extcap/btsnoop-extcap
#! /usr/bin/env bash
# Use exec to make sure the rust program will get SIGTERM from wireshark when stopping
exec $SCRIPT_DIR/../target/debug/btsnoop-extcap "\$@"
EOF
chmod +x ~/.config/wireshark/extcap/btsnoop-extcap
