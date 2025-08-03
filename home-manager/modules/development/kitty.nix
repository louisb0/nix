{config, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      disable_ligatures = "always";
    };
    font = {
      inherit (config.theme.font) name;
      size = 13;
    };
    themeFile = "rose-pine-moon";
  };
}
