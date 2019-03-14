# Raspberry-USB-MIDI-Host

---


description: Voici quelques instructions pour configurer un Raspberry Pi comme hôte MIDI pour un équipement musical USB.
---
## LE BUT (ZIDANE)

Synchroniser différents appareils USB sur le protocole MIDI.
En gros faire un peu le taff de l'OP-Lab mais en DIY (je pense qu'il y a moyen d'utiliser la sortie mini-jack pour un CV-Out).

## CE DONT NOUS AVONS BESOIN

- un raspberry pi avec [raspbian](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)
- une carte SD (minimum 2go)
- un chargeur d'alimentation micro USB, envoyant au moins 2A (la plupart des chargeurs d'alimentation des smartphones modernes suffisent)
- un accès [ssh au raspberry](https://www.raspberrypi.org/documentation/remote-access/ssh/) (une fois l'installation terminée, il n'est plus nécessaire)
- des périphériques USB/MIDI pour tester

## CONFIGURATION DE LA CONNEXION MIDI AUTOMATIQUE

```
apt install git -y
git clone https://github.com/ecutsa/Raspberry-USB-MIDI-Host.git
./Raspberry-USB-MIDI-Host/setup.sh
```

 Pour tester la connexion automatique, vous pouvez utiliser la commande ``aconnect -l``

## ACTIVATION DU MODE LECTURE SEULE
Une fois l'installation terminée, il est conseillé d'activer la lecture seule de le raspberry pour éviter la possibilité de corruption des données lors du débranchement VNR de la source d'alimentation.

```
git clone https://gitlab.com/larsfp/rpi-readonly
sudo ./rpi-readonly/setup.sh
```

Une fois votre configuration testée (essayez de brancher et débrancher divers périphériques MIDI, et testez la connexion avec la commande `aconnect -l`), vous pouvez activer le mode lecture seule avec la commande `ro`. Vous pouvez maintenant éteindre l'appareil en toute sécurité en le débranchant de la source d'alimentation.

Pour modifier des fichiers, vous pouvez désactiver le mode lecture seule avec la commande `rw`. N'oubliez pas de le remettre à `ro` avant de vous déconnecter.

## VOILÀ

J'ai pu tester avec une Fireface 6i6, un OP-1 et un OP-Z. Si vous rencontrez un quelconque soucis n'hésitez pas a soumettre une [issue sur le Github](https://github.com/ecutsa/Raspberry-USB-MIDI-Host/issues).

Sources:

- Original Ruby Script:  http://m635j520.blogspot.com/2017/01/using-raspberry-pi-as-midi-usb5-pin.html

- Full Tuto (bluetooth + OLED): https://neuma.studio/rpi-as-midi-host.html

