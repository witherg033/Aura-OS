#!/bin/bash

# 1. شاشة اختيار اللغة
LANG_CHOICE=$(kdialog --radiolist "Welcome to Aura OS / مرحباً بك في Aura OS\nChoose your primary language:" \
    "en_US.UTF-8" "English (US)" ON \
    "ar_TN.UTF-8" "العربية (تونس)" OFF \
    "fr_FR.UTF-8" "Français (France)" OFF)

if [ -n "$LANG_CHOICE" ]; then
    export LANG=$LANG_CHOICE
    export LC_ALL=$LANG_CHOICE
fi

# 2. شاشة اختيار المنطقة الزمنية
TIMEZONE_CHOICE=$(kdialog --combobox "Select your Timezone / اختر المنطقة الزمنية:" \
    "Africa/Tunis" \
    "Europe/Berlin" \
    "Europe/Paris" \
    "America/New_York" \
    "UTC")

if [ -n "$TIMEZONE_CHOICE" ]; then
    sudo timedatectl set-timezone $TIMEZONE_CHOICE
fi

# 3. رسالة تأكيد بسيطة
kdialog --msgbox "System configuration updated!\nAll set to try or install Aura OS."
