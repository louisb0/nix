{pkgs, ...}: {
  programs = {
    git = {
      enable = true;
      userName = "louisb0";
      userEmail = "louisbaragwanath@outlook.com";
    };

    tmux = {
      enable = true;
      prefix = "C-a";
      terminal = "screen-256color";
      baseIndex = 1;
      keyMode = "vi";

      plugins = with pkgs.tmuxPlugins; [
        {
          plugin = rose-pine;
          extraConfig = ''
            set -g @rose_pine_variant 'moon'
            set -g @rose_pine_disable_active_window_menu "on"
          '';
        }
      ];

      extraConfig = ''
        bind c new-window -c "#{pane_current_path}"
        bind '"' split-window -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"

        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
        bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle

        bind-key ! switch-client -t general
        bind-key @ switch-client -t school
        bind-key "#" switch-client -t nix

        bind r source-file ~/.config/tmux/tmux.conf \; display-message "Reloaded!"
      '';
    };

    zsh = {
      enable = true;
      initContent = ''
        unsetopt BEEP
      '';
      oh-my-zsh = {
        enable = true;
        plugins = ["git" "z" "sudo"];
        extraConfig = ''
          export FZF_BASE="${pkgs.fzf}/share/fzf"
        '';
      };
      autosuggestion.enable = true;
      syntaxHighlighting = {
        enable = true;
        styles = {
          precommand = "fg=green,bold";
          path = "fg=magenta";
        };
      };
      shellAliases = {
        rbos = "sudo nixos-rebuild switch --flake .#thinkpad";
        rbh = "home-manager switch --flake .#louis";
      };
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        c = {
          symbol = " ";
          format = "\\[[$symbol($version(-$name))]($style)\\]";
          detect_extensions = ["cpp" "hpp"];
          detect_files = ["CMakeLists.txt" "Makefile"];
        };
        nix_shell = {
          symbol = "󱄅 ";
          format = "\\[[$symbol$state( \\($name\\))]($style)\\]";
        };
      };
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  home.packages = with pkgs; [
    devenv
    btop
    bat
    pre-commit
    neofetch

    # TODO: Look at each of the below.
    # ripgrep
    # fd
    # jq
    # bandwhich # Network usage by process
    # dust # Better du alternative
    # exa # Better ls (though you might alias in home-manager)
    # duf # Better df
    # procs # Better ps
  ];
}
