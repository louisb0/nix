{
  programs.rofi = {
    enable = true;
    theme = ./rofi-theme.rasi;
    extraConfig = {
      drun-display-format = "{name}";
      modi = "drun";

      kb-secondary-copy = "";
      kb-cancel = "Escape,Control+c";
    };
  };
}
