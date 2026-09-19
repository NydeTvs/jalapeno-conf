{ config, pkgs, ... } :

let 
  theme = import ./theme.nix;
in
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      
      format = "[╭─](${theme.colors.blue})$username$hostname$directory$git_branch$git_status$character\n[╰──➤](${theme.colors.blue}) ";

      character = {
        success_symbol = "[➜](${theme.colors.green})";
        error_symbol = "[➜](${theme.colors.red})";
        vicmd_symbol = "[V](${theme.colors.yellow}) ";
      };

      username = {
        style_root = "bold ${theme.colors.red}";
        format = "[$user](${theme.colors.green})[@](bold ${theme.colors.yellow})";
        disabled = false;
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname](bold ${theme.colors.white}) ";
        disabled = false;
      };

      directory = {
        read_only = " 󰌾";
        format = "[](${theme.colors.cyan})  [$path](bold ${theme.colors.brightWhite})";
        read_only_style = "bold ${theme.colors.red}";
        truncation_length = 5;
        truncate_to_repo = false;
      };

      git_branch = {
        format = " [$symbol$branch](${theme.colors.green}) ";
        style = "bold";
        symbol = " ";
      };

      git_status = {
        format = "([$all_status$ahead_behind](${theme.colors.yellow}))";
        conflicted = "󱐋";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        up_to_date = "";
        untracked = "?\${count}";
        stashed = "$\${count}";
        modified = "!\${count}";
        staged = "+\${count}";
        renamed = "»\${count}";
        deleted = "✘\${count}";
      };

      package = { style = "bold ${theme.colors.brightBlack}"; };
      python = { style = "bold ${theme.colors.brightYellow}"; symbol = " "; };
      nodejs = { style = "bold ${theme.colors.green}"; symbol = "⬢"; };
    };
  };
}
