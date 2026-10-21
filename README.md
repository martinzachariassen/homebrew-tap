# martinzachariassen/homebrew-tap

[![tests](https://github.com/martinzachariassen/homebrew-tap/actions/workflows/tests.yml/badge.svg)](https://github.com/martinzachariassen/homebrew-tap/actions/workflows/tests.yml)

[Homebrew](https://brew.sh) formulae for my projects. Works on macOS and Linux.

## Install

Install a formula directly. Homebrew taps the repository the first time:

```sh
brew install martinzachariassen/tap/<formula>
```

Or tap once, then use the short names:

```sh
brew tap martinzachariassen/tap
brew install <formula>
```

## Formulae

| Formula | Description | Install |
| --- | --- | --- |
| [`domeneshop-mcp`](https://github.com/martinzachariassen/domeneshop-mcp) | MCP server for the Domeneshop API: domains, DNS, HTTP forwards, dynamic DNS and invoices | `brew install martinzachariassen/tap/domeneshop-mcp` |

### domeneshop-mcp

An [MCP](https://modelcontextprotocol.io) server that lets AI assistants (Claude
Code, Claude Desktop, Cursor, VS Code, Codex and others) manage your
[Domeneshop](https://www.domeneshop.no) account. Homebrew installs Node.js as a
dependency, so nothing else is needed.

```sh
brew install martinzachariassen/tap/domeneshop-mcp
domeneshop-mcp --version
```

Register it with your client using `domeneshop-mcp` as the command. GUI apps
such as Claude Desktop usually don't see Homebrew's `PATH`, so give them the full
path from `echo "$(brew --prefix)/bin/domeneshop-mcp"`: `/opt/homebrew/bin` on
Apple silicon, `/usr/local/bin` on Intel Macs, `/home/linuxbrew/.linuxbrew/bin`
on Linux.

```json
{
  "mcpServers": {
    "domeneshop": {
      "command": "/opt/homebrew/bin/domeneshop-mcp",
      "env": {
        "DOMENESHOP_API_TOKEN": "your-token",
        "DOMENESHOP_API_SECRET": "your-secret"
      }
    }
  }
}
```

API credentials, client-specific setup and the full tool list are in the
[domeneshop-mcp README](https://github.com/martinzachariassen/domeneshop-mcp#readme).

## Updating and uninstalling

```sh
brew update && brew upgrade domeneshop-mcp   # newest release
brew uninstall domeneshop-mcp
brew untap martinzachariassen/tap            # remove the tap itself
```

## How releases reach this tap

Formulae are not edited by hand. Each formula installs the project's published
npm package, and its version comes from the tarball URL. When a project
releases:

1. Its release workflow publishes the new version to npm.
2. A GitHub App opens a pull request here with the new `url` and `sha256`. The
   App signs the commit, which the branch rules on `main` require.
3. `brew test-bot` installs, audits and tests the formula on macOS and Ubuntu.
4. The pull request merges automatically once the checks pass, and the next
   `brew upgrade` picks up the new version, usually within minutes of the npm
   release.

## Troubleshooting

- **`command not found` in a GUI app**: use the full path shown above.
- **Something looks broken after an upgrade**: run `brew doctor`, then
  `brew reinstall domeneshop-mcp`.
- **Bugs and feature requests**: open an issue in the project's repository,
  e.g. [domeneshop-mcp issues](https://github.com/martinzachariassen/domeneshop-mcp/issues).
  Issues about the formula itself can go here.

## License

[MIT](LICENSE)
