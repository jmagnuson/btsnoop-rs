# Extcap binary for capturing bluetooth packets from Android devices

[![Build status](https://github.com/mauricelam/btsnoop-rs/workflows/ci/badge.svg)](https://github.com/mauricelam/btsnoop-rs/actions)
[![Crates.io](https://img.shields.io/crates/v/btsnoop-extcap.svg)](https://crates.io/crates/btsnoop-extcap)

## Installation

```sh
$ cargo install btsnoop-extcap

# Running btsnoop-extcap from command line is not part of the normal workflow,
# but it will print out installation instructions. For example:
$ btsnoop-extcap
Unknown extcap phase. This is an extcap plugin meant to be used with Wireshark or tshark.
To install this plugin for use with Wireshark, symlink or copy this executable
to your Wireshark extcap directory
    mkdir -p ~/.config/wireshark/extcap/ && \
    ln -s "~/.cargo/bin/btsnoop-extcap" ~/.config/wireshark/extcap/btsnoop-extcap

# Run the symlink command in the error message
$ mkdir -p ~/.config/wireshark/extcap/ && \
  ln -s "~/.cargo/bin/btsnoop-extcap" ~/.config/wireshark/extcap/btsnoop-extcap
```

_Root is required on the selected Android device._

This extcap plugin is designed to be used with [Wireshark](https://www.wireshark.org/) or tshark,
and will show a live stream of Bluetooth HCI events from the selected device.

Detected devices are shown in Wireshark's __Capture__ interface list.

<img width="1462" alt="wireshark" src="https://user-images.githubusercontent.com/1264702/216287342-c0d7a30c-0fa0-4acd-a535-f95323427eca.png">

## Instructions to turn on btsnoop log capturing

#### Option 1

1. In Wireshark, open the toolbar View > Interface Toolbars > Android btsnoop
2. Select the btsnoop interface in the main Wireshark window
3. Click "Turn on BT logging" in the toolbar

#### Option 2

1. Enable __Developer options__ on the device.
2. In the __Developer options__ menu, activate the __Enable Bluetooth HCI snoop log__ toggle.
3. Restart Bluetooth for logging to take effect.

## Relationship with `androiddump`

Wireshark has `androiddump` as one of the included extcap implementations. It is
based on an old configuration in Android that forwarded the btsnoop logs to port
8872, which was
[disabled](https://android.googlesource.com/platform/packages/modules/Bluetooth/+/4dcaa4646c0a44300a727e332859f518a08f6085)
in 2015. While it can be turned back on by changing the source code, recompiling
Android is incovenient in some cases.

Meanwhile, Android continues to provide the option to write the HCI logs to a
local log file (in the `/system` partition, so root access is required to read
it), and that is what this extcap uses as the packet source.
