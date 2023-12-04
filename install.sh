#!/usr/bin/env bash
# This script automatically detect the EasyEffects presets directory and installs the presets

IRLGIT_REPOSITORY="https://raw.githubusercontent.com/JackHack96/EasyEffects-Presets/master"
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

check_impulse_response_directory() {
    if [ ! -d "$PRESETS_DIRECTORY/irs" ]; then
        mkdir "$PRESETS_DIRECTORY/irs"
    fi
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
        echo "Installing impulse response files..."
        curl "$IRLGIT_REPOSITORY/irs/Dolby%20ATMOS%20((128K%20MP3))%201.Default.irs" --output "$PRESETS_DIRECTORY/irs/Dolby ATMOS ((128K MP3)) 1.Default.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/MaxxAudio%20Pro%20((128K%20MP3))%204.Music%20w%20MaxxSpace.irs" --output "$PRESETS_DIRECTORY/irs/MaxxAudio Pro ((128K MP3)) 4.Music w MaxxSpace.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Razor%20Surround%20((48k%20Z-Edition))%202.Stereo%20+20%20bass.irs" --output "$PRESETS_DIRECTORY/irs/Razor Surround ((48k Z-Edition)) 2.Stereo +20 bass.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20Earpods%20HIFI.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) Earpods HIFI.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20MDR-E9LP%20HIFI.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) MDR-E9LP HIFI.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20MDR-E9LP%20SM%20SRH940.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) MDR-E9LP SM SRH940.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20MDR-E9LP%20SM%20XBA3.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) MDR-E9LP SM XBA3.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20MDR-E9LP%20SM%20beyerT1.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) MDR-E9LP SM beyerT1.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20MDR-XB500%20HIFI.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) MDR-XB500 HIFI.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20XBA-H3%20HIFI.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) XBA-H3 HIFI.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20XBA-H3%20SM%20SRH940.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) XBA-H3 SM SRH940.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20XBA-H3%20SM%20XBA4.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) XBA-H3 SM XBA4.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Accudio%20((48kHz%20Z.E.))%20XBA-H3%20SM%20beyerT1.irs" --output "$PRESETS_DIRECTORY/irs/Accudio ((48kHz Z.E.)) XBA-H3 SM beyerT1.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Creative%20X-Fi%20((Z-Edition))%20Crystalizer%2010%20%2B%20Expand%2010.irs" --output "$PRESETS_DIRECTORY/irs/Creative X-Fi ((Z-Edition)) Crystalizer 10 + Expand 10.irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/HTC%20Beats%20Audio%20((Z-Edition)).irs" --output "$PRESETS_DIRECTORY/irs/HTC Beats Audio ((Z-Edition)).irs" --silent
        curl "$IRLGIT_REPOSITORY/irs/Waves%20MaxxAudio%20((Z-Edition))%20AudioWizard%201.Music.irs" --output "$PRESETS_DIRECTORY/irs/Waves MaxxAudio ((Z-Edition)) AudioWizard 1.Music.irs" --silent
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
check_impulse_response_directory
install_menu
read_choice
install_presets