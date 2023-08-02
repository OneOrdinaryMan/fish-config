#Fish Config
#Copyright (C) 2023  Srivathsan Sudarsanan

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_user_key_bindings
        # Execute this once per mode that emacs bindings should be used in
        fish_default_key_bindings -M insert
        fish_vi_key_bindings --no-erase insert
    end
    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    # Set the insert mode cursor to a line
    set fish_cursor_insert line
    # Set the replace mode cursor to an underscore
    set fish_cursor_replace_one underscore
    # The following variable can be used to configure cursor shape in
    # visual mode, but due to fish_cursor_default, is redundant here
    set fish_cursor_visual block
end


# Fortune at startup
fortune | cowsay | lolcat

# Adding some enviroinmental variables
set -Ux EDITOR "vi -e"
set -Ux VISUAL nvim
set -Ux BROWSER firefox
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux MANROFFOPT "-c"
set -Ux LESS FRX
set -Ux JAVA_HOME "/usr/lib/jvm/java-8-openjdk/"

# Adding paths to fish
fish_add_path ~/.local/bin
fish_add_path ~/.scripts
fish_add_path ~/.cargo/bin
fish_add_path /opt/android-sdk/platform-tools/
fish_add_path /opt/android-sdk/tools/bin/
fish_add_path /opt/android-sdk/tools/
fish_add_path /opt/android-sdk/emulator/
fish_add_path /opt/flutter/bin
fish_add_path /usr/lib/dart/bin

# Aliasing the keybindings
abbr mv "mv -vi"
abbr ls "exa"
abbr la "exa -lah"
abbr ll "exa -lh"
abbr cat "bat"
abbr vim "nvim"

# Trying the mcfly history
mcfly init fish | source

# Trying the zoxide instead of cd.
zoxide init fish | source

# adding starship as default prompt
starship init fish | source
set fish_vi_force_cursor

# Creating the exit script
function on_exit --on-event fish_exit
    echo fish is now exiting
end
