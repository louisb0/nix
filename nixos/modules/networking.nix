{
  networking = {
    hostName = "thinkpad";
    networkmanager.enable = true;
    extraHosts = ''
      127.0.0.1 reddit.com
      127.0.0.1 www.reddit.com
      127.0.0.1 linkedin.com
      127.0.0.1 www.linkedin.com
      127.0.0.1 discord.com
      127.0.0.1 www.discord.com
      127.0.0.1 discord.app
      127.0.0.1 www.discord.app
      127.0.0.1 discord.gg
      127.0.0.1 www.discord.gg
      127.0.0.1 gateway.discord.gg
      127.0.0.1 cdn.discordapp.com
      127.0.0.1 media.discordapp.net
      127.0.0.1 images-ext-1.discordapp.net
      127.0.0.1 images-ext-2.discordapp.net
    '';
  };
}
