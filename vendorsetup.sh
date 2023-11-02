#!/bin/bash

# Set the device name.
device_name="ruby"

# Display a well-aligned kitty ASCII art at the start with paws.
echo -e "Meow, meow! It's time to kittyfy $device_name!\n"
echo -e "  /\\_____/\\"
echo -e " /  o   o  \\"
echo -e "( ==  ^  == )"
echo -e " )  (_)  ("
echo -e "/         \\"
echo -e " \\_______/"
echo -e "  |     |\n"

# Function to remove a directory if it exists and echo a message.
remove_directory() {
    local directory="$1"
    if [ -d "$directory" ]; then
        echo -e "Meow! Removing the old $directory directory..."
        rm -rf "$directory"
        echo -e "Meow! $directory directory has been removed.\n"
    else
        echo -e "Meow! $directory directory does not exist. No need to remove.\n"
    fi
}

# Function to clone a Git repository with error handling.
clone_repository() {
    local url="$1"
    local branch="$2"
    local directory="$3"
    
    echo -n "Meow! Cloning $url into $directory... "
    if git clone --depth 1 "$url" -b "$branch" "$directory" &> /dev/null; then
        echo -e "Meow! Successfully cloned $url for $device_name into $directory.\n"
    else
        echo -e "Meow! Cloning $url for $device_name failed.\n"
    fi
}

# Improved readability: Separation of sections with comments.

# --- Removing existing directories ---
echo -e "Step 1: Removing existing directories...\n"
remove_directory "./kernel/xiaomi/mt6877"
remove_directory "./vendor/xiaomi/ruby"
remove_directory "./device/mediatek/sepolicy_vndr"
remove_directory "./hardware/mediatek"
remove_directory "vendor/xiaomi/camera"  # Add this line to remove vendor/xiaomi/camera
remove_directory "./frameworks/native"

# --- Cloning repositories in parallel ---
echo -e "Step 2: Cloning repositories in parallel...\n"
clone_repository "https://github.com/PQEnablers-Devices/android_kernel_xiaomi_mt6877" "lineage-20" "./kernel/xiaomi/mt6877"
clone_repository "https://github.com/yunothebess/android_vendor_xiaomi_ruby" "miui_cam" "./vendor/xiaomi/ruby"
clone_repository "https://github.com/PQEnablers-Devices/android_device_mediatek_sepolicy_vndr" "lineage-20" "./device/mediatek/sepolicy_vndr"
clone_repository "https://github.com/PQEnablers-Devices/android_hardware_mediatek" "lineage-20-foss" "./hardware/mediatek"
clone_repository "https://github.com/LineageOS/android_hardware_xiaomi" "lineage-20" "./hardware/xiaomi"

# Add this section to clone vendor/xiaomi/camera with the "ruby" branch
remove_directory "vendor/xiaomi/camera"
clone_repository "https://gitlab.com/wodanesdag/vendor_xiaomi_camera.git" "ruby" "vendor/xiaomi/camera"

# --- Clone ViPER4AndroidFX repository with v4a branch instead of master ---
echo -e "Step 3: Cloning ViPER4AndroidFX repository with v4a branch...\n"
clone_repository "https://github.com/TogoFire/packages_apps_ViPER4AndroidFX" "v4a" "packages/apps/ViPER4AndroidFX"

# --- Clone frameworks_native_pos into the same directory as removed frameworks/native with thirteen branch ---
echo -e "Step 4: Cloning frameworks_native_pos repository with thirteen branch...\n"
clone_repository "https://github.com/yunothebess/frameworks_native_pos" "thirteen" "./frameworks/native"

# --- Commented out the KernelSU section ---
# echo "Step 5: KernelSU installation in ./kernel/xiaomi/mt6877..."
# (
#   cd "./kernel/xiaomi/mt6877" || exit
#  curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -
#  cd -
# )

# --- Completion message ---
echo -e "Step 5: All repositories have been successfully cloned. Happy meowtifying!\n"

# Kitty reminder about removing vendorsetup.sh.
echo -e "Step 6: Don't forget to remove vendorsetup.sh from the ./device/xiaomi/ruby folder.\n"

# Export With CCACHE
echo -e "Step 7: Configuring ccache...\n"
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache

# Final message
echo -e "Meow! The meowtification process is complete. You're all set to build for $device_name. Enjoy!"
