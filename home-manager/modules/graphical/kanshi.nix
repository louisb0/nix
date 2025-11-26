{
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile = {
          name = "undocked";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
              scale = 1.2;
            }
          ];
        };
      }
      {
        profile = {
          name = "docked";
          outputs = [
            {
              criteria = "eDP-1";
              status = "disable";
            }
            {
              criteria = "HDMI-A-1";
              status = "enable";
            }
          ];
        };
      }
      {
        profile = {
          name = "docked2";
          outputs = [
            {
              criteria = "eDP-1";
              status = "disable";
            }
            {
              criteria = "DP-2";
              status = "enable";
              mode = "1920x1080@60Hz";
            }
          ];
        };
      }
    ];
  };
}
