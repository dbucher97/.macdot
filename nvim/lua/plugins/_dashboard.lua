return function()
  local db = require('dashboard')
  db.header_pad = 10
  db.custom_center = {
    -- { icon = '  ',
    --   desc = 'Recently latest session                  ',
    --   shortcut = 'SPC s l',
    --   action = 'SessionLoad' },
    { icon = '  ',
      desc = 'New File                                ',
      action = 'DashboardNewFile',
      shortcut = '   :new' },
    { icon = '  ',
      desc = 'Find File                               ',
      action = 'Telescope find_files',
      shortcut = 'SPC f f' },
    { icon = '  ',
      desc = 'File Browser                            ',
      action = 'Telescope file_browser',
      shortcut = 'SPC f b' },
    { icon = '  ',
      desc = 'Live grep                               ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f g' },
  }
end
