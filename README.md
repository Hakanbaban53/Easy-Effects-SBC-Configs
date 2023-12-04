### Easy Effects SBC Configs
 Sound blaster configs for Easy Effects

 **These files were made by extracting the settings in Sound blaster cinema 5, 6 and 6+ applications.**

A collection of presets for [wwmm's EasyEffects](https://github.com/wwmm/EasyEffects)

It currently contains:

1. **Perfect EQ**

   This preset only enables [Ziyad Nazem's __"Perfect EQ"__](https://www.ziyadnazem.com/post/956431457/the-perfect-eq-settings-unmasking-the-eq)


## Auto Installation
The `install.sh` script will try to install the presets automatically, just fire up a terminal and run the command:
```shell
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hakanbaban53/Easy-Effects-SBC-Configs/master/install.sh)"
```
**NOTE**: the script requires `curl` to be installed.If you haven't installed curl yet, you have to first run

# Ubuntu/Debian
```
sudo apt install curl
```

# Arch
```
sudo pacman -S curl
```

before running the script.

## Manual installation
Just clone the repository and then copy the `.json` files into the `EasyEffects/output` directory which you can find in the local `config` directory. Obviously the location of that directory depends on how you installed EasyEffects. If you installed it through Flatpak, you can find it in `~/.var/app/com.github.wwmm.easyeffects/config/easyeffects`, or if you used the PPA for Ubuntu (or the AUR package for Arch) it should be `~/.config/easyeffects`