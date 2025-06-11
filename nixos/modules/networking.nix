{
  networking = {
    hostName = "thinkpad";
    networkmanager.enable = true;
    extraHosts = ''
      127.0.0.1 reddit.com
      127.0.0.1 www.reddit.com
      127.0.0.1 linkedin.com
      127.0.0.1 www.linkedin.com
    '';
  };
}
