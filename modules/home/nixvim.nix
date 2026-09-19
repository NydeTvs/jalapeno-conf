{ inputs, pkgs, ... }:

let
  theme = import ./theme.nix;
in
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    nixpkgs.source = inputs.nixpkgs;

    colorschemes.base16 = {
      enable = true;
      colorscheme = {
        # Background and text
        base00 = theme.colors.background;  
        base05 = theme.colors.foreground; 
        
        # Interface
        base01 = theme.colors.black;      
        base02 = theme.colors.selection;  
        base03 = theme.colors.brightBlack;
        base04 = theme.colors.white;      
        base06 = theme.colors.brightWhite;
        base07 = theme.colors.brightWhite; 
        
        # Syntax
        base08 = theme.colors.white;
        base09 = theme.colors.cursor;
        base0A = theme.colors.yellow;
        base0B = theme.colors.green;
        base0C = theme.colors.cyan;
        base0D = theme.colors.blue;
        base0E = theme.colors.magenta;
        base0F = theme.colors.red;
      };
    };

    extraPackages = with pkgs; [
      clang-tools
      black
    ];

    plugins = {
      # File explorer
      neo-tree = {
        enable = true;
        settings = {
          enable_diagnostics = true;
          enable_git_status = true;
        };
      };

      # Status bar
      lualine = {
        enable = true;
        settings.options.theme = "base16";
      };

      # Icons
      web-devicons.enable = true;

      # Advanced syntax color
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      # Search engine
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = {
            action = "find_files";
            options.desc = "Find files";
          };
          "<leader>fg" = {
            action = "live_grep";
            options.desc = "Grep (search text in project)";
          };
          "<leader>fb" = {
            action = "buffers";
            options.desc = "List open buffers";
          };
        };
      };

      nvim-autopairs.enable = true;
      gitsigns.enable = true;
      which-key.enable = true;
      indent-blankline.enable = true;
      
      trouble.enable = true;

      # Language Server Protocols (LSPs)
      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;  # C/C+
          pyright.enable = true; # Python
          nixd.enable = true;    # Nix
        };
      };
  
      # Auto format with known formaters
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
          formatters_by_ft = {
            c = [ "clang-format" ];
            cpp = [ "clang-format" ];
            python = [ "black" ];
          };
        };
      };

      # Autocompletion
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; } 
            { name = "buffer"; }   
            { name = "path"; }     
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })";
          };
        };
      };
    };

    keymaps = [
      {
        mode = "n"; 
        key = "<leader>f"; 
        action = "<cmd>Neotree toggle<CR>";
        options = { desc = "Toggle file explorer"; };
      }
      {
        mode = "n";
        key = "<leader>def";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        options = { desc = "Go to definition"; };
      }
      {
        mode = "n";
        key = "<leader>doc";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        options = { desc = "Show documentation"; };
      }
      {
        mode = "n";
        key = "<leader>r";
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        options = { desc = "LSP Rename symbol"; };
      }
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics toggle<CR>";
        options = { desc = "Toggle Trouble global diagnostics"; };
      }
      {
        mode = "n";
        key = "<leader>xw";
        action = "<cmd>Trouble diagnostics toggle filter.buf=0 negate=true<CR>";
        options = { desc = "Toggle Trouble workspace diagnostics"; };
      }
      {
        mode = "n";
        key = "<leader>xf";
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<CR>";
        options = { desc = "Toggle Trouble file diagnostics"; };
      }
      {
        mode = "n";
        key = "<leader>bn";
        action = "<cmd>bnext<CR>";
        options = { desc = "Next buffer"; };
      }
      {
        mode = "n";
        key = "<leader>bp";
        action = "<cmd>bprevious<CR>";
        options = { desc = "Previous buffer"; };
      }
    ];

    opts = {
      number = true;
      cursorline = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      clipboard = "unnamedplus";
      termguicolors = true;
    };

    globals.mapleader = " ";
  };
}
