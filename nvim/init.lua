--  ____              _     _ _       _   _                 _
-- |  _ \  __ ___   _(_) __| ( )___  | \ | | ___  _____   _(_)_ __ ___
-- | | | |/ _` \ \ / / |/ _` |// __| |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |_| | (_| |\ V /| | (_| | \__ \ | |\  |  __/ (_) \ V /| | | | | | |
-- |____/ \__,_| \_/ |_|\__,_| |___/ |_| \_|\___|\___/ \_/ |_|_| |_| |_|
--
-- For Neovim version 0.7

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local core_modules = { "options", "plugins", "keymaps" }

for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Error Loading " .. module .. "\n\n" .. err)
    end
end

-- require 'functions'

-- vim.cmd [[
-- augroup auto_update
-- autocmd!
-- autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua :so % | PackerSync
-- autocmd BufWritePost ~/.config/nvim/lua/plugins/_*.lua :PackerCompile
-- augroup END
-- ]]
--

_G.CloseAllFloatingWindows = function()
    local closed_windows = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= "" then -- is_floating_window?
            vim.api.nvim_win_close(win, false) -- do not force
            table.insert(closed_windows, win)
        end
    end
    print(
        string.format(
            "Closed %d windows: %s",
            #closed_windows,
            vim.inspect(closed_windows)
        )
    )
end
