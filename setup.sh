#!/bin/bash
cat > /tmp/connectall.sh << \EOF
#!/bin/bash
client=$(aconnect -l | grep card | cut -d' ' -f2 | sed 's/[^0-9]*//g')
for i in $client
do
        if [[ "$i" == '0' ]]; then
                continue
        fi
        for j in $client
        do
                if [ $j == '0' ] || [ $i == $j ]; then
                        continue
                fi
                aconnect $i:0 $j:0
        done
done
EOF
chmod +x /tmp/connectall.sh
sudo mv /tmp/connectall.sh /usr/local/bin/connectall.sh

echo 'ACTION=="add|remove", SUBSYSTEM=="usb", DRIVER=="usb", RUN+="/usr/local/bin/connectall.sh"' > /tmp/33-midiusb.rules
sudo mv /tmp/33-midiusb.rules /etc/udev/rules.d/
sudo udevadm control --reload
sudo service udev restart
cat > /tmp/midi.service << \EOF
[Unit]
Description=Initial USB MIDI connect

[Service]
ExecStart=/usr/local/bin/connectall.sh

[Install]
WantedBy=multi-user.target
EOF
sudo mv /tmp/midi.service /lib/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable midi.service
sudo systemctl start midi.service

