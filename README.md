Configuration for [DCSS](https://crawl.develz.org). Used to compile [my own rc file](https://crawl.kelbi.org/crawl/rcfiles/crawl-git/Nornya.rc).

# Usage
`./compile.sh <dir or file> [<dir or file> ...]` will output the compiled config file to stdout.

# Modules
Various modules are included.
* To use all of them: `./compile.sh modules`.
* Selective inclusion example: `./compile.sh modules/skill_menu.lua modules/Nornya/base`

# Core Lua Library
All functions are contained in the `nrc` table.

* `nrc.register_ready(f)`: Will register `f` and call it upon Crawl's `ready()` function.
* `nrc.register_ready_start(f)`: Similiar to `nrc.register_ready` but will only fire when a Crawl game is begun/loaded and it is the first turn (`you.turns() == 0`).
* `nrc.check_version([a], [b])`: Returns (crawl version >= specified version).

## Features Table
* See [features.lua](core/header/features.lua).
