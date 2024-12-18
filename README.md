# mise-env-from-cmd

A mise plugin to set environment variables from shell commands.

## Usage

Install this plugin

```bash
mise install mise-env-from-cmd https://github.com/michaelPotter/mise-env-from-cmd
```

Then update your `mise.toml`:

```toml
[env]
_.mise-env-from-cmd.AWS_PROFILE = "jq -r .project.aws_profile .project_metadata.json"
_.mise-env-from-cmd.MODULE = "jq -r .project.module .project_metadata.json"
```

You'll now see these added to your environment when running `mise env`.
