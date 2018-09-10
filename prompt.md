# Yoncé (for Bash-it)

Yoncé is a customizable bash prompt theme.

Yoncé starts small, and allows you to customize it to suit your needs. It can be as simple or complex as you like.

![Yoncé Bash Theme](./assets/bash.gif)
> The font in the screenshot is a Nerd Font patched version of `Dank Mono`. 40£. https://dank.sh/

Currently it shows:

* Clever hostname, username, and directory displaying
* Indicator if the last command exits with non-zero code
* Indicator for cached `sudo` credential
* Indicator for ssh login
* Current Git branch and rich repo status:
  * dirty branch
  * clean branch
  * untracked changes
  * uncommitted changes in the index
  * unstaged changes
  * ahead of remote branch
  * behind of remote branch
  * stashed changes
* Current Node.js version, through nvm
* Current Python version
* Current battery level and status
  * charging
  * discharging
  * using AC power
* Time stamps 24hr in format
* Yoncé lyric

## Requirements

* [`bash-it`](https://github.com/Bash-it/bash-it) (v5.2 or recent) must be installed.
* Any [Nerd Font](https://github.com/ryanoasis/nerd-fonts) must be installed and used in your terminal. Demo uses a patched [Dank Mono](http://dank.sh).

## Optional

* `npm` & [`npmusic`](https://github.com/valgaze/npmusic)
  * This is required for the `yonce play` command.
* [bash-it]() battery plugin
* [Todo.txt](https://github.com/ginatrapani/todo.txt-cli)

## Features

### Prompt Segments

Four environment variables can be defined to rearrange the segments order. The default values are:

`___YONCE_PREFIX:-"lyric"`

`___YONCE_TOP_LEFT:-"user host dir scm"`

`___YONCE_TOP_RIGHT:-"exitcode node python todo clock battery"`

`___YONCE_BOTTOM:-"char"`

## Configuration

Various prompt segments can be shown/hidden or modified according to your choice. There are two ways for doing that:

1. On-the-fly using `yonce` command
2. Theme Environment Variables

### On-the-fly using `yonce` command

This theme provides a command for showing/hiding prompt segments. Tab-completion for this command is enabled by default. Configuration specified by this command will only be applied to current and subsequent child shells.

For showing/hiding parts of the prompt

`yonce show <segment>` and  `yonce hide <segment>`

...and for renaming shell tabs

`yonce name <name>`

... and for playing songs by Yoncé!

`yonce play <song>`

**Adding songs**

To add a new song, you'll need to first find a YouTube video for it. Then, create a new variable and set it to the YouTube URL:

`YONCE="https://www.youtube.com/watch?v=jcF5HtGvX5I"`

Next, add that variable to the list of available songs. The default list:

`__YONCE_SONGS="yonce formation seven11 apeshit crazy countdown sorry"`

`yonce play list` will display all available songs.

`yonce help me` will display a helpful prompt for all available commands.

### Theme Environment Variables

This is used for permanent settings that apply to all terminal sessions. You have to define the value of specific theme variables in your `.bash_profile` (or equivalent) file.

The name of the variables are listed below along with their default values.

#### Yoncé lyric

Display motivational lyric by Yoncé:

`THEME_SHOW_LYRIC=true`

#### User Information

Indicator for cached `sudo` credential (see `sudo` manpage for more information):

`THEME_SHOW_SUDO=true`

#### SCM

Software configuration management (Git) information:

`THEME_SHOW_SCM=true`

#### Exit Code

Exit code of the last command:

`THEME_SHOW_EXITCODE=false`

#### Node Environment

Node environment version information:

`THEME_SHOW_NODE=false`

#### Python Environment

Python environment version information:

`THEME_SHOW_PYTHON=false`

#### [Todo.txt](https://github.com/ginatrapani/todo.txt-cli) status

`THEME_SHOW_TODO=false`

`brew install todo-txt`

#### Clock

`THEME_SHOW_CLOCK=false`

`THEME_CLOCK_COLOR=$white`

Format of the clock (see `date` manpage for more information):

`THEME_CLOCK_FORMAT="%H:%M"`

#### Battery Charge

Battery charge percentage:

`THEME_SHOW_BATTERY=false`

`bash-it enable plugin battery`

#### Artwork

ASCII artwork is disabled by default, but you can enable it by changing the following variables:

`YONCE_ART_ENABLED=0`, change to `1` to enable  
`YONCE_ARTWORK=$default`

Artwork available for display can be previewed below:

`$default`
```
    _                                      *
   (_|   |                    /          * | *
     |   |  __   _  _    __   _    * * * \|O|/ * * *
     |   | /  \_/ |/ |  /    |/     \o\o\o|O|o/o/o/
      \_/|/\__/   |  |_/\___/|__/   (<><><>O<><><>)
        /|                           '==========='
        \|
```

`$yonce`
```
    _
   (_|   |                    /
     |   |  __   _  _    __   _
     |   | /  \_/ |/ |  /    |/
      \_/|/\__/   |  |_/\___/|__/
        /|
        \|
```

`$queen`
```
              *
            * | *
      * * * \|O|/ * * *
       \o\o\o|O|o/o/o/
       (<><><>O<><><>)
        '==========='
```
`$king`
```
           * * * *
      * * * \|O|/ * * *
       \o\o\o|O|o/o/o/
       (<><><>O<><><>)
       '============='
```
`$hello`
```
 _          _   _
| |        | | | |      |
| |     _  | | | |  __  |
|/ \   |/  |/  |/  /  \_|
|   |_/|__/|__/|__/\__/ o
```

### Thanks to

This theme is inspired by and based on [Brainy](https://github.com/Bash-it/bash-it/tree/master/themes/brainy).

### Credits

Developer / Author: [Mina Markham](https://github.com/minamarkham)
