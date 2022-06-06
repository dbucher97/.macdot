return function ()
  local home = vim.fn.expand("~/slipbox")
  print(home)
  require('telekasten').setup{
    home = home,
    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',
    template_new_note = home .. '/' .. 'templates/new_note.md',
    template_new_daily = home .. '/' .. 'templates/daily.md',
    template_new_weekly= home .. '/' .. 'templates/weekly.md',
  }
end
