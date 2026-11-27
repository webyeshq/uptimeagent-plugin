# UptimeAgent

UptimeAgent watches your websites and APIs from several regions and opens an incident when one
fails. This plugin connects your assistant to your UptimeAgent account, so you can ask which sites
are up, what failed and why, without leaving the conversation.

## What you can ask

- "Which of my sites are down right now?"
- "What caused INC-0042?" or "Why did my latest alert fire?"
- "How has api.example.com responded over the last 7 days?"
- "My site blocks your checks. Which addresses should I allowlist?"
- "Are my server logs reaching UptimeAgent?"

The plugin's `investigate-incident` skill walks the assistant through an incident's details,
evidence, application errors and check history, and asks it to explain the likely cause from that
evidence.

## Getting started

1. Install the plugin from your assistant's plugin directory. In Claude Code you can also install
   it straight from [this repository](https://github.com/webyeshq/uptimeagent-plugin):

   ```
   /plugin marketplace add webyeshq/uptimeagent-plugin
   /plugin install uptimeagent@uptimeagent
   ```

2. Sign in with your UptimeAgent account when your assistant asks, and approve the access on the
   consent page.
3. If you belong to more than one workspace, name the one you mean, or the assistant will ask.

You need an UptimeAgent account with at least one monitor: [uptimeagent.com](https://uptimeagent.com).

## What it connects to and what it sends

The plugin runs no code on your machine. It points your assistant at one remote server,
`https://mcp.uptimeagent.com/mcp`, and nothing else.

- **Sign-in:** OAuth through your UptimeAgent account. The assistant gets a token that can only
  read; it never sees your password.
- **What the assistant can read**, from the workspace you choose: monitors and their state,
  incidents and their analysis, check results per region, the HTTP request and response captured at
  an incident, TLS and DNS details, your server log lines and application errors around an incident,
  webhook delivery records, response-time trends, and your account's name, email, workspaces and
  roles.
- **What it can change:** nothing. Every tool is read-only.
- **What we record:** for each request, the IP address it came from. For each tool call, the tool,
  time, outcome and workspace, your account's identifier, and which assistant and OAuth client
  made the call. Usage analytics record your account's identifier, the assistant, its client name
  and user agent, and the same call details. Neither ever records a tool's inputs or results, and
  analytics never record hostnames or emails. See the
  [privacy policy](https://uptimeagent.com/privacy-policy).

What you send to your assistant, and what it does with the answers, is governed by your
assistant provider's terms.

## Support

Documentation: [uptimeagent.com/docs](https://uptimeagent.com/docs). Privacy and data requests:
support@uptimeagent.com.

## Licence

Copyright 2026 Mozilor Limited. The files in this plugin are licensed under the
[Apache License 2.0](LICENSE). The licence covers these files only, not the UptimeAgent service,
and grants no rights to the UptimeAgent name or logo.
