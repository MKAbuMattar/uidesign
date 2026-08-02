# Install uidesign

One skill, six commands, ten self-contained reference files. Pick your agent below.

Every route installs the **same** `skills/ui-design/` directory: the harness manifests point at it
rather than shipping a copy, so no route can drift from another.

<details>
<summary><strong>Claude Code</strong></summary>

```
/plugin marketplace add mkabumattar/uidesign
```
```
/plugin install uidesign@uidesign
```

Then `/reload-plugins`. Verify with `/uidesign:help`.
Update: `/plugin update uidesign`. Remove: `/plugin uninstall uidesign`.

</details>

<details>
<summary><strong>Codex</strong></summary>

```bash
codex plugin marketplace add mkabumattar/uidesign --ref main
codex plugin install uidesign@uidesign
```

Verify: `codex plugin list`. Update: `codex plugin marketplace update uidesign`.
Remove: `codex plugin uninstall uidesign`.

</details>

<details>
<summary><strong>Kimi Code CLI</strong></summary>

`.kimi-plugin/plugin.json` declares both `"skills"` and `"commands"`, so the six commands load too.

```
/plugins install https://github.com/mkabumattar/uidesign
```

Verify: `/plugins list`. Update: reinstall, then `/plugins reload`. Remove: `/plugins remove uidesign`.

</details>

<details>
<summary><strong>Gemini CLI</strong></summary>

```bash
gemini extensions install https://github.com/mkabumattar/uidesign
```

Verify: `gemini extensions list`. Update: `gemini extensions update uidesign`.
Remove: `gemini extensions uninstall uidesign`.

</details>

<details>
<summary><strong>Cursor, OpenCode, Amp, GitHub Copilot, Pi, and other agent-skills harnesses</strong></summary>

```bash
npx skills add mkabumattar/uidesign
```

Add `-a github-copilot` or `-a pi` to target one, `-g` for all projects. Or clone and copy:

```bash
git clone https://github.com/mkabumattar/uidesign.git
cp -r uidesign/skills/ui-design ~/.cursor/skills/     # Cursor
cp -r uidesign/skills/ui-design .agents/skills/       # OpenCode
```

The repo also carries `.cursor/skills/ui-design` as a symlink to the canonical skill, so a cloned
repo is discoverable without a second copy to keep in sync.

Start a **new** chat: skills are indexed at session start.

</details>

<details>
<summary><strong>Zed</strong></summary>

In the Agent Panel, choose **Create skill from URL** and paste:

```
https://github.com/mkabumattar/uidesign/blob/main/skills/ui-design/SKILL.md
```

Or copy the folder to `~/.config/zed/skills/`.

</details>

<details>
<summary><strong>Hermes</strong></summary>

```bash
hermes skills install mkabumattar/uidesign/skills/ui-design
```

Verify: `hermes skills list`. Update: `hermes skills update ui-design`.

</details>

<details>
<summary><strong>Antigravity</strong></summary>

Clone the repository; the root `plugin.json` declares `"skills": "./skills/"`.

```bash
git clone https://github.com/mkabumattar/uidesign.git
```

</details>

<details>
<summary><strong>Any other agent (manual)</strong></summary>

Plain Markdown, no build step or runtime. Clone it, then tell your agent to read
`skills/ui-design/SKILL.md` and follow it.

</details>

## How activation works

The skill declares its trigger in the `description` field of `skills/ui-design/SKILL.md`. Harnesses
that auto-invoke skills load it when a prompt matches: a visual style by name, choosing a look,
contrast and accessibility of an interface, or moving away from a generated-looking design.

Claude Code additionally exposes the six `/uidesign:<verb>` commands. Other harnesses read the same
skill without the wrappers, so phrase the intent instead: *"pick a UI style for this product"*
rather than `/uidesign:choose`.
