#!/bin/bash

ROBLOX_DIR="$HOME/Library/Roblox"
CLIENT_SETTINGS="$ROBLOX_DIR/ClientSettings"
IXP_FILE="$CLIENT_SETTINGS/IxpSettings.json"
XML_FILE="$ROBLOX_DIR/GlobalBasicSettings_13.xml"

mkdir -p "$ROBLOX_DIR"

if [ ! -d "$CLIENT_SETTINGS" ]; then
    mkdir "$CLIENT_SETTINGS"
fi

if [ -f "$IXP_FILE" ]; then
    chflags nouchg "$IXP_FILE"
fi

cat > "$IXP_FILE" <<EOL
{
    "FFlagTaskSchedulerLimitTargetFpsTo2402": "False",
    "DFIntTaskSchedulerTargetFps": "120",
    "FFlagGameBasicSettingsFramerateCap5": "True",
    "FFlagDebugGraphicsDisableMetal": "True",
    "FFlagDebugGraphicsPreferVulkan": "False"
}
EOL

chflags uchg "$IXP_FILE"

if [ -f "$XML_FILE" ]; then
    sed -i '' 's/\(<int name="FramerateCap" value="\)[^"]*"/\1-1"/' "$XML_FILE"
fi

echo "Roblox FPS Unlocked! | If you have any issues DM @omaw on Discord"
