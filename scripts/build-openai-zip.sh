#!/usr/bin/env bash
# Builds the ChatGPT plugin package for OpenAI's plugin directory: the manifests in openai/ at
# the ZIP's root, with the skill, README, licence and logo from claude/. One skill, one README and
# one logo serve both plugins, so the two listings cannot drift.
#
#   scripts/build-openai-zip.sh [out.zip]   default dist/uptimeagent-openai.zip
#
# Upload the ZIP at platform.openai.com/plugins. dist/ is git-ignored. Finder's .DS_Store files
# are left out.
set -euo pipefail

root=$(cd "$(dirname "$0")/.." && pwd)
out=${1:-"$root/dist/uptimeagent-openai.zip"}
case $out in /*) ;; *) out="$PWD/$out" ;; esac

for f in claude/LICENSE claude/README.md openai/plugin.json openai/mcp.json; do
  if [ ! -f "$root/$f" ]; then
    echo "$f is missing: OpenAI's directory refuses a plugin without it" >&2
    exit 1
  fi
done

stage=$(mktemp -d)
trap 'rm -rf "$stage"' EXIT

cp -R "$root/claude/skills" "$root/claude/assets" "$stage/"
cp "$root/claude/README.md" "$root/claude/LICENSE" "$stage/"
cp "$root/openai/plugin.json" "$root/openai/mcp.json" "$stage/"

mkdir -p "$(dirname "$out")"
rm -f "$out"
(cd "$stage" && zip -qrX "$out" . -x '*.DS_Store')
echo "$out"
