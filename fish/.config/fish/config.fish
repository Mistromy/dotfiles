# ── Environment: runs for EVERY fish (login, scripts, ssh commands) ──
fish_add_path -g ~/bin ~/.local/bin ~/.cargo/bin
fish_add_path -g --append /usr/local/go/bin ~/go/bin /opt/nvim-linux-x86_64/bin

set -gx EDITOR nvim
set -gx LESSOPEN "| /usr/bin/lesspipe %s"
set -gx LESSCLOSE "/usr/bin/lesspipe %s %s"

# ── Login on tty1 → Sway (delete this block once greetd is set up) ──
if status is-login; and test (tty) = /dev/tty1; and not set -q WAYLAND_DISPLAY
    exec sway
end

# ── Interactive only ──
if status is-interactive
    set -g fish_greeting # no welcome message
    # set -g fish_autosuggestion_enabled 0 # no grey ghost text

    alias ll 'ls -alF'
    alias la 'ls -A'
    alias l 'ls -CF'
    alias grep 'grep --color=auto'
end

fish_config theme choose "Rosé Pine"
