{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    grim
    slurp
  ];

  programs.waybar = {
    enable = true;

    style = with config.theme.colors; ''
      * {
        border: none;
        border-radius: 0;
        font-family: "${config.theme.font.name}";
        font-size: 14px;
        min-height: 0;
      }

      window#waybar {
        background-color: ${base};
        color: ${text};
        border-bottom: none;
      }

      #workspaces button {
        padding: 0 10px;
        background-color: transparent;
        color: ${subtle};
        margin: 0;
      }

      #workspaces button.focused {
        color: ${love};
        font-weight: bold;
        background: ${surface};
        box-shadow: inset 0 -2px ${love};
      }

      #clock, #cpu, #memory, #pulseaudio, #battery, #custom-resize {
        padding: 0 10px;
        margin: 0 2px;
        background-color: transparent;
      }

      #clock {
        color: ${love};
        box-shadow: inset 0 -2px ${love};
      }

      #battery {
        color: ${gold};
        box-shadow: inset 0 -2px ${gold};
      }

      #bluetooth {
        color: ${rose};
        box-shadow: inset 0 -2px ${rose};
      }

      #pulseaudio {
        color: ${iris};
        box-shadow: inset 0 -2px ${iris};
      }

      #memory {
        color: ${foam};
        box-shadow: inset 0 -2px ${foam};
      }

      #cpu {
        color: ${pine};
        box-shadow: inset 0 -2px ${pine};
      }

      #custom-resize {
        color: ${love};
        font-weight: bold;
      }
    '';

    settings = [
      {
        height = 30;
        layer = "top";
        position = "top";
        spacing = 1;

        modules-left = ["sway/workspaces"];
        modules-center = ["custom/resize"];
        modules-right = ["cpu" "memory" "pulseaudio" "bluetooth" "battery" "clock"];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
        };

        "custom/resize" = {
          exec = "[ -f /tmp/sway-resize ] && echo 'RESIZE' || echo ''";
          format = "{}";
          signal = 8;
          interval = "once";
        };

        clock = {
          format = "󰥔 {:%H:%M}";
          format-alt = "󰃮 {:%Y-%m-%d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        bluetooth = {
          format = "󰂯 {device_alias}";
          on-click = "kitty -e bluetoothctl";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        };

        cpu = {
          format = "󰘚 {usage}%";
          tooltip = true;
          interval = 2;
        };

        memory = {
          format = "󰍛 {used:.2f}G";
          interval = 2;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "󰂰 {volume}%";
          format-muted = "󰝟";
          format-icons = {
            default = ["󰕿" "󰖀" "󰕾"];
          };
          on-click = "kitty -e pulsemixer";
          on-click-right = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        };

        battery = {
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂄 {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          tooltip = true;
          interval = 10;
        };
      }
    ];
  };

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod1";
      terminal = "kitty";
      bars = [
        {
          command = "waybar";
        }
      ];

      startup = let
        tmuxStartupScript = pkgs.writeShellScript "tmux-startup" ''
          ${pkgs.tmux}/bin/tmux new-session -d -s nix -c ~/ws/nix \; send-keys "nvim" Enter
          ${pkgs.tmux}/bin/tmux new-window -t nix -c ~/ws/nix
          ${pkgs.tmux}/bin/tmux new-session -d -s school -c ~/ws/archive/school
          ${pkgs.tmux}/bin/tmux attach -t nix
        '';
      in [
        {
          command = "${pkgs.brave}/bin/brave --restore-last-session";
        }
        {
          command = "swaymsg 'workspace 2; exec ${pkgs.kitty}/bin/kitty -e ${tmuxStartupScript}'";
        }
        {
          command = "1password";
        }
      ];

      assigns = {
        "1" = [{class = "Brave-browser";}];
        "10" = [{class = "1Password";}];
      };

      workspaceAutoBackAndForth = true;
      window.titlebar = false;

      modes = {
        resize = {
          "h" = "resize shrink width 5 px or 5 ppt";
          "j" = "resize grow height 5 px or 5 ppt";
          "k" = "resize shrink height 5 px or 5 ppt";
          "l" = "resize grow width 5 px or 5 ppt";
          "Return" = "exec rm -f /tmp/sway-resize && sleep 0.1 && pkill -RTMIN+8 waybar; mode default";
          "Escape" = "exec rm -f /tmp/sway-resize && sleep 0.1 && pkill -RTMIN+8 waybar; mode default";
        };
      };

      colors = with config.theme.colors; {
        focused = {
          border = highlightHigh;
          background = base;
          inherit text;
          indicator = highlightHigh;
          childBorder = highlightHigh;
        };
        unfocused = {
          border = highlightLow;
          background = base;
          text = muted;
          indicator = highlightLow;
          childBorder = highlightLow;
        };
        focusedInactive = {
          border = highlightMed;
          background = base;
          text = subtle;
          indicator = highlightMed;
          childBorder = highlightMed;
        };
        urgent = {
          border = gold;
          background = base;
          inherit text;
          indicator = gold;
          childBorder = gold;
        };
        placeholder = {
          border = muted;
          background = base;
          inherit text;
          indicator = muted;
          childBorder = muted;
        };
        background = base;
      };

      keybindings = lib.mkOptionDefault {
        "F4" = "exec grim -g \"$(slurp)\" - | wl-copy";
        "Shift+F4" = "exec grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png";
        "${modifier}+r" = "exec touch /tmp/sway-resize && sleep 0.1 && pkill -RTMIN+8 waybar; mode resize";
        "${modifier}+d" = "exec rofi -show drun";

        "${modifier}+s" = null;
        "${modifier}+w" = null;
      };
    };
  };
}
