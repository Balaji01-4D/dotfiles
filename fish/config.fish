set -U fish_greeting ""

if status is-interactive
    oh-my-posh init fish --config ~/.config/oh-my-posh/themes/catppuccin_frappe.omp.json | source
    zoxide init fish | source
    alias cd='z'
    alias tree='eza --tree --icons'
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -l --icons --group-directories-first"
    alias la="eza -la --icons --group-directories-first"
    alias cat="bat -p --paging=never"
    alias v="nvim"

    export EDITOR="nvim"

end

