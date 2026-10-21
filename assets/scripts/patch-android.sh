#!/usr/bin/env bash
set -euo pipefail
GRADLE=android/app/build.gradle
RUN="${GITHUB_RUN_NUMBER:-1}"
sed -i "s/versionCode [0-9]\+/versionCode ${RUN}/" "$GRADLE"
sed -i "s/versionName \"[^\"]*\"/versionName \"1.0.${RUN}\"/" "$GRADLE"
grep -n "versionCode\|versionName" "$GRADLE"
