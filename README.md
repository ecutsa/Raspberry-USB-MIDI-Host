# Raspberry-USB-MIDI-Host

---


description: Here are some instructions for setting up a Raspberry Pi as a MIDI host for USB music equipment.
---
## THE GOAL (ZIDANE)

Synchronize different USB devices to the MIDI protocol.
Basically do a little bit of OP-Lab taffing but in DIY (I think there is a way to use the mini-jack output for a CV-Out).
It also allows to synchronize MIDI USB and MIDI DIN.



## WHAT WE NEED

- a raspberry pi with [raspbian](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)
- an SD card (minimum 2GB)
- a micro USB power charger, sending at least 2A (most modern smartphone power chargers are sufficient)
- [ssh access to raspberry](https://www.raspberrypi.org/documentation/remote-access/ssh/) (once the installation is complete, it is no longer necessary)
- USB/MIDI devices for testing


## CONFIGURATION OF THE AUTOMATIC MIDI CONNECTION

```
apt install git -y
git clone https://github.com/ecutsa/Raspberry-USB-MIDI-Host.git
./Raspberry-USB-MIDI-Host/setup.sh
```

 To test the automatic connection, you can use the command ``aconnect -l``

## ACTIVATING READ-ONLY MODE
Once the installation is complete, it is recommended to enable read-only on the raspberry to avoid the possibility of data corruption when disconnecting from the power source.

```
git clone https://gitlab.com/larsfp/rpi-readonly
sudo ./rpi-readonly/setup.sh
```

Once your configuration has been tested (try plugging in and out various MIDI devices, and test the connection with the `aconnect -l` command), you can activate read-only mode with the `ro` command. You can now safely turn off the unit by disconnecting it from the power source.

To edit files, you can disable read-only mode with the `rw` command. Don't forget to turn it back on before you disconnect.

## VOILÀ

I was able to test with a Fireface 6i6, an OP-1 and an OP-Z. If you encounter any concerns do not hesitate to submit a [issue on the Github](https://github.com/ecutsa/Raspberry-USB-MIDI-Host/issues).

Sources:

- Original Ruby Script:  http://m635j520.blogspot.com/2017/01/using-raspberry-pi-as-midi-usb5-pin.html

- Full Tuto (bluetooth + OLED): https://neuma.studio/rpi-as-midi-host.html
