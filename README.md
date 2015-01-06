# shellcheck

> Automatically detects problems with sh/bash scripts and commands. http://www.shellcheck.net/

# Options

- `files` (optional, default: `*.sh`) List of files whichshould be checked by
shellcheck (uses `separator`).
- `exclude` (optional) Comma separated list containing warnings which should be
ignored.
- `format` (optional) The formatter which is used by shellcheck.
- `shell` (optional) Specify the dialect (bash,sh,ksh,zsh).
- `separator` (optional, default: ` `) Specify the separator to use (see know
issues).

# Known issues

This step won't work if the file you specify in `files` contain a space in them.
Either use globbing, or specify a `separator` to something which isn't
contained in the filename. Make sure you separate the `files` with the
`separator`.

```yaml
build:
    steps:
        shellcheck:
            files: file 01.sh|file 02.sh
            separator: "|"
```

# License

The MIT License (MIT)

# Changelog

## 1.0.0

- Initial release
