#!/usr/bin/env bash
# Validate the uidesign plugin. No build - just the invariants the docs promise.
# Single source of truth: CI and contributors both run this.
# Usage: bash scripts/validate.sh
set -euo pipefail

cd "$(git rev-parse --show-toplevel 2>/dev/null || dirname "$(dirname "$(readlink -f "$0")")")"

fail=0
ok()   { printf '  OK   %s\n' "$1"; }
bad()  { printf '  FAIL %s\n' "$1"; fail=1; }

# 1. Manifests parse and every harness carries the same version.
if python3 - <<'PY'
import json, sys
from pathlib import Path
want = json.load(open(".claude-plugin/plugin.json"))["version"]
bad = []
for f in (".claude-plugin/marketplace.json", ".codex-plugin/plugin.json",
          ".kimi-plugin/plugin.json", "gemini-extension.json", "plugin.json",
          ".agents/plugins/marketplace.json"):
    p = Path(f)
    if not p.exists():
        continue
    d = json.loads(p.read_text())
    got = d["plugins"][0]["version"] if "plugins" in d else d.get("version")
    if got != want:
        bad.append(f"{f}={got}")
print(" ".join(bad), end="")
sys.exit(1 if bad else 0)
PY
then ok "manifests parse, all versions match"
else bad "manifest version mismatch (see above)"; fi

# 1b. The .cursor/skills symlink resolves to the canonical skill.
if [ -f .cursor/skills/ui-design/SKILL.md ]; then ok ".cursor/skills symlink resolves"
else bad ".cursor/skills/ui-design does not resolve to the skill"; fi

# 2. Skill is self-contained: no external links anywhere under skills/.
if grep -rqE 'https?://' skills; then
  bad "external link(s) in skills/ - must be self-contained:"; grep -rnE 'https?://' skills | sed 's/^/       /'
else ok "no external links in skills/"; fi

# 3. Every reference file has a row in the SKILL.md reference map.
for f in skills/ui-design/references/*.md; do
  grep -q "references/$(basename "$f")" skills/ui-design/SKILL.md || bad "references/$(basename "$f") not in SKILL.md map"
done
[ "$fail" -eq 0 ] && ok "all reference files mapped in SKILL.md"

# 3b. Every reference surfaces its clarify-first questions.
miss=0
for f in skills/ui-design/references/*.md; do
  grep -q "AskUserQuestion" "$f" || { bad "references/$(basename "$f") has no Ask-first note"; miss=1; }
done
[ "$miss" -eq 0 ] && ok "every reference has its Ask-first note"

# 3c. SKILL.md declares both halves of the in/out contract.
for h in "## Ask first" "## Output contract"; do
  grep -q "$h" skills/ui-design/SKILL.md || bad "SKILL.md missing section: $h"
done

# 4. SKILL.md and every command declare YAML frontmatter.
for f in skills/ui-design/SKILL.md commands/*.md; do
  [ "$(head -1 "$f")" = "---" ] || bad "$f missing frontmatter"
done

# 4b. The skill's declared version matches the manifests.
skill_v=$(sed -n 's/^version: *//p' skills/ui-design/SKILL.md | head -1)
plugin_v=$(python3 -c "import json;print(json.load(open('.claude-plugin/plugin.json'))['version'])")
if [ "$skill_v" = "$plugin_v" ]; then ok "SKILL.md version matches manifests ($skill_v)"
else bad "SKILL.md version ($skill_v) != plugin.json ($plugin_v)"; fi

# 5. The accessibility floor must be stated, not implied. It is the skill's whole premise.
grep -q "4.5:1" skills/ui-design/references/choosing.md || bad "choosing.md no longer states the contrast floor"
[ "$fail" -eq 0 ] && ok "accessibility floor stated in choosing.md"

# 6. Editorial bans in the reference prose.
if command -v python3 >/dev/null 2>&1; then
  if python3 scripts/lint-prose.py >/dev/null 2>&1; then ok "prose lint (no banned vocab / links)"; else bad "prose lint failed - run: python3 scripts/lint-prose.py"; fi
else
  ok "prose lint skipped (no python3)"
fi

echo
[ "$fail" -eq 0 ] && echo "validate: PASS" || { echo "validate: FAIL"; exit 1; }
