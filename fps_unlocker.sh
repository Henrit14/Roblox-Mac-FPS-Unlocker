#!/bin/bash

ROBLOX_DIR="$HOME/Library/Roblox"
CLIENT_SETTINGS="$ROBLOX_DIR/ClientSettings"
IXP_FILE="$CLIENT_SETTINGS/IxpSettings.json"
XML_FILE="$ROBLOX_DIR/GlobalBasicSettings_13.xml"

mkdir -p "$CLIENT_SETTINGS"

read -p "Please enter a FPS value: " x

if [ -f "$IXP_FILE" ]; then
    chflags nouchg "$IXP_FILE" 2>/dev/null
fi

cat > "$IXP_FILE" <<EOL
{
    "FFlagTaskSchedulerLimitTargetFpsTo2402": "False",
    "DFIntTaskSchedulerTargetFps": $x,
    "FFlagGameBasicSettingsFramerateCap5": "True",
    "FFlagDebugGraphicsDisableMetal": "True",
    "FFlagDebugGraphicsPreferVulkan": "False"
}
EOL

chflags uchg "$IXP_FILE" 2>/dev/null || echo "Warning: Could not lock file (may need sudo)."

if [ -f "$XML_FILE" ]; then
    sed -i '' 's/\(<int name="FramerateCap" value="\)[^"]*"/\1-1"/' "$XML_FILE"
fi

echo "Roblox FPS Unlocked! | credits to @omaw on dc, sub to @hxnrirblx"
