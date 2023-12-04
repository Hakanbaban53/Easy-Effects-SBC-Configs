#!/usr/bin/env bash
# This script automatically detect the EasyEffects presets directory and installs the presets

SBCGIT_REPOSITORY="https://raw.githubusercontent.com/Hakanbaban53/Easy-Effects-SBC-Configs"

check_installation() {
    if command -v flatpak &>/dev/null && flatpak list | grep -q "com.github.wwmm.easyeffects"; then
        PRESETS_DIRECTORY="$HOME/.var/app/com.github.wwmm.easyeffects/config/easyeffects"
    elif which easyeffects >/dev/null; then
        PRESETS_DIRECTORY="$HOME/.config/easyeffects"
    else
        echo "Error! Couldn't find EasyEffects presets directory!"
        exit 1
    fi
    mkdir -p $PRESETS_DIRECTORY
}


read_choice() {
    while :; do
        read -r CHOICE
        if [ -z "$CHOICE" ]; then
            CHOICE=1 #default
        fi
        if [[ $CHOICE =~ ^[1-6]+$ ]]; then
            break
        fi
        echo "Invalid option! Please input a value between 1 and 5!"
    done
}

install_menu() {
    echo "Please select an option for presets installation (Default=1)"
    echo "1) Install irs, Perfect EQ and Sound Blaster Cinema presets"
}

install_presets() {
    case $CHOICE in
    1)
        echo "Installing Bass Enhancing + Perfect EQ preset..."
        curl "$IRLGIT_REPOSITORY/Bass%20Enhancing%20%2B%20Perfect%20EQ.json" --output "$PRESETS_DIRECTORY/output/Bass Enhancing + Perfect EQ.json" --silent
        echo "Installing SBC Gaming Present..."
        curl "$SBCGIT_REPOSITORY/Gaming.json" --output "$PRESETS_DIRECTORY/output/Gaming.json" --silent
        echo "Installing SBC Music Present..."
        curl "$SBCGIT_REPOSITORY/Gaming.json" --output "$PRESETS_DIRECTORY/output/Music.json" --silent
        echo "Installing SBC Movie Present..."
        curl "$SBCGIT_REPOSITORY/Gaming.json" --output "$PRESETS_DIRECTORY/output/Movie.json" --silent
        ;;
   
    esac

}

check_installation
install_menu
read_choice
install_presets