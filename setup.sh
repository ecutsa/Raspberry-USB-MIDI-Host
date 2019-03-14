#/bin/bash
sudo su
cat > /usr/local/bin/connectall.sh << \EOF
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

chmod +x /usr/local/bin/connectall.sh

echo '"ACTION=="add|remove", SUBSYSTEM=="usb", DRIVER=="usb", RUN+="/usr/local/bin/connectall.rb"' > /etc/udev/rules.d/33-midiusb.rules
udevadm control --reload
service udev restart
cat > /lib/systemd/system/midi.service << \EOF
[Unit]
Description=Initial USB MIDI connect

[Service]
ExecStart=/usr/local/bin/connectall.rb

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable midi.service
systemctl start midi.service
