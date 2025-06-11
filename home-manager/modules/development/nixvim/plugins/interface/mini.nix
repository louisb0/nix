{
  plugins.mini = {
    enable = true;
    modules = {
      ai = {};
      surround = {};
      icons = {};
      statusline = {
        use_icons = true;
      };
    };
  };

  extraConfigLua = ''
    local statusline = require('mini.statusline')
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  '';
}
