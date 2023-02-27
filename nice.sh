#!/bin/bash

# Renice applications to 20
# Copyright (C) 2023 Twilight Sparkle
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "$SCRIPT_DIR/apps.sh"

if [ "$UID" != 0 ]; then
    echo "This script must be ran as root"
    exit 1
fi

pids=()

for app in "${applications[@]}"; do
    for pid in $(pgrep -fi "$app"); do
        pids+=("$pid")
    done
done

if [ "$1" != "--live" ]; then
    echo "Running in dry-run mode. Pass --live to renice apps"

    for pid in "${pids[@]}"; do
        ps -p "$pid"
    done
else
    echo "Running in live mode, renicing applications"

    for pid in "${pids[@]}"; do
        renice 20 "$pid"
    done
fi

