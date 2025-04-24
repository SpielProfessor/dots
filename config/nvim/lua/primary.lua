-------------------
-- P R I M A R Y --
-------------------
-- extending everforest.nvim
-- based on https://github.com/primary-theme

-- base colourscheme - everforest
local everforest = require("everforest");
everforest.setup({
  background="hard",
  transparency_background_level = 0,
  italics = true,
  disable_italic_comments = false,
  colours_override = function(palette)
    palette.bg_dim    = "#26211C"
    palette.bg0       = "#2E261F"
    palette.bg1       = "#201b17"
    palette.bg2       = "#2A241E"
    palette.bg3       = "#241F19"
    palette.bg4       = "#4d3d2c"
    palette.bg5       = "#3b2c20"
    palette.bg_visual = "#6c4f38"
    palette.bg_red    = "#512D2C"
    palette.bg_green  = "#117449"
    palette.bg_blue   = "#2E3F3D"
    palette.bg_yellow = "#54411F"
    
  end,
});
everforest.load();
