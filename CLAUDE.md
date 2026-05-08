# OpenWolf

@.wolf/OPENWOLF.md

This project uses OpenWolf for context management. Read and follow .wolf/OPENWOLF.md every session. Check .wolf/cerebrum.md before generating code. Check .wolf/anatomy.md before reading files.

## Code Search (semble)

Use `semble search` to find code by describing what it does or naming a symbol, instead of grep:

```bash
semble search "authentication flow" ./my-project
semble search "save_pretrained" ./my-project
semble search "save model to disk" ./my-project --top-k 10
```

Use `semble find-related` to discover code similar to a known location:

```bash
semble find-related src/auth.py 42 ./my-project
```

`path` defaults to the current directory when omitted. If `semble` is not on `$PATH`, use `wsl /home/matt/.local/bin/semble` in its place.
