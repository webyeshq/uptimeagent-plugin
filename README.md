# UptimeAgent plugins for Claude and ChatGPT

[UptimeAgent](https://uptimeagent.com) watches your websites and APIs from several regions and
opens an incident when one fails. These plugins connect your assistant to your UptimeAgent
account, so you can ask which sites are up, what failed and why, without leaving the
conversation. Every tool is read-only.

| Folder | What it is | Where you get it |
|---|---|---|
| [`claude/`](claude) | The Claude plugin: manifest, server pointer, the `investigate-incident` skill and logo | Claude's plugin directory, or Claude Code straight from this repository |
| [`openai/`](openai) | The ChatGPT plugin's manifests, packed with `claude/`'s skill, README, licence and logo | ChatGPT's plugin directory |

Both plugins point your assistant at one remote server, `https://mcp.uptimeagent.com/mcp`, and run
no code on your machine. [claude/README.md](claude/README.md) says what you can ask, how sign-in
works, and what the plugin reads and records.

## Install

- **Claude and ChatGPT:** from your assistant's plugin directory.
- **Claude Code**, straight from this repository:

  ```
  /plugin marketplace add webyeshq/uptimeagent-plugin
  /plugin install uptimeagent@uptimeagent
  ```

You need an UptimeAgent account with at least one monitor.

## Releasing a new version

1. On a branch, make the change and raise `version` in both `claude/.claude-plugin/plugin.json`
   and `openai/plugin.json`. The directories publish a new version only when it rises, and the two
   stay equal.
2. Check the Claude plugin and the marketplace:

   ```
   claude plugin validate claude --profile directory
   claude plugin validate .
   ```

3. Open a pull request into `main`. A repository admin merges it and tags `vX.Y.Z`.
4. Claude's directory picks the new version up and a reviewer publishes it. For ChatGPT, run
   `scripts/build-openai-zip.sh` and upload `dist/uptimeagent-openai.zip` at
   platform.openai.com/plugins.

Keep the repository plain: no GitHub Actions, Git LFS, submodules, symlinks, `.gitattributes`
export rules or `.DS_Store` files. Claude's directory refuses or holds a plugin that has them.

The `investigate-incident` skill repeats the server's `investigate_incident` prompt, and the
ChatGPT review cases name the server's tools. Change them when the server changes.

## Licence

Copyright 2026 Mozilor Limited. The files in this repository are licensed under the
[Apache License 2.0](LICENSE). The licence covers these files only, not the UptimeAgent service,
and grants no rights to the UptimeAgent name or logo.
