# Extcap binary for capturing bluetooth packets from Android devices

## Installation

```sh
$ cargo build --release
$ cp target/release/btsnoop-extcap ~/.config/wireshark/extcap
```

Root is required on the selected Android device.

This extcap plugin is designed to be used with [Wireshark](https://www.wireshark.org/) or tshark,
and will show a live stream of Bluetooth HCI events from the selected device.

Detected devices are shown in Wireshark's __Capture__ interface list.

<img width="1462" alt="wireshark" src="https://user-images.githubusercontent.com/1264702/216287342-c0d7a30c-0fa0-4acd-a535-f95323427eca.png">

## Instructions to turn on btsnoop log capturing

1. Enable __Developer options__ on the device.
2. In the __Developer options__ menu, activate the __Enable Bluetooth HCI snoop log__ toggle.
3. Restart Bluetooth for logging to take effect.
4. Run `adb root`