return function()
    require("neogit").setup {
        signs = {
            -- { CLOSED, OPENED }
            section = { "", "" },
            item = { "", "" },
            hunk = { "", "" },
        },
        integrations = {
            diffview = true,
        },
    }
end
