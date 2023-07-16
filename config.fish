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
set -Ux EDITOR nvim
set -Ux VISUAL gedit
set -Ux BROWSER firefox
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux MANROFFOPT "-c"
set -Ux LESS eFRX

# Adding paths to fish
fish_add_path ~/.local/bin
fish_add_path ~/.scripts
fish_add_path ~/.cargo/bin

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
