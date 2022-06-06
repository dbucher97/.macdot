return function()
  require("tmux").setup({
    -- overwrite default configuration
    -- here, e.g. to enable default bindings
    copy_sync = {
      -- enables copy sync and overwrites all register actions to
      -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
      enable = true,
    },
    navigation = {
      -- enables default keybindings (C-hjkl) for normal mode
      enable_default_keybindings = true,
      cycle_navigation = false,
      tiling_window_manager = {
        h = "yabai -m window --focus west",
        j = "yabai -m window --focus south",
        k = "yabai -m window --focus north",
        l = "yabai -m window --focus east",
      },
    },
    resize = {
      -- enables default keybindings (A-hjkl) for normal mode
      enable_default_keybindings = true,
      resize_step_x = 10,
      resize_step_y = 5,
    }
  })
end
