{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    noto-fonts-color-emoji
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["Noto Color Emoji"];
    };
  };
}
