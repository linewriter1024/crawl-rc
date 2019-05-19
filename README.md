Configuration for [DCSS](https://crawl.develz.org). Used to compile [my own rc file](https://crawl.kelbi.org/crawl/rcfiles/crawl-git/Nornya.rc).

# Usage
* `./compile.sh <dir or file> [<dir or file> ...]` will output the compiled config file to stdout.
* Example command including an additional header and writing the output to a file:
  ```
  (echo "# A HEADER LINE"; echo "# ANOTHER HEADER LINE"; ./compile.sh modules) > /path/to/output/file.rc
  ```

# Modules
Various modules are included.
* To use all of them: `./compile.sh modules`
* Selective inclusion example: `./compile.sh modules/skill_menu.lua modules/Nornya/base`

# Core Lua Library
All functions are contained in the `nrc` table.

## System
* `nrc.register_ready(f)`: Will register `f` and call it upon Crawl's `ready()` function.
* `nrc.register_ready_start(f)`: Similiar to `nrc.register_ready` but will only fire when a Crawl game is begun/loaded and it is the first turn (`you.turns() == 0`).
* `nrc.check_version([a], [b])`: Returns (crawl version >= specified version).

### Settings
* `nrc.settings.set(setting, value)`: Set a setting.
* `nrc.settings.default(setting, value)`: Set a setting's default value.
* `nrc.settings.get(setting)`: Get a setting's current value or default if no value has been set.

## You
* `nrc.you.starving()`: Are you in hunger trouble (starving or fainting)?
* `nrc.you.castable(spell)`: Is a spell castable at the moment?
* `nrc.you.cast(spell, [force])`: Cast a spell.

## World
* `nrc.world.has_skeleton(x, y)`: Is there something with a skeleton on a cell?

## Features Table
`nrc.features` is a table of boolean flags. See [features.lua](core/header/features.lua) for the documented list.
