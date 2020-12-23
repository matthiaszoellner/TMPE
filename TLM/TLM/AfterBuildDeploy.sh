#!/bin/sh

MONO_DIR=$1
TARGET_PATH=$2
TARGET_DIR=$3
TARGET_NAME=$4

echo MONODIR is $MONO_DIR
#echo "$MONO_DIR/bin/pdb2mdb" "$TARGET_DIR.pdb"

DEPLOYDIR="$HOME/.local/share/Colossal Order/Cities_Skylines/Addons/Mods/TrafficManager/"

mkdir -p "$DEPLOYDIR"
#cp "$TARGET_DIR/*.pdb" "$DEPLOYDIR"
cp "${TARGET_DIR}/TMPE.CitiesGameBridge.dll" "$DEPLOYDIR"
cp "${TARGET_DIR}/TMPE.GenericGameBridge.dll" "$DEPLOYDIR"
cp "${TARGET_DIR}/TMPE.API.dll" "$DEPLOYDIR"
cp "${TARGET_DIR}/CSUtil.CameraControl.dll" "$DEPLOYDIR"
#cp "${TARGET_DIR}/TMPE.RedirectionFramework.dll" "$DEPLOYDIR"
cp "${TARGET_DIR}/CSUtil.Commons.dll" "$DEPLOYDIR"
cp "${TARGET_DIR}/SkyTools.Common.dll" "$DEPLOYDIR"
cp "${TARGET_DIR}/SkyTools.Patching.dll" "$DEPLOYDIR"
cp "${TARGET_DIR}/CitiesHarmony.API.dll" "$DEPLOYDIR"
cp "${TARGET_DIR}/MoveItIntegration.dll" "$DEPLOYDIR"

#rem To avoid double hot reload, TrafficManager.dll must be replaced last and fast.
#rem Once TrafficManager.dll is re-loaded, all other dlls will be reloaded as well
rm "$DEPLOYDIR$TARGET_NAME"
cp "$TARGET_PATH" "$DEPLOYDIR"

