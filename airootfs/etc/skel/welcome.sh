#!/bin/bash

# 1. تطبيق الخلفية فوراً عند فتح سطح المكتب
if [ -f "/usr/share/wallpapers/aura-wallpaper.jpg" ]; then
    plasma-apply-wallpaperimage /usr/share/wallpapers/aura-wallpaper.jpg
fi

# 2. إجبار زر ابدأ على قراءة الشعار الخاص بك
kwriteconfig5 --file ~/.config/plasma-org.kde.plasma.desktop-appletsrc --group Containments --group 1 --group Applets --group 2 --group Configuration --group General --key icon "/usr/share/pixmaps/aura-logo.png"

# 3. فتح نافذة اختيار اللغة والمنطقة الزمنية
LANG_CHOICE=$(kdialog --radiolist "Welcome to Aura OS / مرحباً بك في Aura OS\nChoose your primary language:" \
    "en_US.UTF-8" "English (US)" ON \
    "ar_TN.UTF-8" "العربية (تونس)" OFF \
    "fr_FR.UTF-8" "Français (France)" OFF)

if [ -n "$LANG_CHOICE" ]; then
    export LANG=$LANG_CHOICE
    export LC_ALL=$LANG_CHOICE
fi

TIMEZONE_CHOICE=$(kdialog --combobox "Select your Timezone / اختر المنطقة الزمنية:" \
    "Africa/Tunis" \
    "Europe/Berlin" \
    "Europe/Paris" \
    "America/New_York" \
    "UTC")

if [ -n "$TIMEZONE_CHOICE" ]; then
    sudo timedatectl set-timezone $TIMEZONE_CHOICE
fi

kdialog --msgbox "System configuration updated!\nAll set to try or install Aura OS."
