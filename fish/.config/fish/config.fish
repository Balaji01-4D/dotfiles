set -U fish_greeting ""

if status is-interactive
    oh-my-posh init fish --config ~/.config/oh-my-posh/themes/catppuccin_frappe.omp.json | source
    zoxide init fish | source
    alias tree='eza --tree --icons'
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -l --icons --group-directories-first"
    alias la="eza -la --icons --group-directories-first"
    alias v="nvim"
    alias y="yazi"

    export EDITOR="nvim"

end

